package com.bring.developer.dao;

import java.net.URLConnection;

public class DownloadDao {

    public String getMimeType(String filename) {
        return URLConnection.guessContentTypeFromName(getClass().getResource("apireference.xml").getFile());
    }
    
}
