$(document).ready(function () {
  console.log("Dom's ready, let's go!!!");
  $("#origin__submit").click(function (e) {
    e.preventDefault();
    console.log("Origin btn clicked!");
    var originInput = $("#origin__input").val();
    console.log(originInput);
    $.ajax({
      type: 'POST',
      url: 'http://iatacodes.org/api/v6/autocomplete?api_key=f58b75d0-0d50-4573-8679-ea04f28ee818&query=newark',
      contentType: 'text/plain',
      xhrFields: {
        withCredentials: true
      },
      headers: {
        'Access-Control-Allow-Headers': 'Authorization',
        'Access-Control-Allow-Methods': 'POST',
        'Access-Control-Allow-Origin': 'http://127.0.0.1:3000'
      },
      success: function (data){
        console.log(data);
      },
      error: function(){
        console.log("No dice on the API request!");
      }
    });
    // $.ajax({
    //   type: 'POST',
    //   headers: {'Access-Control-Allow-Headers': 'Authorization',
    //             'Access-Control-Allow-Methods': 'POST',
    //             'Access-Control-Allow-Origin': 'http://127.0.0.1:3000'},
    //   url: 'http://iatacodes.org/api/v6/autocomplete?api_key=f58b75d0-0d50-4573-8679-ea04f28ee818&query=newark',
    //   contentType: 'text/plain'
    // }).done(function (data) {
    //   console.log(data);
    //   });
    });

  $("#destination__submit").click(function (e) {
    e.preventDefault();
    console.log("Destination btn clicked!");
  });
});
