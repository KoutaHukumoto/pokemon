<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<pokemon> pokemonlist = (ArrayList<pokemon>) session.getAttribute("pokemonlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録ポケモンリスト</title>
<link rel="stylesheet" href="css/list.css">
</head>
<body>
	<h2>登録ポケモンリスト</h2>
	<table>
		<tr>
			<th>名前</th>
			<th>タイプ</th>
			<th>技1</th>
			<th>技2</th>
			<th>技3</th>
			<th>技4</th>
			<th>HP</th>
			<th>攻撃</th>
			<th>防御</th>
			<th>特攻</th>
			<th>特防</th>
			<th>速さ</th>
		</tr>
		<%
		for (pokemon mpokemon : pokemonlist) {
		%>
		<tr>
			<td><%=mpokemon.getName()%></td>
			<td><%=mpokemon.getType()%></td>
			<td><%=mpokemon.getSkill1()%></td>
			<td><%=mpokemon.getSkill2()%></td>
			<td><%=mpokemon.getSkill3()%></td>
			<td><%=mpokemon.getSkill4()%></td>
			<td><%=mpokemon.getHp()%></td>
			<td><%=mpokemon.getAttack()%></td>
			<td><%=mpokemon.getDefence()%></td>
			<td><%=mpokemon.getSpattack()%></td>
			<td><%=mpokemon.getSpdefence()%></td>
			<td><%=mpokemon.getSpeed()%></td>
		</tr>
		<%
		}
		%>
	</table>
	</div>

	<div class="home">
		<a href="pokemon.html">ホームへ戻る</a>
	</div>
</body>
</html>