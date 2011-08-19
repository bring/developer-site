package no.bring.jetty;

import org.eclipse.jetty.http.HttpException;
import org.eclipse.jetty.server.HttpConnection;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.handler.AbstractHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.SocketException;
import java.net.URL;


public class BigIpHealthCheckHandler extends AbstractHandler {

    public void handle(String target, Request serverRequest, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (!target.equals("/bigip.txt")) return;

        if (!request.getMethod().equals("GET")) throw new HttpException(HttpServletResponse.SC_BAD_REQUEST);

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("text/plain");
        response.getWriter().println("node is ok");
        response.getWriter().close();

        HttpConnection.getCurrentConnection().getRequest().setHandled(true);
    }

    public static boolean check(int port) {
        try {
            URL url = new URL("http://localhost:" + port + "/bigip.txt");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.getResponseCode();
            return true;
        } catch (SocketException e) {
            return false;
        } catch (IOException e) {
            return false;
        }

    }

}
