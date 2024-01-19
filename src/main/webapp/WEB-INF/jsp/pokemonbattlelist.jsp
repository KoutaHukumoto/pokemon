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
    <style>
          body {
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
            background-color: yellow;
            padding: 20px;
            margin: 0;
        }

        .battle-container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .pokemon-list {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 40%;
            margin-bottom: 20px;
            overflow-y: auto;
            max-height: 400px; /* スクロール領域の最大の高さを設定 */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <h2>戦えるポケモン一覧</h2>
    <div class="battle-container">
        <div class="pokemon-list ally">
            <h3>仲間のポケモン</h3>
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
                <% for(pokemon mpokemon : pokemonlist){ %>
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
                <% } %>
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
                </tr>
                <% for(pokemon npokemon : pokemonlist){ %>
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
                    </tr>
                <% } %>
            </table>
        </div>
    </div>
</body>

</html>
