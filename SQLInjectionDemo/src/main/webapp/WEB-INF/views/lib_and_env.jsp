<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>使用ライブラリ・環境</title>
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
            <a class="nav-link" href="./sql_Injection">実体験！SQLインジェクション</a>
            <a class="nav-link active" href="./lib_and_env"
                tabindex="-1" aria-disabled="true">使用ライブラリ・環境</a>
        </nav>
        <div class="row">
            <div class="col-sm-12 py-3">
                <h2>使用しているライブラリ</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-10 py-3">
                <ul class="list-group">
                    <li class="list-group-item">MyBatis 3.4.1</li>
                    <li class="list-group-item">springframework 4.3.3.RELEASE</li>
                    <li class="list-group-item">bootstrap 5.0.2</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 py-3">
                <h2>開発環境</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-10 py-3">
                <ul class="list-group">
                    <li class="list-group-item">Eclipse 2020-12 (4.18.0)</li>
                    <li class="list-group-item">MySQL 8.0.27</li>
                    <li class="list-group-item">Tomcat 9.0.41</li>
                </ul>
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