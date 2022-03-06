package com.tk_lab.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 使用ライブラリ・環境ページ用のコントローラー
 */
@Controller
public class LibAndEnvPageController {

    private static final Logger logger = LoggerFactory.getLogger(LibAndEnvPageController.class);

    /**
     * 使用ライブラリ・環境ページを開く時のメソッド。
     */
    @RequestMapping(value = "/lib_and_env", method = RequestMethod.GET)
    public String initLibAndEnv() {

        return "lib_and_env";
    }
}
