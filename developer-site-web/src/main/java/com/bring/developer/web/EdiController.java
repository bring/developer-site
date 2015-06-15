package com.bring.developer.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EdiController {

    @RequestMapping("/edi")
    public String index() {
        return "edi/index";
    }

    @RequestMapping("/edi/transportinstruks")
    public String transportinstruks() {
        return "edi/transportinstruks";
    }

    @RequestMapping("/edi/tolldokumenter")
    public String tolldokumenter() {
        return "edi/tolldokumenter";
    }

    @RequestMapping("/edi/management")
    public String management() {
        return "edi/management";
    }

    @RequestMapping("/edi/ig-for-efaktura")
    public String ig_for_efaktura() {
        return "edi/ig-for-efaktura";
    }

    @RequestMapping("/edi/statuskoder-iftsta")
    public String statuskoder_iftsta() {
        return "edi/statuskoder-iftsta";
    }

    @RequestMapping("/edi/spesifikasjon-transportetikett")
    public String spesifikasjon_transportetikett() {
        return "edi/spesifikasjon-transportetikett";
    }

}
