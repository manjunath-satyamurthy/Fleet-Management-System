$('#updateLocationBtn').on('click', function (){
    drop_lat = places[0].geometry.location.lat();
    drop_lng = places[0].geometry.location.lng();
	fdata = JSON.stringify({'lat': drop_lat, 'lng': drop_lng});

  	$.ajax({
	    url: '/updateLocation',
	    method: 'post',
	    data: fdata,
	    contentType: "application/json; charset=utf-8",
	    complete: function(result, status) {
	    	response = JSON.parse(result.responseText)
	      if (response['status'] == 'success'){
	      	alert("Update Successful, Thank you !")

	      	window.location.href = "http://localhost:8080/dashboard.jsp";
	      }
	      else {
	      	alert(result.responseText);
	      }
	    }
	 });
});