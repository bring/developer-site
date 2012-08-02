package com.bring.developer.interceptor;

import com.bring.developer.config.ApplicationConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.constretto.ConstrettoConfiguration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoogleAnalyticsIDInterceptor extends HandlerInterceptorAdapter{

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
        /* If there is no modelAndView, do nothing. This is the case for calls to /proxy/.. */
        if(modelAndView != null){
            String googleTrackerIDForEnvironment = ApplicationConfig.getGoogleAnalyticsIDForEnvironment();
            modelAndView.getModelMap().addAttribute("googleTrackerID", googleTrackerIDForEnvironment);
        }
    }

}
