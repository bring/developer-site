package com.bring.developer.config.featuretoggle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FeatureToggleInterceptor extends HandlerInterceptorAdapter {

    private final FeatureToggle featureToggle;

    @Autowired
    public FeatureToggleInterceptor(FeatureToggle featureToggle) {
        this.featureToggle = featureToggle;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute(FeatureToggle.REQUEST_ATTRIBUTE_NAME, featureToggle);

        return true;
    }
}
