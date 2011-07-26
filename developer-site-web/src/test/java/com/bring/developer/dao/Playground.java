package com.bring.developer.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URISyntaxException;

import org.junit.Test;

public class Playground {

    @Test
    public void shouldFindResource() throws IOException, URISyntaxException {
        InputStream in = getClass().getResourceAsStream("foo/.");
        BufferedReader rdr = new BufferedReader(new InputStreamReader(in));
        String line;
        while ((line = rdr.readLine()) != null) {
            System.out.println("file: " + line);
        }
        rdr.close();
    }
}
