<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%@ page import="java.util.ArrayList"%>
<%
pokemon getpokemon = (pokemon) session.getAttribute("getpokemon");
pokemon getenemypokemon = (pokemon) session.getAttribute("getenemypokemon");
ArrayList<pokemon> getpokemonskill = (ArrayList<pokemon>) session.getAttribute("getpokemonskill");
ArrayList<pokemon> getenemypokemonskill = (ArrayList<pokemon>) session.getAttribute("getenemypokemonskill");
ArrayList<pokemon> Typelist = (ArrayList<pokemon>) session.getAttribute("Typelist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モンスターバトル</title>
<script src="js/base.js"></script>
<script>
        var turn = true;

        var ally = {
            hp: <%=getpokemon.getHp()%>,
            name: "<%=getpokemon.getName()%>",
            type:"<%=getpokemon.getType()%>",
            attack: <%=getpokemon.getAttack()%>,
            defence: <%=getpokemon.getSpdefence()%>,
            spattack: <%=getpokemon.getSpattack()%>,
            spdefence: <%=getpokemon.getDefence()%>,
            speed: <%=getpokemon.getSpeed()%>,
            skills: [
                <%for (pokemon skill : getpokemonskill) {%>
                    {
                        name: "<%=skill.getSkillName()%>",
                        dmg: <%=skill.getDmg()%>,
                        type: "<%=skill.getType()%>",
                        tag: <%=skill.getTag()%>
                    },
                <%}%>
            ]
        };

        var enemy = {
            hp: <%=getenemypokemon.getHp()%>,
            name: "<%=getenemypokemon.getName()%>",
            type:"<%=getenemypokemon.getType()%>",
            attack: <%=getenemypokemon.getAttack()%>,
            defence: <%=getenemypokemon.getDefence()%>,
            spattack: <%=getpokemon.getSpattack()%>,
            spdefence: <%=getpokemon.getDefence()%>,
            speed: <%=getenemypokemon.getSpeed()%>,
            skills: [
                <%for (pokemon skill : getenemypokemonskill) {%>
                    {
                        name: "<%=skill.getSkillName()%>",
                        dmg: <%=skill.getDmg()%>,
                        type: "<%=skill.getType()%>",
                        tag: <%=skill.getTag()%>
                    },
                <%}%>
            ]
        };

        var typelist={
                types:[
                	<%for (pokemon typelist : Typelist) {%>
                	{
                		aType:"<%=typelist.getAttackType()%>",
                		dType:"<%=typelist.getDefenceType()%>",
                		result:<%=typelist.getResult()%>
                	},
                	<%}%>
					]
                }

        function useSkill(skillName) {
            if (enemy.hp <= 0 || ally.hp <= 0) {
                return;
            }
            
            var button1 = document.getElementById("skillbutton1");
            button1.disabled = true;
            var button2 = document.getElementById("skillbutton2");
            button2.disabled = true;
            var button3 = document.getElementById("skillbutton3");
            button3.disabled = true;
            var button4 = document.getElementById("skillbutton4");
            button4.disabled = true;

            var enemySkill = selectenemyskill();

            if (ally.speed >= enemy.speed) {
                pokemonbattleLogic(ally, enemy, skillName);
                if (enemy.hp <= 0) {
                    return;
                }
                setTimeout(function() {
                	pokemonbattleLogic(enemy, ally, enemySkill);
                    button1.disabled = false;
                    button2.disabled = false;
                    button3.disabled = false;
                    button4.disabled = false;
                	}, 500);
            } else {
                pokemonbattleLogic(enemy, ally, enemySkill);
                if (ally.hp <= 0) {
                    return;
                }
                setTimeout(function() {
                pokemonbattleLogic(ally, enemy, skillName);
                button1.disabled = false;
                button2.disabled = false;
                button3.disabled = false;
                button4.disabled = false;
                }, 500);
            }
        }

        function pokemonbattleLogic(attacker, defender, skillName) {
            var skill = selectSkill(skillName, attacker.skills);
            var multiple = magnification(skill.type,defender.type);
            var damage = dmg(skill.tag, attacker, defender, multiple,skill.dmg);
            var resultDiv = document.getElementById("result");
            var pElement = document.createElement("p");
            var damageMessage = attacker.name + "の「" + skill.name + "」！" + defender.name + "に" + damage + "のダメージ！";
            resultDiv.appendChild(pElement);
            
            defender.hp = defender.hp - damage;
            defender.hp = Math.max(defender.hp, 0);
            var valuehp = (attacker === ally) ? <%=getenemypokemon.getHp()%> : <%=getpokemon.getHp()%>;
            displayTextWithDelay(pElement, damageMessage, 10, 100, function() {
                updateHpMeter(attacker, defender, valuehp); 
                if (defender.hp <= 0) {
                    setTimeout(function() {
                        victory(attacker.name);
                    }, 500);
                }
            });
        }

        function victory(name) {
            var resultDiv = document.getElementById("result");
            var pElement = document.createElement("p");
            var victoryMessage = name + "の勝利！" + name + "は50の経験値獲得！";
            resultDiv.appendChild(pElement);
            displayTextWithDelay(pElement, victoryMessage, 10, 100);
            var home = document.querySelector(".home");
            var homediv = document.createElement("div");
            var startNewBattleButton = document.createElement("button");
            startNewBattleButton.textContent = "もう一度戦う";
            startNewBattleButton.onclick = startNewBattle;
            homediv.appendChild(startNewBattleButton);
            var selectNewBattleButton = document.createElement("button");
            selectNewBattleButton.textContent = "モンスター選択に戻る";
            selectNewBattleButton.onclick = selectpokemon;
            homediv.appendChild(selectNewBattleButton);
            home.appendChild(homediv);
            var fbutton1 = document.getElementById("skillbutton1");
            fbutton1.disabled = false;
            var fbutton2 = document.getElementById("skillbutton2");
            fbutton2.disabled = false;
            var fbutton3 = document.getElementById("skillbutton3");
            fbutton3.disabled = false;
            var fbutton4 = document.getElementById("skillbutton4");
            fbutton4.disabled = false;
        }

        function startNewBattle() {
            location.reload();
        }

        function selectpokemon() {
            window.location.href = "pokemonBattleServlet";
        }

        function selectSkill(skillName, skills) {
            for (var i = 0; i < skills.length; i++) {
                if (skillName === skills[i].name) {
                    return skills[i];
                }
            }
        }

        function selectenemyskill() {
            var random = Math.floor(Math.random() * 4);
            return enemy.skills[random].name;
        }

        function magnification(type,defencetype){
            for (var i = 0; i < typelist.types.length; i++) {
                if (typelist.types[i].aType == type && typelist.types[i].dType == defencetype) {
                    return typelist.types[i].result;
                }
            }
            return 1; 
            }

        function dmg(skill, attacker, defender, multiple,dmg) {
            if (skill == 1) {
            	 return Math.floor((((dmg * attacker.attack) / defender.defence)/ 50 + 20) * multiple);
            } else {
            	 return  Math.floor((((dmg * attacker.spattack)/ defender.spdefence)/ 50 + 20) * multiple);
            }
        }

        function updateHpMeter(attacker, defender, defenderInitialHp) {
            var hpMeterId = (attacker === ally) ? "enemyhpmeter" : "allyhpmeter";
            var highhp = Math.floor(defenderInitialHp * 0.5);
            var lowhp = Math.floor(defenderInitialHp * 0.2);

            var hpMeter = document.getElementById(hpMeterId);
            hpMeter.value = Math.max(defender.hp, 0);
            hpMeter.high = highhp;
            hpMeter.low = lowhp;

            var nowhp = (attacker === ally) ? "enemynowHP" : "allynowHP";
            var NowHpElement = document.getElementById(nowhp);
            NowHpElement.textContent = Math.max(defender.hp, 0);
        }

        function displayTextWithDelay(element, text, interval, delay, callback) {
            var index = 0;
            function displayNextCharacter() {
                if (index < text.length) {
                    element.textContent += text[index];
                    index++;
                    setTimeout(displayNextCharacter, interval);
                } else if (callback) {
                    callback();
                }
            }
            setTimeout(displayNextCharacter, delay);
        }
    </script>
<link rel="stylesheet" href="css/battle.css">
</head>
<body>
	<div class="pokemonally">
		<h3>仲間のモンスター</h3>
		<div class="namebox">
			<h3>
				名前:<%=getpokemon.getName()%>
				HP：
				<meter low="30" high="70" optimum="<%=getpokemon.getHp()%>"
					style="width: 180px; height: 25px;" value="<%=getpokemon.getHp()%>"
					min="0" max="<%=getpokemon.getHp()%>" id="allyhpmeter"></meter>
					<span id="allynowHP"><%=getpokemon.getHp()%></span>/<span><%=getpokemon.getHp()%></span>
			</h3>
		</div>
		<img class="allyimg" src="画像/pika○○2.jpg" alt="モンスター">
		<div class="skill">
			<button onclick="useSkill('<%=getpokemon.getSkill1()%>')" id = "skillbutton1"><%=getpokemon.getSkill1()%></button>
			<button onclick="useSkill('<%=getpokemon.getSkill2()%>')" id = "skillbutton2"><%=getpokemon.getSkill2()%></button>
			<button onclick="useSkill('<%=getpokemon.getSkill3()%>')" id = "skillbutton3"><%=getpokemon.getSkill3()%></button>
			<button onclick="useSkill('<%=getpokemon.getSkill4()%>')" id = "skillbutton4"><%=getpokemon.getSkill4()%></button>
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
		<h3>敵のモンスター</h3>
		<div class="enemynamebox">
			<h3>
				名前:<%=getenemypokemon.getName()%>
				HP：
				<meter low="30" high="70" optimum="<%=getenemypokemon.getHp()%>"
					style="width: 180px; height: 25px;"
					value="<%=getenemypokemon.getHp()%>" min="0"
					max="<%=getenemypokemon.getHp()%>" id="enemyhpmeter"></meter>
					<span id="enemynowHP"><%=getenemypokemon.getHp()%></span>/<span><%=getenemypokemon.getHp()%></span>
			</h3>
		</div>
		<img class="enemyimg" src="画像/pika○○.jpg" alt="敵モンスター">
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
	<div class="home"></div>
	<footer>
		<a href="pokemon.html">ホームへ戻る</a>
	</footer>
</body>
</html>
