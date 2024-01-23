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
   <script>

        var allyhp = <%=getpokemon.getHp()%>; 
        var allyname = "<%=getpokemon.getName()%>";
        var allytype = "<%=getpokemon.getType()%>";
        var allyattack = <%=getpokemon.getAttack()%>;
        var allydefence = <%=getpokemon.getDefence()%>;
        var allyspattack = <%=getpokemon.getSpattack()%>;
        var allyspdefence = <%=getpokemon.getSpdefence()%>;
        var allySpeed = <%=getpokemon.getSpeed()%>;

        var enemyhp = <%=getenemypokemon.getHp()%>;
        var enemyname = "<%=getenemypokemon.getName()%>";
        var enemytype = "<%=getenemypokemon.getType()%>";
        var enemyattack = <%=getenemypokemon.getAttack()%>;
        var enemydefence = <%=getenemypokemon.getDefence()%>;
        var enemyspattack = <%=getenemypokemon.getSpattack()%>;
        var enemyspdefence = <%=getenemypokemon.getSpdefence()%>;
        var enemySpeed = <%=getenemypokemon.getSpeed()%>;
        var enemyskill = "<%=getenemypokemon.getSkill1()%>"; 

        function useSkill(skillName) {
			if((enemyhp<=0)||(allyhp<=0)){
					return;
				}   
            var turn = "true";
            if (allySpeed >= enemySpeed) {
                pokemonbattleLogic(allyname, allyattack, enemyname, enemydefence, skillName, turn);
            } else {
                pokemonbattleLogic(enemyname, enemyattack, allyname, allydefence, enemyskill, turn);
            }
        }

        function pokemonbattleLogic(name, attack,enemyname, defence, skillName, turn) {
            var damage = (((attack / 2) + 100) - defence);

            var resultDiv = document.getElementById("result");
            var pElement = document.createElement("p");
            pElement.textContent = name + "の" + skillName + "！"+ enemyname +"に" + damage + "のダメージ！";
            resultDiv.appendChild(pElement);

            if (name === allyname) { 
                enemyhp = enemyhp - damage;
                updateenemyhp(enemyhp,turn,name);
            } else {
                allyhp = allyhp - damage;
                updateallyhp(allyhp,turn,name);
            }

        }

        function updateallyhp(newHp,turn,name) {
            var allyHpMeter = document.getElementById("allyhpmeter");
            allyHpMeter.value = newHp;
            victory(turn,newHp,name);
        }

        function updateenemyhp(newHp,turn,name) {
            var enemyHpMeter = document.getElementById("enemyhpmeter");
            enemyHpMeter.value = newHp;
            victory(turn,newHp,name);
        }

        function victory(turn,hp,name){
			if(hp<=0){
				  var resultDiv = document.getElementById("result");
		            var pElement = document.createElement("p");
		            pElement.textContent = name + "の勝利！" + name +"は50の経験値獲得！";
		            resultDiv.appendChild(pElement);
		            return;
				}
            if (turn === "true") { 
                turn = "false";
                if (name === allyname) {
                    pokemonbattleLogic(enemyname, enemyattack, allyname, allydefence, enemyskill, turn);
                } else {
                    pokemonbattleLogic(allyname, allyattack, enemyname, enemydefence, skillName, turn);
                }
            }
          }
        

    </script>
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
					style="width: 180px; height: 25px;" value="<%=getpokemon.getHp()%>"
					min="0" max="<%=getpokemon.getHp()%>" id="allyhpmeter"></meter>
			</h3>
		</div>
		<img class="allyimg" src="画像/pika○○2.jpg" alt="ポケモン">
		<div class="skill">
    <button onclick="useSkill('<%=getpokemon.getSkill1()%>')"><%=getpokemon.getSkill1()%></button>
    <button onclick="useSkill('<%=getpokemon.getSkill2()%>')"><%=getpokemon.getSkill2()%></button>
    <button onclick="useSkill('<%=getpokemon.getSkill3()%>')"><%=getpokemon.getSkill3()%></button>
    <button onclick="useSkill('<%=getpokemon.getSkill4()%>')"><%=getpokemon.getSkill4()%></button>
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
	<div class="result" id="result">
		<h3>バトル経過</h3>
	</div>

	<div class="pokemonenemy">
		<h3>敵のポケモン</h3>
		<div class="enemynamebox">
			<h3>
				 名前:<%=getenemypokemon.getName()%>
				HP：
				<meter low="0.3" high="0.7" optimum="0.8"
					style="width: 180px; height: 25px;"
					value="<%=getenemypokemon.getHp()%>" min="0"
					max="<%=getenemypokemon.getHp()%>" id="enemyhpmeter"></meter>
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
