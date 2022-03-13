package com.tk_lab.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * クロスサイトスクリプティングの体験画面用のコントローラー
 */
@Controller
public class XSiteScriptingController {

    private static final Logger logger = LoggerFactory.getLogger(LibAndEnvPageController.class);

    /**
     * クロスサイトスクリプティングの体験ページを開く時のメソッド。
     */
    @RequestMapping(value = "/x_site_scripting", method = RequestMethod.GET)
    public String initXSiteScripting() {

        return "x_site_scripting";
    }
}
