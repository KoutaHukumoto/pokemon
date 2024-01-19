<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<pokemon> pokemonlist = (ArrayList<pokemon>) request.getAttribute("pokemonlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>戦わせるポケモン一覧</title>
</head>
<body>
	<h2>戦えるポケモン一覧</h2>
	<h3>仲間のポケモン</h3>
	<h3>敵のポケモン</h3>
	<% for(pokemon npokemon : pokemonlist){ %>
	<p>名前: <%=npokemon.getName()%></p>
    <p>タイプ: <%=npokemon.getType()%></p>
    <p>技1: <%=npokemon.getSkill1()%></p>
    <p>技2: <%=npokemon.getSkill2()%></p>
    <p>技3: <%=npokemon.getSkill3()%></p>
    <p>技4: <%=npokemon.getSkill4()%></p>
    <p>HP: <%=npokemon.getHp()%></p>
    <p>攻撃: <%=npokemon.getAttack()%></p>
    <p>防御: <%=npokemon.getDefence()%></p>
    <p>特攻: <%=npokemon.getSpattack()%></p>
    <p>特防: <%=npokemon.getSpdefence()%></p>
    <p>速さ: <%=npokemon.getSpeed()%></p>
   <% } %>
</body>
</html>