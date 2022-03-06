package com.tk_lab.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * トップページ用のコントローラー
 */
@Controller
public class TopPageController {

    private static final Logger logger = LoggerFactory.getLogger(TopPageController.class);

    /**
     * トップページを開く時のメソッド。
     * 備忘録
     * 1.コントローラー（ここ）で受け付け
     * 2.受け付けたコントローラーメソッドで処理（モデル（サービスクラス、DAO クラス））
     * 3.処理結果をビューへ渡す。
     */
    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public String home() {

        return "top";
    }

}
