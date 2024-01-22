/**
 * 
 */

 		
		function validateForm() {
        const nameInput = document.getElementById("name");
        const nameValue = nameInput.value.trim(); 

        if (nameValue.length > 10) {
            alert("名前は10文字以内で入力してください。");
            return false; 
        }

        return true; 
    }

		document.getElementById("hp").addEventListener("input", updateTotalStats);
		document.getElementById("attack").addEventListener("input", updateTotalStats);
		document.getElementById("defence").addEventListener("input", updateTotalStats);
		document.getElementById("spattack").addEventListener("input", updateTotalStats);
		document.getElementById("spdefence").addEventListener("input", updateTotalStats);
		document.getElementById("speed").addEventListener("input", updateTotalStats);

		function updateTotalStats() {
			const hp = parseInt(document.getElementById("hp").value) || 0;
			const attack = parseInt(document.getElementById("attack").value) || 0;
			const defence = parseInt(document.getElementById("defence").value) || 0;
			const spattack = parseInt(document.getElementById("spattack").value) || 0;
			const spdefence = parseInt(document.getElementById("spdefence").value) || 0;
			const speed = parseInt(document.getElementById("speed").value) || 0;

			const totalStats = hp + attack + defence + spattack + spdefence + speed;

			document.getElementById("totalStats").innerText = `合計種族値: ${totalStats}`;

			const submitButton = document.querySelector('input[type="submit"]');
			submitButton.disabled = totalStats > 720;
		}