//CONTROLLER
//User
//Login
$(document).on("click","#btnLogin",function()
{
	var result = isValidFormLogin();// user client-model
	if(result=="true")
		{ $("#formLogin").submit();}
		else
			{
			  $("#divStsMsgLogin").html(result);}
		
	});