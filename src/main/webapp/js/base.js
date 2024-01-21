/**
 * 
 */

 		window.addEventListener('devtoolschange', function (event) {
			if (event.detail.isOpen) {
				alert('デベロッパーツールは使用できません。');
			}
		});



		window.addEventListener('keydown', function (event) {
			if (event.ctrlKey && event.shiftKey && (event.key === 'I' || event.key === 'J')) {
				event.preventDefault();
			}
			if (event.key === 'F12') {
				event.preventDefault();
			}
		});