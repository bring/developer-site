package com.bring.developer.config;

import com.bring.developer.interceptor.GoogleAnalyticsIDInterceptor;
import org.apache.http.HttpHost;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.constretto.ConstrettoConfiguration;
import org.constretto.exception.ConstrettoExpressionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;
import org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping;

import java.util.Map;
import java.util.Properties;

@Configuration
public class ApplicationConfig {

    ConstrettoConfiguration config;

    public static String FRAKTGUIDE_URL_FOR_ENVIRONMENT = "http://fraktguide.bring.no/fraktguide"; //default
    public static String STATISTICS_TRACKER_ID_FOR_ENVIRONMENT = "1000918585199"; //default - test tracker
    public static String BOOKING_URL_FOR_ENVIRONMENT = "http://beta.bring.com/booking"; //default
    public static String GOOGLE_ANALYTICS_ID = "UA-33478893-1"; //default
    public static boolean CLASSPATH_XML_FILES = true; //default

    @Autowired
    public void setConstrettoConfig(ConstrettoConfiguration config) {
        this.config = config;
        FRAKTGUIDE_URL_FOR_ENVIRONMENT = config.evaluateToString("fraktguideUrl");
        BOOKING_URL_FOR_ENVIRONMENT = config.evaluateToString("bookingUrl");
        CLASSPATH_XML_FILES = config.evaluateToBoolean("classpathXmlFiles");
        GOOGLE_ANALYTICS_ID = config.evaluateToString("googleAnalyticsID");
    }

    @Bean
    public HttpClient createHttpClient() {
        HttpParams params = new BasicHttpParams();
        params.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, config.evaluateToInt("http.client.connection.timeout"));
        params.setParameter(CoreConnectionPNames.SO_TIMEOUT, config.evaluateToInt("http.client.socket.timeout"));

        try {
            HttpHost proxy = new HttpHost(config.evaluateToString("http.client.proxy.host"), config.evaluateToInt("http.client.proxy.port"));
            params.setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);
        }
        catch (ConstrettoExpressionException notFound) {
            // Ok, no proxy
        }

        ThreadSafeClientConnManager connectionManager = new ThreadSafeClientConnManager();
        return new DefaultHttpClient(connectionManager, params);
    }

    public String getFraktguideUrlForEnvironment() {
        return FRAKTGUIDE_URL_FOR_ENVIRONMENT;
    }
    
    public String getBookingUrlForEnvironment() {
        return BOOKING_URL_FOR_ENVIRONMENT;
    }

    public static String getStatisticsTrackerIdForEnvironment() {
        return STATISTICS_TRACKER_ID_FOR_ENVIRONMENT;
    }

    public static String getGoogleAnalyticsIDForEnvironment(){
        return GOOGLE_ANALYTICS_ID;
    }
}