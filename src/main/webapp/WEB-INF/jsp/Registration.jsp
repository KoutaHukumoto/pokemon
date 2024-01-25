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
<title>オリジナルポケモン登録</title>
<link rel="stylesheet" href="css/base.css">
<script src="js/base.js"></script>
</head>

<body>
	<h1>オリジナルポケモン登録</h1>

	<form action="RegistrationpokemonServlet" method="post"
		onsubmit="return validateForm()">

		<label for="name">名前(10文字以内):</label> 
		<input type="text" id="name"name="name" required>
		 <label for="type">タイプ:</label> <select
			id="type" name="type" required>
			<option value="ノーマル">ノーマル</option>
			<option value="ほのお">ほのお</option>
			<option value="みず">みず</option>
			<option value="でんき">でんき</option>
			<option value="くさ">くさ</option>
			<option value="こおり">こおり</option>
			<option value="かくとう">かくとう</option>
			<option value="どく">どく</option>
			<option value="じめん">じめん</option>
			<option value="ひこう">ひこう</option>
			<option value="エスパー">エスパー</option>
			<option value="むし">むし</option>
			<option value="いわ">いわ</option>
			<option value="ゴースト">ゴースト</option>
			<option value="ドラゴン">ドラゴン</option>
			<option value="あく">あく</option>
			<option value="はがね">はがね</option>
			<option value="フェアリー">フェアリー</option>
		</select> 
		
		
		<label for="skill1">技1/タイプ/威力:</label><select type="text" id="skill1" name="skill1" required>
			<%
			for (pokemon mpokemon : pokemonlist) {
			%>
			<option value="<%=mpokemon.getSkillName()%>"><%=mpokemon.getSkillName()%>/<%=mpokemon.getType()%>/<%=mpokemon.getDmg()%></option>
			<%
			}
			%>
			</select>

		<label for="skill2">技2/タイプ/威力:</label><select type="text" id="skill2" name="skill2" required>
			<%
			for (pokemon mpokemon : pokemonlist) {
			%>
			<<option value="<%=mpokemon.getSkillName()%>" ><%=mpokemon.getSkillName()%>/<%=mpokemon.getType()%>/<%=mpokemon.getDmg()%></option>
			<%
			}
			%>
			</select>

		<label for="skill3">技3/タイプ/威力:</label><select type="text" id="skill3" name="skill3" required>
            <%
			for (pokemon mpokemon : pokemonlist) {
			%>
			<<option value="<%=mpokemon.getSkillName()%>"><%=mpokemon.getSkillName()%>/<%=mpokemon.getType()%>/<%=mpokemon.getDmg()%></option>
			<%
			}
			%>
			</select>
			
				<label for="skill4">技4/タイプ/威力:</label><select type="text" id="skill4" name="skill4" required>
				<%
			for (pokemon mpokemon : pokemonlist) {
			%>
			<<option value="<%=mpokemon.getSkillName()%>"><%=mpokemon.getSkillName()%>/<%=mpokemon.getType()%>/<%=mpokemon.getDmg()%></option>
			<%
			}
			%>
			</select>

				<label for="hp">HP:</label>
				<input type="number" id="hp" name="hp" required max="200">

				<label for="attack">攻撃:</label>
				<input type="number" id="attack" name="attack" required min="1"
				max="200">

				<label for="defence">防御:</label>
				<input type="number" id="defence" name="defence" required min="1"
				max="200">

				<label for="spattack">特攻:</label>
				<input type="number" id="spattack" name="spattack" required min="1"
				max="200">

				<label for="spdefence">特防:</label>
				<input type="number" id="spdefence" name="spdefence" required
				min="1" max="200">

				<label for="speed">速さ:</label>
				<input type="number" id="speed" name="speed" required min="1"
				max="200">

				<input type="submit" value="登録">
	</form>

	<div id="totalStats">合計種族値: 0</div>
	<div id="Stats">種族値の合計は720まで</div>

	<footer>
		<a href="pokemon.html">ホームへ戻る</a>
	</footer>

	<script src="js/registration.js"></script>

</body>

</html>