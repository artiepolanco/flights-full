$(document).ready(function () {
  console.log("Dom's ready, let's go!!!");

  $("#origin__submit").click(function (e) {

    $('p').remove();
    e.preventDefault();
    console.log("Origin btn clicked!");

    var $originForm = $('.origin__form');

    var originInput = $('#origin__input').val();
    console.log(originInput);

    //get request to originAirport action in search controller that has the api for airports around location inputted
    $.ajax({
      type: 'GET',
      url: '/search/originAirport',
      data: {selected_value : originInput},
      success: function (airports){
        $.each(airports, function(i, airport){
          $originForm.append('<li>Airport Name: '+ airport.name +', Airport Code: '+ airport.code +'</li>')
        });
      },
      error: function(){
        console.log("No dice on the API request!");
        $originForm.append('<p>Please input origin location and try again.</p>')
      }
    });
  });

  $("#destination__submit").click(function (e) {

    $('p').remove();
    e.preventDefault();
    console.log("Destination btn clicked!");

    var $destinationForm = $('.destination__form');

    var destinationInput = $("#destination__input").val();
    console.log(destinationInput);

    //get request to originAirport action in search controller that has the api for airports around location inputted
    $.ajax({
      type: 'GET',
      url: '/search/desAirport',
      data: {selected_value : destinationInput},
      success: function (airports){
        $.each(airports, function(i, airport){
          $destinationForm.append('<li>Airport Name: '+ airport.name +', Airport Code: '+ airport.code +'</li>')
        });
      },
      error: function(){
        console.log("No dice on the API request!");
        $destinationForm.append('<p>Please input destination location and try again.</p>')
      }
    });
  });
});
