<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>オリジナルポケモン登録</title>
</head>
<body>

    <h1>オリジナルポケモン登録</h1>

    <form action="RegistrationPokemonServlet" method="post">

        <label for="name">名前:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="type">タイプ:</label>
        <input type="text" id="type" name="type" required><br>

        <label for="skill1">スキル1:</label>
        <input type="text" id="skill1" name="skill1" required><br>

        <label for="skill2">スキル2:</label>
        <input type="text" id="skill2" name="skill2" required><br>

        <label for="skill3">スキル3:</label>
        <input type="text" id="skill3" name="skill3" required><br>

        <label for="skill4">スキル4:</label>
        <input type="text" id="skill4" name="skill4" required><br>

        <label for="hp">HP:</label>
        <input type="number" id="hp" name="hp" required><br>

        <label for="attack">攻撃:</label>
        <input type="number" id="attack" name="attack" required><br>

        <label for="defense">防御:</label>
        <input type="number" id="defense" name="defense" required><br>

        <label for="spattack">特攻:</label>
        <input type="number" id="spattack" name="spattack" required><br>

        <label for="spdefense">特防:</label>
        <input type="number" id="spdefense" name="spdefense" required><br>

        <label for="speed">速さ:</label>
        <input type="number" id="speed" name="speed" required><br>

        <input type="submit" value="登録">

    </form>

</body>
</html>
