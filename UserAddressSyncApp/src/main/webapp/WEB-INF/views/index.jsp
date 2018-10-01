<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Sample App</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

</head>
<body>
<style>

#add_panel{
display:none;
}

#updateAddBtn{
display:none;
}

#searchBtn{

}

#wrap{
background-image: -ms-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Mozilla Firefox */ 
background-image: -moz-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Opera */ 
background-image: -o-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* Webkit (Safari/Chrome 10) */ 
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #FFFFFF), color-stop(1, #D3D8E8));
/* Webkit (Chrome 11+) */ 
background-image: -webkit-linear-gradient(top, #FFFFFF 0%, #D3D8E8 100%);
/* W3C Markup, IE10 Release Preview */ 
background-image: linear-gradient(to bottom, #FFFFFF 0%, #D3D8E8 100%);
background-repeat: no-repeat;
background-attachment: fixed;
}
legend{
	color:#141823;
	font-size:25px;
	font-weight:bold;
}
.signup-btn {
  background: #79bc64;
  background-image: -webkit-linear-gradient(top, #79bc64, #578843);
  background-image: -moz-linear-gradient(top, #79bc64, #578843);
  background-image: -ms-linear-gradient(top, #79bc64, #578843);
  background-image: -o-linear-gradient(top, #79bc64, #578843);
  background-image: linear-gradient(to bottom, #79bc64, #578843);
  -webkit-border-radius: 4;
  -moz-border-radius: 4;
  border-radius: 4px;
  text-shadow: 0px 1px 0px #898a88;
  -webkit-box-shadow: 0px 0px 0px #a4e388;
  -moz-box-shadow: 0px 0px 0px #a4e388;
  box-shadow: 0px 0px 0px #a4e388;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
  padding: 10px 20px 10px 20px;
  border: solid #3b6e22  1px;
  text-decoration: none;
}

.signup-btn:hover {
  background: #79bc64;
  background-image: -webkit-linear-gradient(top, #79bc64, #5e7056);
  background-image: -moz-linear-gradient(top, #79bc64, #5e7056);
  background-image: -ms-linear-gradient(top, #79bc64, #5e7056);
  background-image: -o-linear-gradient(top, #79bc64, #5e7056);
  background-image: linear-gradient(to bottom, #79bc64, #5e7056);
  text-decoration: none;
}
.navbar-default .navbar-brand{
		color:#fff;
		font-size:30px;
		font-weight:bold;
	}
.form .form-control { margin-bottom: 10px; }
@media (min-width:768px) {
	#home{
		margin-top:50px;
	}
	#home .slogan{
		color: #0e385f;
		line-height: 29px;
		font-weight:bold;
	}
}
</style>
	<script>
	var addData = '';
		function checkUserData() {
			var name = document.getElementById("networkId").value;
			$.ajax({
						type : "GET",
						contentType : "application/json",
						url : "checkUser/" + name,
						success : function(data) {
							var result = JSON.parse(data);
							addData = data;
							console.log(result);
							
							if (result.status == 'valid') {
								$("#add_panel").css({"display":"block"});
								$("#updateAddBtn").css({"display":"block"});
								$("#searchBtn").css({"display":"none"});
								$( "#networkId" ).prop( "disabled", true );
								updateAddData('HOME');
							} else {
								bootbox.alert({
								    message: "Invalid Network ID!!",
								    backdrop: true,
								    size: 'small'
								});
								addData = '';
							}

						},
						error : function(e) {
							console.log("ERROR: ", e);
							display(e);
						}
					});
		}

		function updateAddData(addType){
			console.log(addType);
			var result = JSON.parse(addData);
			for (var i = 0; i < result.result.length; i++) { 
			    if(result.result[i].addressType == addType){
				    $("#add_type").val(result.result[i].addressType);
				    $("#add_one").val(result.result[i].address1);
				    $("#add_two").val(result.result[i].address2);
				    $("#country").val(result.result[i].country);
				    $("#city").val(result.result[i].city);
				    $("#state").val(result.result[i].state);
				    $("#county").val(result.result[i].county);
				}
			}
			
		}
		
		function updateUserData() {
			var name = document.getElementById("networkId").value;
			var search = {}
			search["networkId"] = $("#networkId").val();
			search["addressType"] = $("#add_type").val();
			search["address1"] = $("#add_one").val();
			search["address2"] = $("#add_two").val();
			search["country"] = $("#country").val();
			search["city"] = $("#city").val();
			search["state"] = $("#state").val();
			search["county"] = $("#county").val();
			console.log(search);
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "updateUserInfo",
				data : JSON.stringify(search),
				success : function(data) {
					$("#add_panel").css({"display":"none"});
					$("#updateAddBtn").css({"display":"none"});
					$("#searchBtn").css({"display":"block"});
					$( "#networkId" ).prop( "disabled", false );
					bootbox.alert({
					    message: "Information has been updated successfully!!!",
					    backdrop: true,
					    size: 'small'
					});
					
					console.log("SUCCESS: ", data);
				},
				error : function(e) {
					alert('ERROR: Please try again');
					console.log("ERROR: ", e);
					console.log(e);
				}
			});
		}
	</script>




	<div class="container" id="wrap">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="form" >
					<legend>Network Info</legend>
					<input type="text" id='networkId' name="networkId" value="" class="form-control input-lg" placeholder="Network Id" />
					<div id="add_panel">
					<select name="add_type" class="form-control input-lg" id="add_type" onchange='updateAddData(this.value)'>
						<option value="HOME">Home</option>
						<option value="WORK">Work</option>
					</select>
					<input type="text" id='add_one' name="add_one" value="" class="form-control input-lg" placeholder="Address Line 1" /> 
					<input type="text" id='add_two' name="add_two" value="" class="form-control input-lg" placeholder="Address Line 2" /> 
					<input type="text" id='city' name="city" value="" class="form-control input-lg" placeholder="City" />
					<input type="text" id='county' name="county" value="" class="form-control input-lg" placeholder="County" />
					<input type="text" id='state' name="state" value="" class="form-control input-lg" placeholder="State" />
					<input type="text" id='country' name="country" value="" class="form-control input-lg" placeholder="Country" /> 
					</div>
					  </br>
					<button id="searchBtn" class="btn btn-lg btn-primary btn-block signup-btn" type="submit" onclick='checkUserData()'>Search</button>
					<button id="updateAddBtn" class="btn btn-lg btn-primary btn-block signup-btn" type="submit" onclick='updateUserData()'>Submit</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>