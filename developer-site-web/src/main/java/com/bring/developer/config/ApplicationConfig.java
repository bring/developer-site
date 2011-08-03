package com.bring.developer.config;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.client.HttpClient;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.constretto.ConstrettoConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplicationConfig {

    ConstrettoConfiguration config;

    @Autowired
    public void setConstrettoConfig(ConstrettoConfiguration config) {
        this.config = config;
    }

    @Bean
    public HttpClient createHttpClient() {
        HttpParams params = new BasicHttpParams();
        params.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, config.evaluateToInt("http.client.connection.timeout"));
        params.setParameter(CoreConnectionPNames.SO_TIMEOUT, config.evaluateToInt("http.client.socket.timeout"));

        String proxyHost = config.evaluateToString("http.client.proxy.host");
        if (StringUtils.isNotBlank(proxyHost)) {
            HttpHost proxy = new HttpHost(proxyHost, config.evaluateToInt("http.client.proxy.port"));
            params.setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);
        }

        ThreadSafeClientConnManager connectionManager = new ThreadSafeClientConnManager();
        return new DefaultHttpClient(connectionManager, params);
    }
}