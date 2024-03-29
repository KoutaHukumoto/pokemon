/**
 * 
 */


function selectPokemon(pokemonId) {
	var selectedRow = document.querySelector('button[data-pokemon-id="' + pokemonId + '"]').closest('tr');

	var name = selectedRow.cells[0].innerText, type = selectedRow.cells[1].innerText, skill1 = selectedRow.cells[2].innerText, skill2 = selectedRow.cells[3].innerText, skill3 = selectedRow.cells[4].innerText, skill4 = selectedRow.cells[5].innerText, hp = selectedRow.cells[6].innerText, attack = selectedRow.cells[7].innerText, defence = selectedRow.cells[8].innerText, spattack = selectedRow.cells[9].innerText, spdefence = selectedRow.cells[10].innerText, speed = selectedRow.cells[11].innerText;


	var table = document.querySelector('.getpokemon');

	table.tBodies[0].deleteRow(-1);

	var newRow = table.insertRow();

	newRow.classList.add('select');
	var nameCell = newRow.insertCell(0);
	nameCell.classList.add('name');
	var typeCell = newRow.insertCell(1);
	var skill1Cell = newRow.insertCell(2);
	var skill2Cell = newRow.insertCell(3);
	var skill3Cell = newRow.insertCell(4);
	var skill4Cell = newRow.insertCell(5);
	var hpCell = newRow.insertCell(6);
	var attackCell = newRow.insertCell(7);
	var defenceCell = newRow.insertCell(8);
	var spattackCell = newRow.insertCell(9);
	var spdefenceCell = newRow.insertCell(10);
	var speedCell = newRow.insertCell(11);


	nameCell.innerText = name;
	typeCell.innerText = type;
	skill1Cell.innerText = skill1;
	skill2Cell.innerText = skill2;
	skill3Cell.innerText = skill3;
	skill4Cell.innerText = skill4;
	hpCell.innerText = hp;
	attackCell.innerText = attack;
	defenceCell.innerText = defence;
	spattackCell.innerText = spattack;
	spdefenceCell.innerText = spdefence;
	speedCell.innerText = speed;

}


function selectnPokemon(pokemonId) {
	var selectedRow = document.querySelector('button[data-pokemon-id="' + pokemonId + '"]').closest('tr');

	var name = selectedRow.cells[0].innerText, type = selectedRow.cells[1].innerText, skill1 = selectedRow.cells[2].innerText, skill2 = selectedRow.cells[3].innerText, skill3 = selectedRow.cells[4].innerText, skill4 = selectedRow.cells[5].innerText, hp = selectedRow.cells[6].innerText, attack = selectedRow.cells[7].innerText, defence = selectedRow.cells[8].innerText, spattack = selectedRow.cells[9].innerText, spdefence = selectedRow.cells[10].innerText, speed = selectedRow.cells[11].innerText;


	var table = document.querySelector('.getnpokemon');

	table.tBodies[0].deleteRow(-1);


	var newRow = table.insertRow();
	newRow.classList.add('select');
	var nameCell = newRow.insertCell(0);
	nameCell.classList.add('name');
	var typeCell = newRow.insertCell(1);
	var skill1Cell = newRow.insertCell(2);
	var skill2Cell = newRow.insertCell(3);
	var skill3Cell = newRow.insertCell(4);
	var skill4Cell = newRow.insertCell(5);
	var hpCell = newRow.insertCell(6);
	var attackCell = newRow.insertCell(7);
	var defenceCell = newRow.insertCell(8);
	var spattackCell = newRow.insertCell(9);
	var spdefenceCell = newRow.insertCell(10);
	var speedCell = newRow.insertCell(11);

	nameCell.innerText = name;
	typeCell.innerText = type;
	skill1Cell.innerText = skill1;
	skill2Cell.innerText = skill2;
	skill3Cell.innerText = skill3;
	skill4Cell.innerText = skill4;
	hpCell.innerText = hp;
	attackCell.innerText = attack;
	defenceCell.innerText = defence;
	spattackCell.innerText = spattack;
	spdefenceCell.innerText = spdefence;
	speedCell.innerText = speed;

}

function startBattle() {

	var table = document.querySelector('.getpokemon');
	var etable = document.querySelector('.getnpokemon');


    var selectRow1 = table.querySelector('tr.select'); 
    var nameCell1 = selectRow1 ? selectRow1.querySelector('.name') : null;
    var selectPokemonname1 = nameCell1 ? nameCell1.innerText : null;

    var selectedRow2 = etable.querySelector('tr.select');
    var nameCell2 = selectedRow2 ? selectedRow2.querySelector('.name') : null;
    var selectPokemonname2 = nameCell2 ? nameCell2.innerText : null;

    if (selectPokemonname1 == null) {
        alert('味方のポケモンを選択してください。');
        return;
    }

    if (selectPokemonname2 == null) {
        alert('敵のポケモンを選択してください。');
        return;
    }

	var form = document.createElement('form');
	form.action = 'pokemonbattlepreparationServlet'; 
	form.method = 'post';

	var input1 = document.createElement('input');
	input1.type = 'hidden';
	input1.name = 'pokemonname1';
	input1.value = selectPokemonname1;

	var input2 = document.createElement('input');
	input2.type = 'hidden';
	input2.name = 'pokemonname2';
	input2.value = selectPokemonname2;

	form.appendChild(input1);
	form.appendChild(input2);

	document.body.appendChild(form);
	form.submit();
}