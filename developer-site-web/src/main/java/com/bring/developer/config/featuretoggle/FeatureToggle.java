package com.bring.developer.config.featuretoggle;

import org.constretto.ConstrettoConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FeatureToggle {
    public static final String REQUEST_ATTRIBUTE_NAME = "featureToggle";
    private ConstrettoConfiguration config;

    private final boolean easyReturnService;

    @Autowired
    public FeatureToggle(ConstrettoConfiguration config) {
        this.config = config;
        this.easyReturnService = config.evaluateToBoolean("featureToggle.easyReturnService.enabled");
    }

    public boolean isEasyReturnService() {
        return easyReturnService;
    }
}
