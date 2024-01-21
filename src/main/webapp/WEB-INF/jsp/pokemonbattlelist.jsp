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
<title>戦わせるポケモン一覧</title>
<link rel="stylesheet" href="css/battlelist.css">
<script src="js/base.js"></script>
<script src="js/battlelist.js"></script>
<body>
	<h2>戦えるポケモン一覧</h2>
	<div class="battle-container">
		<div class="pokemon-list ally">
			<h2>味方の選択したポケモン</h2>
			<table class="getpokemon">
				<tr>
					<th class="name">名前</th>
					<th class="type">タイプ</th>
					<th class="skill">技1</th>
					<th class="skill">技2</th>
					<th class="skill">技3</th>
					<th class="skill">技4</th>
					<th class="stats">HP</th>
					<th class="stats">攻撃</th>
					<th class="stats">防御</th>
					<th class="stats">特攻</th>
					<th class="stats">特防</th>
					<th class="stats">速さ</th>
				</tr>
				<tr></tr>
			</table>
		</div>
		<div class="pokemon-list ally">
			<h2>敵の選択したポケモン</h2>
			<table class="getnpokemon">
				<tr>
					<th class="name">名前</th>
					<th class="type">タイプ</th>
					<th class="skill">技1</th>
					<th class="skill">技2</th>
					<th class="skill">技3</th>
					<th class="skill">技4</th>
					<th class="stats">HP</th>
					<th class="stats">攻撃</th>
					<th class="stats">防御</th>
					<th class="stats">特攻</th>
					<th class="stats">特防</th>
					<th class="stats">速さ</th>
				</tr>
				<tr></tr>
			</table>
		</div>
	</div>
	<div class="battle-container">
		<div class="pokemon-list ally">
			<h3>仲間のポケモン</h3>
			<table>
				<tr>
					<th class="name">名前</th>
					<th class="type">タイプ</th>
					<th class="skill">技1</th>
					<th class="skill">技2</th>
					<th class="skill">技3</th>
					<th class="skill">技4</th>
					<th class="stats">HP</th>
					<th class="stats">攻撃</th>
					<th class="stats">防御</th>
					<th class="stats">特攻</th>
					<th class="stats">特防</th>
					<th class="stats">速さ</th>
					<th>選択</th>
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
					<td><button data-pokemon-id="<%=mpokemon.getId()%>" onclick="selectPokemon('<%=mpokemon.getId()%>')">選択</button></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<div class="pokemon-list enemy">
			<h3>敵のポケモン</h3>
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
					<th>選択</th>
				</tr>
				<%
				for (pokemon npokemon : pokemonlist) {
				%>
				<tr>
					<td><%=npokemon.getName()%></td>
					<td><%=npokemon.getType()%></td>
					<td><%=npokemon.getSkill1()%></td>
					<td><%=npokemon.getSkill2()%></td>
					<td><%=npokemon.getSkill3()%></td>
					<td><%=npokemon.getSkill4()%></td>
					<td><%=npokemon.getHp()%></td>
					<td><%=npokemon.getAttack()%></td>
					<td><%=npokemon.getDefence()%></td>
					<td><%=npokemon.getSpattack()%></td>
					<td><%=npokemon.getSpdefence()%></td>
					<td><%=npokemon.getSpeed()%></td>
					<td><button data-pokemon-id="<%=npokemon.getId()%>" onclick="selectnPokemon('<%=npokemon.getId()%>')">選択</button></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>

	<div class="home">
		<a href="pokemon.html">ホームへ戻る</a>
	</div>
</body>

</html>
