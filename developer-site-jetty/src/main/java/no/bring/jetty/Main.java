package no.bring.jetty;

import org.apache.commons.io.FileUtils;
import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.nio.SelectChannelConnector;
import org.eclipse.jetty.util.thread.QueuedThreadPool;
import org.eclipse.jetty.webapp.WebAppContext;

import java.io.File;
import java.io.IOException;
import java.security.ProtectionDomain;

public class Main {

    private final int port;
    private final String contextPath;
    private final String workPath;
    private final String shutdownSecret;

    public static void main(String[] args) throws Exception {
        Main sc = new Main();

        if (args.length != 1)              sc.usage();
        else if ("status".equals(args[0])) sc.status();
        else if ("stop".equals(args[0]))   sc.stop();
        else if ("start".equals(args[0]))  sc.start();
        else                               sc.usage();
    }

    public Main() throws IOException {
        port = Integer.parseInt(System.getProperty("jetty.port", "8080"));
        contextPath = System.getProperty("jetty.contextPath", "/");
        workPath = System.getProperty("jetty.workDir", null);
        shutdownSecret = System.getProperty("jetty.shutdownSecret", "d41d8cd98f00b204e9800998ecf8427e");
    }

    private void stop() {
        ShutdownHandler.shutdown(port, shutdownSecret);
    }

    private void status() {
        System.out.println(BigIpHealthCheckHandler.check(port) ? "OK" : "FAIL");
    }

    private void start() {
        try {
            Server srv = new Server();

            QueuedThreadPool threadPool = new QueuedThreadPool();
            threadPool.setMaxThreads(100);
            srv.setThreadPool(threadPool);

            Connector connector = new SelectChannelConnector();
            connector.setPort(port);
            connector.setMaxIdleTime(30000);
            srv.setConnectors(new Connector[]{connector});

            ProtectionDomain protectionDomain = Main.class.getProtectionDomain();
            String warFile = protectionDomain.getCodeSource().getLocation().toExternalForm();
            String currentDir = new File(protectionDomain.getCodeSource().getLocation().getPath()).getParent();

            WebAppContext context = new WebAppContext(warFile, contextPath);
            context.setServer(srv);
            setTempDirectory(context, currentDir);

            HandlerList handlers = new HandlerList();
            handlers.addHandler(context);
            handlers.addHandler(new ShutdownHandler(srv, shutdownSecret));
            handlers.addHandler(new BigIpHealthCheckHandler());
            srv.setHandler(handlers);

            srv.setStopAtShutdown(true);

            srv.start();
            srv.join();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setTempDirectory(WebAppContext context, String currentDir) throws IOException {
        File workDir;
        if (workPath != null) {
            workDir = new File(workPath);
        } else {
            workDir = new File(currentDir, "work");
        }
        FileUtils.cleanDirectory(workDir);
        context.setTempDirectory(workDir);
    }

    private void usage() {
        System.out.println("Usage: java -jar <file.jar> [start|stop|status]");
        System.exit(-1);
    }

}
