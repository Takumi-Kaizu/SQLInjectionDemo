package com.tk_lab.demo.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tk_lab.demo.entity.DemoTable;
import com.tk_lab.demo.form.LoginForm;
import com.tk_lab.demo.service.DemoService;

/**
 * SQLインジェクションを体験するページ用のコントローラー
 */
@Controller
public class SQLInjectionPageController {

    private static final Logger logger = LoggerFactory.getLogger(SQLInjectionPageController.class);

    @Autowired
    private DemoService demoService;

    /**
     * SQLインジェクション体験ページを開く時のメソッド。
     */
    @RequestMapping(value = "/sql_Injection", method = RequestMethod.GET)
    public String initSqlInjection(@ModelAttribute LoginForm loginForm, Model model) {

        model.addAttribute("loginForm", new LoginForm());

        return "sql_Injection";
    }

    /**
     * ログイン画面で入力されたパスワードの整合性を判定するメソッド
     * @param aa ログイン画面の入力値を保存するform
     * @param result 入力値のバリデーション結果
     * @param model ControllerからViewに値を受け渡すためのパラメータ
     * @return ログイン画面のJSPファイル名 or 勤務時間選択画面のJSPファイル名
     */
    @RequestMapping(value = "/display_db_data")
    public String loginProcess(@ModelAttribute("loginForm") @Valid LoginForm aa, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "sql_Injection";
        }

        DemoTable dt = null;
        try {
            dt = demoService.getDemoData(aa);
        } catch (BadSqlGrammarException e) {
            model.addAttribute("message", "不正なパスワード文字列が入力されました。");
            return "sql_Injection";
        } catch (Exception e) {
            model.addAttribute("message", "予期しないエラーが発生しました。");
            return "sql_Injection";
        }

        // パスワードが正しい場合、
        if (dt != null) {
            model.addAttribute("id", dt.getId());
            model.addAttribute("name", dt.getName());
            model.addAttribute("password", dt.getPassword());
            model.addAttribute("sex", dt.getSex());
            model.addAttribute("age", dt.getAge());
            model.addAttribute("mail", dt.getMail());
            model.addAttribute("address", dt.getAddress());
            return "sql_Injection";
        } else {
            model.addAttribute("message", "該当データがありません。");
            return "sql_Injection";
        }
    }
}
