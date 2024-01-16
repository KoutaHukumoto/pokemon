<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.pokemon"%>
<%
    pokemon pokemon = (pokemon) request.getAttribute("pokemon");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>オリジナルポケモン登録</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            color: #333;
            background-color: #ffcc00;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        p {
            color: #666;
            font-size: 1.1em;
            width: 100%;
            margin: 10px 0;
        }

        a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
            display: block;
            margin-top: 20px;
        }
 
        a:hover {
            color: #45a049;
        }
    </style>
</head>
<body>
    <h2>ポケモンが登録されました</h2>
    <p>名前: <%=pokemon.getName()%></p>
    <p>タイプ: <%=pokemon.getType()%></p>
    <p>技1: <%=pokemon.getSkill1()%></p>
    <p>技2: <%=pokemon.getSkill2()%></p>
    <p>技3: <%=pokemon.getSkill3()%></p>
    <p>技4: <%=pokemon.getSkill4()%></p>
    <p>HP: <%=pokemon.getHp()%></p>
    <p>攻撃: <%=pokemon.getAttack()%></p>
    <p>防御: <%=pokemon.getDefense()%></p>
    <p>特攻: <%=pokemon.getSpattack()%></p>
    <p>特防: <%=pokemon.getSpdefense()%></p>
    <p>速さ: <%=pokemon.getSpeed()%></p>
    <a href="pokemon.html">戻る</a>
</body>
</html>
