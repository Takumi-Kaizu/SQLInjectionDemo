package com.tk_lab.demo.form;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginForm {

	// DBはvarcharだけど(DBは関係ない）クライアント側がどんな型でいれるかが問題
	// ここに定義された "password" 変数に対して、空判定とサイズ判定を行っている。
	// バリデーション違反の場合のメッセージを設定可能。
	@NotEmpty(message = "空欄は不可です。パスワードを入力してください。")
	@Size(max = 100, message = "最高１００桁以内でパスワードを入力ください。")
	private String password;

	private String id;

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}