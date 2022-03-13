package com.tk_lab.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * テストデータの登録/更新/削除画面用のコントローラー
 */
@Controller
public class DataUpdateController {

    private static final Logger logger = LoggerFactory.getLogger(LibAndEnvPageController.class);

    /**
     * テストデータの登録/更新/削除ページを開く時のメソッド。
     */
    @RequestMapping(value = "/data_update", method = RequestMethod.GET)
    public String initDataUpdate() {

        return "data_update";
    }
}
