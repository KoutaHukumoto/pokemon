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
<title>登録モンスターリスト</title>
<link rel="stylesheet" href="css/list.css">
<script src="js/base.js"></script>
<script src="js/sorttable.js"></script>
</head>
<body>
	<h2>登録モンスターリスト</h2>
	<table class="allytable">
		<tr>
			<th class="name">名前</th>
			<th class="type">タイプ</th>
			<th>技1</th>
			<th>技2</th>
			<th>技3</th>
			<th>技4</th>
			<th class="stats">HP  <span><button onclick="sortTable('allytable',6, 'asc')">▲</button><button onclick="sortTable('allytable',6, 'desc')">▼</button></span></th>
			<th class="stats">攻撃  <span><button onclick="sortTable('allytable',7, 'asc')">▲</button><button onclick="sortTable('allytable',7, 'desc')">▼</button></span></th>
			<th class="stats">防御  <span><button onclick="sortTable('allytable',8, 'asc')">▲</button><button onclick="sortTable('allytable',8, 'desc')">▼</button></span></th>
			<th class="stats">特攻  <span><button onclick="sortTable('allytable',9, 'asc')">▲</button><button onclick="sortTable('allytable',9, 'desc')">▼</button></span></th>
			<th class="stats">特防  <span><button onclick="sortTable('allytable',10, 'asc')">▲</button><button onclick="sortTable('allytable',10, 'desc')">▼</button></span></th>
			<th class="stats">速さ  <span><button onclick="sortTable('allytable',11, 'asc')">▲</button><button onclick="sortTable('allytable',11, 'desc')">▼</button></span></th>
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