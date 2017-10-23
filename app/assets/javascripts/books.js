$(document).on('click','#sorting-button', {} ,function(e){
	  var selected_sorting = $("#sorting-options").find("option:selected").val()
	  window.location = "books/sort?configuration=" + selected_sorting
});
