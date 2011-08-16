package no.bring.jetty;

import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.AbstractHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class ShutdownHandler extends AbstractHandler {

    private final Server server;
    private final String secret;

    public ShutdownHandler(Server server, String secret) throws MalformedURLException {
        this.server = server;
        this.secret = secret;
    }

    public void handle(String target, Request serverRequest, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!target.equals("/shutdown") || !request.getMethod().equals("POST") || !secret.equals(request.getParameter("secret")))
            return;

        try {
            System.out.println("Shutting down");
            server.stop();
        } catch (Exception ignored) {
        }
        System.exit(0);
    }

    public static void shutdown(int port, String shutdownSecret) {
        try {
            URL url = new URL("http://127.0.0.1:" + port + "/shutdown?secret=" + shutdownSecret);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.getResponseCode();
        } catch (IOException ignored) {
        }
    }
}
