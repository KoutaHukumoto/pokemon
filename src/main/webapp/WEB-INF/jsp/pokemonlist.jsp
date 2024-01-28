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
<script>
var lastSortedColumn = -1;
var lastSortDirection = '';

function sortTable(columnIndex, direction) {
    var table, rows, switching, i, x, y, shouldSwitch, switchCount = 0;
    table = document.querySelector("table");
    switching = true;
    
    // 列が同じで方向が異なるか、または列が異なる場合はリセット
    if (columnIndex !== lastSortedColumn || direction !== lastSortDirection) {
        switchCount = 0;
    } else {
        // 同じ列と同じ方向でのクリックはソートリセット
        switching = false;
        lastSortedColumn = -1;
        lastSortDirection = '';
    }

    while (switching) {
        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[columnIndex];
            y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

            // ソート方向に応じて比較
            if (direction === 'asc' && Number(x.innerHTML) > Number(y.innerHTML) ||
                direction === 'desc' && Number(x.innerHTML) < Number(y.innerHTML)) {
                shouldSwitch = true;
                break;
            }
        }

        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchCount++;
        } else {
            // ソートが完了したら、最後のソート情報を更新
            if (switchCount === 0 && direction !== '') {
                lastSortedColumn = columnIndex;
                lastSortDirection = direction;
            }
        }
    }
}

</script>
</head>
<body>
	<h2>登録モンスターリスト</h2>
	<table>
		<tr>
			<th class="name">名前</th>
			<th class="type">タイプ</th>
			<th>技1</th>
			<th>技2</th>
			<th>技3</th>
			<th>技4</th>
			<th class="stats">HP  <span><button onclick="sortTable(6, 'asc')">▲</button><button onclick="sortTable(6, 'desc')">▼</button></span></th>
			<th class="stats">攻撃  <span><button onclick="sortTable(7, 'asc')">▲</button><button onclick="sortTable(7, 'desc')">▼</button></span></th>
			<th class="stats">防御  <span><button onclick="sortTable(8, 'asc')">▲</button><button onclick="sortTable(8, 'desc')">▼</button></span></th>
			<th class="stats">特攻  <span><button onclick="sortTable(9, 'asc')">▲</button><button onclick="sortTable(9, 'desc')">▼</button></span></th>
			<th class="stats">特防  <span><button onclick="sortTable(10, 'asc')">▲</button><button onclick="sortTable(10, 'desc')">▼</button></span></th>
			<th class="stats">速さ  <span><button onclick="sortTable(11, 'asc')">▲</button><button onclick="sortTable(11, 'desc')">▼</button></span></th>
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