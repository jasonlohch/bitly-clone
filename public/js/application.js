$(document).ready(function(){
	console.log("hello")
	$("#create_url").on(("submit", function(event){
		event.preventDefault()
		form_inputs = $(this).serialize()
		$.ajax({
		  url: "/test",
		  method: "post",
		  data: form_inputs,
		  dataType: "json",
		  success: function(data){
		  	$("tbody").append(
		  		"<tr><td><a href=" + data.long_url + ">" + 
          		data.long_url + "</a>" + 
          		"</td><td>" + 
          		data.short_url + 
          		"</td><td>0</td><td></td></tr>"
		  		)
		  }
		})
	})
})