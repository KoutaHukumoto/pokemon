/**
 * 
 */

 function sortTable(tableClass, columnIndex, direction) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.querySelector("." + tableClass); 

    switching = true;

    // 列の並べ替えが完了するまでループ
    while (switching) {
        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[columnIndex];
            y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

            // 数値を比較して、必要に応じて行を入れ替える
            if ((direction === 'asc' && parseFloat(x.innerHTML) > parseFloat(y.innerHTML)) ||
                (direction === 'desc' && parseFloat(x.innerHTML) < parseFloat(y.innerHTML))) {
                shouldSwitch = true;
                break;
            }
        }

        if (shouldSwitch) {
            // 行を入れ替えてループを続ける
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}