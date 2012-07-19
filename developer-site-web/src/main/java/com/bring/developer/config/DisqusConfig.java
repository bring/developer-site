package com.bring.developer.config;

import org.constretto.ConstrettoConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DisqusConfig {

    private static boolean disqusDeveloper = true;

    @Autowired
    DisqusConfig(ConstrettoConfiguration configuration) {
    }

    public static boolean isDisqusDeveloper() {
        return disqusDeveloper;
    }
}
