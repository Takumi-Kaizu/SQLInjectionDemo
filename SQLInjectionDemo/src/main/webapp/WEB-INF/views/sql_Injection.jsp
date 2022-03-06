<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>SQLインジェクション体験ページ</title>
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
            <a class="nav-link" aria-current="page" href="./top">このシステムについて</a>
            <a class="nav-link active" href="./sql_Injection">実体験！SQLインジェクション</a>
            <a class="nav-link" href="./lib_and_env" tabindex="-1"
                aria-disabled="true">使用ライブラリ・環境</a>
        </nav>
        <div class="row">
            <div class="col-sm-12 py-3">
                <h2>体験できる SQL インジェクションの概要</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-10 py-3">
                ここで体験できる SQL インジェクションは、ログイン情報の入力において、
                パスワード文字列のエスケープ処理の不備を突き、不正にデータを盗み見るというものです。<br>
                ここで使用する DB に格納されているデータは下記表の 3件です。<br>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>name</th>
                            <th>password</th>
                            <th>sex</th>
                            <th>age</th>
                            <th>mail</th>
                            <th>address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>100</td>
                            <td>Sample000</td>
                            <td>1234</td>
                            <td>female</td>
                            <td>24</td>
                            <td>sample000@sample.co.jp</td>
                            <td>千葉</td>
                        </tr>
                        <tr>
                            <td>110</td>
                            <td>SQL</td>
                            <td>4321</td>
                            <td>male</td>
                            <td>20</td>
                            <td>sql@sample.co.jp</td>
                            <td>東京</td>
                        </tr>
                        <tr>
                            <td>120</td>
                            <td>injection</td>
                            <td>1324</td>
                            <td>male</td>
                            <td>22</td>
                            <td>injection@sample.co.jp</td>
                            <td>神奈川</td>
                        </tr>
                    </tbody>
                </table>
                本来なら、上記の表にある id列と password列の値を評価し、合致するユーザー情報を表示します。<br>
                しかし、ここでは password
                に渡す値を不正なものにすることで、任意のユーザー情報へアクセスすることが可能です。<br>
                使用する不正な文字列は以下の通りです。コピペして使用してください。<br> ID : (何でも良い)<br>
                Password : 0 OR 1 = 1 LIMIT 1<br>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 py-3">
                <h2>体験できる SQL インジェクションの解説</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-10 py-3">
                ここで使用されている(実際に発行される) SQL 文は下記になります。<br>
                SELECT * FROM demo_table WHERE id = \${id} AND password = \${password}<br>
                本画面の ID の入力が \${id} に、Password の入力が \${password} にバインドされます。<br>
                これを踏まえて上記概要欄にある不正な文字列を入力すると、以下の SQL 文が発行されます。<br>
                SELECT * FROM demo_table WHERE id = sample AND password = 0 OR 1 = 1 LIMIT 1<br>
                この SQL は id が sample、かつ password が 0 もしくは 1 が 1 だったら検索結果の 1レコードのみ取り出す、というものです。<br>
                ポイントは「1 が 1 だったら」という部分です。<br>
                この条件は必ず成り立つものであるため、id、password を知らなくても内部のデータにアクセスすることができます。<br>
                (LIMIT 句を付けている理由は、使用しているライブラリの特性上、2件以上の結果を返すことができないためです)<br>
                不正な文字列の LIMIT 句より後ろに OFFSET 1 もしくは OFFSET 2 とすれば、2件目、3件目のデータにアクセスすることも可能です。<br>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 py-3">
                <h2>【実体験！SQL インジェクション】ログイン情報の入力</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-10 py-3">
                <f:form
                    action="${pageContext.request.contextPath }/display_db_data"
                    method="post" modelAttribute="loginForm">
            ID : <f:input type="text" path="id" class="my-1" />
                    <br>
            Password : <f:input type="password" path="password"
                        class="my-1" />
                    <br>
                    <input type="submit" class="my-1" value="ログイン">
                    <f:errors path="password" />
                    ${message}
                </f:form>
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>name</th>
                            <th>password</th>
                            <th>sex</th>
                            <th>age</th>
                            <th>mail</th>
                            <th>address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><c:if test="${id == null}">未取得</c:if>
                                <c:if test="${id != null}">${id}</c:if></td>
                            <td><c:if test="${name == null}">未取得</c:if>
                                <c:if test="${name != null}">${name}</c:if></td>
                            <td><c:if test="${password == null}">未取得</c:if>
                                <c:if test="${password != null}">${password}</c:if></td>
                            <td><c:if test="${sex == null}">未取得</c:if>
                                <c:if test="${sex != null}">${sex}</c:if></td>
                            <td><c:if test="${age == null}">未取得</c:if>
                                <c:if test="${age != null}">${age}</c:if></td>
                            <td><c:if test="${mail == null}">未取得</c:if>
                                <c:if test="${mail != null}">${mail}</c:if></td>
                            <td><c:if test="${address == null}">未取得</c:if>
                                <c:if test="${address != null}">${address}</c:if></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
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
