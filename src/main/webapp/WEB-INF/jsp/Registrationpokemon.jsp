<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%
    pokemon pokemon = (pokemon) session.getAttribute("pokemon");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>オリジナルモンスター登録</title>
    <link rel="stylesheet" href="css/Registration.css">
    <script src="js/base.js"></script>
</head>
<body>
    <h2>モンスターが登録されました</h2>
    <p>名前: <%=pokemon.getName()%></p>
    <p>タイプ: <%=pokemon.getType()%></p>
    <p>技1: <%=pokemon.getSkill1()%></p>
    <p>技2: <%=pokemon.getSkill2()%></p>
    <p>技3: <%=pokemon.getSkill3()%></p>
    <p>技4: <%=pokemon.getSkill4()%></p>
    <p>HP: <%=pokemon.getHp()%></p>
    <p>攻撃: <%=pokemon.getAttack()%></p>
    <p>防御: <%=pokemon.getDefence()%></p>
    <p>特攻: <%=pokemon.getSpattack()%></p>
    <p>特防: <%=pokemon.getSpdefence()%></p>
    <p>速さ: <%=pokemon.getSpeed()%></p>
    <a href="pokemon.html">ホームへ戻る</a>
</body>
</html>
