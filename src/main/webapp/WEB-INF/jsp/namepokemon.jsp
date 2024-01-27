<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%
    pokemon namepokemon = (pokemon) session.getAttribute("namepokemon");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>同一ポケモン</title>
    <style rel="stylesheet" href="css/stop.css"></style>
</head>
<body>
    <p class="bounce">申し訳ございませんが<%=namepokemon.getName()%>は既に存在します。</p>
    <div class="additional-message">
        <a href="pokemonSkillServlet">やり直してください</a>
    </div>
</body>
</html>
