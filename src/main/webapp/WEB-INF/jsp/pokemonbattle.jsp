<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%
pokemon getpokemon = (pokemon) session.getAttribute("getpokemon");
pokemon getenemypokemon = (pokemon) session.getAttribute("getenemypokemon");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ポケモンバトル</title>
<script src="js/base.js"></script>
<link rel="stylesheet" href="css/battle.css">
</head>
<body>
	<div class="pokemonally">
		<h3>仲間のポケモン</h3>
		<div class="namebox">
			<h3>
				名前:<%=getpokemon.getName()%>
				HP：
				<meter low="0.3" high="0.7" optimum="0.8"
					style="width: 300px; height: 25px;" value="<%=getpokemon.getHp()%>"
					min="0" max="<%=getpokemon.getHp()%>"></meter>
			</h3>
		</div>
		<img class="allyimg" src="画像/pika○○2.jpg" alt="ポケモン">
		<div class="skill">
			<button><%=getpokemon.getSkill1()%></button>
			<button><%=getpokemon.getSkill2()%></button>
			<button><%=getpokemon.getSkill3()%></button>
			<button><%=getpokemon.getSkill4()%></button>
		</div>
		<div class="pokemonallies">
			<table>
				<tr>
					<th class="type">タイプ</th>
					<th class="stats">HP</th>
					<th class="stats">攻撃</th>
					<th class="stats">防御</th>
					<th class="stats">特攻</th>
					<th class="stats">特防</th>
					<th class="stats">速さ</th>
				</tr>
				<tr>
					<td><%=getpokemon.getType()%></td>
					<td><%=getpokemon.getHp()%></td>
					<td><%=getpokemon.getAttack()%></td>
					<td><%=getpokemon.getDefence()%></td>
					<td><%=getpokemon.getSpattack()%></td>
					<td><%=getpokemon.getSpdefence()%></td>
					<td><%=getpokemon.getSpeed()%></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="result">
		<h3>バトル経過</h3>
	</div>

	<div class="pokemonenemy">
		<h3>敵のポケモン</h3>
		<div class="enemynamebox">
			<h3>
				名前:<%=getenemypokemon.getName()%>
				HP：
				<meter low="0.3" high="0.7" optimum="0.8"
					style="width: 300px; height: 25px;"
					value="<%=getenemypokemon.getHp()%>" min="0"
					max="<%=getenemypokemon.getHp()%>"></meter>
			</h3>
		</div>
		<img class="enemyimg" src="画像/pika○○.jpg" alt="敵ポケモン">
		<div class="enemyskill">
			<button><%=getenemypokemon.getSkill1()%></button>
			<button><%=getenemypokemon.getSkill2()%></button>
			<button><%=getenemypokemon.getSkill3()%></button>
			<button><%=getenemypokemon.getSkill4()%></button>
		</div>
		<div class="pokemonenemies">
			<table>
				<tr>
					<th>タイプ</th>
					<th>HP</th>
					<th>攻撃</th>
					<th>防御</th>
					<th>特攻</th>
					<th>特防</th>
					<th>速さ</th>
				</tr>
				<tr>
					<td><%=getenemypokemon.getType()%></td>
					<td><%=getenemypokemon.getHp()%></td>
					<td><%=getenemypokemon.getAttack()%></td>
					<td><%=getenemypokemon.getDefence()%></td>
					<td><%=getenemypokemon.getSpattack()%></td>
					<td><%=getenemypokemon.getSpdefence()%></td>
					<td><%=getenemypokemon.getSpeed()%></td>
				</tr>
			</table>
		</div>
	</div>
	<footer>
		<a href="pokemon.html">ホームへ戻る</a>
	</footer>
</body>
</html>
