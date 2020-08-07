/**
 * 
 */
document.querySelector('.img-btn').addEventListener('click', function()
	{
		document.querySelector('.cont').classList.toggle('s-signup')
	}
);

function login()
{
	
	var userid=document.signin.userid.value;
	var password=document.signin.password.value;
	var role=document.getElementById("role").value;
	
	if(userid=="")
	{
		alert('Enter the User-id');
		return false;
	}

	if(role=="Admin" && userid.charAt(0)!='A')
	{
		alert("UserId of Admin begins with A");
		return false;
	}
	else if(validateRole(role,userid)==false)
	{
		return false;
	}
	
	if(password=="")
	{
		alert('Enter password');
		return false;
	}
	
	if(validatePassword(password)==false)		
	{
		alert('Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters')
		return false;
	}
}

function register()
{
	
	var userid=document.signup.userid.value;
	var name=document.signup.name.value;
	var email=document.signup.emailid.value;
	var password=document.signup.password1.value;
	var cpassword=document.signup.password2.value;
	var role=document.getElementById("role").value;

	if(userid=="")
	{
		alert('Enter the Userid');
		return false;
	}
	if(role=="Admin")
	{
		alert("Registration privelieged for Admin is not allowed");
		return false;
	}
	else if(validateRole(role,userid)==false)
	{
		return false;
	}
	
	if(name=="")
	{
		alert('Enter the name');
		return false;
	}
	
	if(email=="")
	{
		alert('Enter the email-id');
		return false;
	}
	if(validateEmail(email)==false)
	{
		alert('you have entered an invalid email address!')
		return false
	}

	if(validatePassword(password)==false)		
	{
		alert('Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters')
		return false;
	}

	if(password!=cpassword)
	{
		alert('Password and Confirm Password mismatch');
		return false;
	}
	
	if(userid=="" || name=="" || email=="" || password=="" || cpassword=="")
	{
		alert('All * market fields are mandatory');
		return false;
	}
	
	return true;
}

function validateRole(role,userid)
{
	
	if(role=="Customer" && userid.charAt(0)!='C')
	{
		alert('UserId of Customer begins with C');
		return false;
	}
	
	if(role=="Supplier" && userid.charAt(0)!='S')
	{
		alert('UserId of Supplier begins with S');
		return false;
	}
	return true;
}

function validateEmail(email)
{
	return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email);
}

function validatePassword(password)
{
	return password.match(/[a-z]/g) && password.match(/[A-Z]/g) && password.match(/[0-9]/g) && password.match(/[^a-zA-Z\d]/g) && password.length >= 8; 
}


