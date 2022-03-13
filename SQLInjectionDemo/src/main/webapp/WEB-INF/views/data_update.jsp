<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>テストデータの登録/更新/削除</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h1 class="py-4 display-3 justify-content-center">SQLインジェクションを体験！</h1>
        <nav class="nav nav-tabs nav-pills nav-fill">
            <a class="nav-link active" aria-current="page" href="./top">このシステムについて</a>
            <a class="nav-link" href="./sql_Injection">実体験！SQLインジェクション</a>
            <a class="nav-link" href="./x_site_scripting">実体験！クロスサイトスクリプティング</a>
            <a class="nav-link" href="./data_update">テストデータの登録/更新/削除</a>
            <a class="nav-link" href="./lib_and_env" tabindex="-1"
                aria-disabled="true">使用ライブラリ・環境</a>
        </nav>
    </div>
    <!-- TODO 登録と更新は同じページを使用する(クロスサイトスクリプティングの脆弱性を意識) -->
    <!-- TODO 削除は上記とは別ページを使用する -->
    <!-- TODO 登録ボタン押下 → 登録/更新ページ表示 → 登録押下 → データ登録 -->
    <!-- TODO 更新ボタン押下 → 更新対象のデータを ID検索 → 登録/更新ページ表示 → 更新内容入力 → 更新押下 → データ更新 -->
    <!-- TODO 削除ボタン押下 → 削除対象のデータを ID検索 → 削除用ページ表示 → 削除押下 → データ削除 -->
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
