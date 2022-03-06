package com.tk_lab.demo.service;

import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import com.tk_lab.demo.entity.DemoTable;
import com.tk_lab.demo.form.LoginForm;
import com.tk_lab.demo.mapper.DemoTableMapper;

@Service
public class DemoService {

    private static final Logger logger = LoggerFactory.getLogger(DemoService.class);

    @Autowired
    private DemoTableMapper mapper;

    /**
     * ログイン画面で入力されたパスワードでメンバーのオブジェクトを取得する
     * @param password ログイン画面で入力されたパスワード
     * @return メンバーのオブジェクト
     */
    public DemoTable getDemoData(LoginForm aa) throws BadSqlGrammarException {

        DemoTable dt = mapper.selectUserDataVerNoGuardSQLInjection(processSqlParameter(aa.getId()), aa.getPassword());
        if (Objects.nonNull(dt)) {
            return dt;
        } else {
            return null;
        }
    }

    /**
     * SQL に渡すパラメータ文字列の前後に「'」を付加する。<br>
     * こうすることで、SQL 文法エラーを回避する。
     */
    private String processSqlParameter(String param) {
        return "'" + param + "'";
    }
}
