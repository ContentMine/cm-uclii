$(document).ready(function(){
				$('#table_btn').on('click', function() {
						$('table').toggleClass('before, after');
			  });

				$( '#subtable_btn').on('click', function() {
						$('table').toggleClass('show_st');
				});

				$( '#supercolumn_btn').on('click', function() {
						$('table').toggleClass('show_sc');
				});

				$( '#compcol_btn').on('click', function() {
						$('table').toggleClass('show_cc');
				});
});
   
