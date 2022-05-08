function checkName(){
	//Tham chiếu đối tượng lấy tên
	var name = document.getElementById("hoten").value;
	
	//biến xác nhận sự hợp lệ của giá trị
	var validName = true;
	
	//Biến ghi nhận thông báo
	var message = "";
	

	if(name == ""){
		validName = false;
		message = "Thiếu họ tên nhận hàng.";
	}else{
		if(name.length < 5 || name.length > 50){
			validName = false;
			message = "Tên đăng nhập có độ dài [5->50] ký tự.";
		}else{

			}
		}
	//tham chiếu đối tượng báo lỗi
	var error = document.getElementById("errName");
	if(!validName){
		error.innerHTML = message;
		error.style.color = "red";
	}
	return validName;
}
//----------------------------------------------------------
function checkPass(){
	//Lấy giá trị của pass 
	var pass = document.getElementById("matkhau").value;
	
	//biến xác nhận sự hợp lệ của giá trị
	var validPass = true;
	
	//Biến ghi nhận thông báo
	var message = "";
	

	if(pass == ""){
		validPass = false;
		message = "Thiếu mật khẩu cho tài khoản.";
	}else{
		if(pass.length < 5 || pass.length > 50){
			validPass = false;
			message = "Tên đăng nhập có độ dài [5->50] ký tự.";
		}else{

			}
		}
	//tham chiếu đối tượng báo lỗi
	var error = document.getElementById("errPass");
	if(!validPass){
		error.innerHTML = message;
		error.style.color = "red";
	}
	return validPass;
	
}
//----------------------------------------------------------
function checkEmail(){
	var email = document.getElementById("email").value;
	var validEmail = true;
	var message = "";
	email = email.trim();
	
	if(email ==""){
		validEmail = false;
		message = "Thiếu email cho tài khoản ";
	}else{
		if(email.indexOf("@") != -1){
			var parttern = /\w+@\w+[.]\w/;
				
			if(!email.match(parttern)){
				validEmail = false;
				message = "Không đúng cấu trúc hộp thư";
			}
		}else{
			validEmail = false;
			message = "Không đúng cấu trúc hộp thư"
		}
	}
	
	var error = document.getElementById("errEmail");
	if(!validEmail){
		error.innerHTML = message;
		error.style.color = "red";
	}

		return validEmail;
}

function checksdt(){
	//Tham chiếu đối tượng lấy tên
	var sdt = document.getElementById("sodienthoai").value;
	
	//biến xác nhận sự hợp lệ của giá trị
	var validsdt = true;
	
	//Biến ghi nhận thông báo
	var message = "";
	

	if(sdt == ""){
		validsdt = false;
		message = "Số điện thoại không được để trông.";
	}else{
		if(sdt.length != 10){
			validsdt = false;
			message = "Số điện thoại có độ dài [10] ký tự.";
		}else{

			}
		}
	//tham chiếu đối tượng báo lỗi
	var error = document.getElementById("errsdt");
	if(!validsdt){
		error.innerHTML = message;
		error.style.color = "red";
		 //font-weight
	}
	return validsdt;
}

function checkdc(){
	//Tham chiếu đối tượng lấy tên
	var dc = document.getElementById("diachi").value;
	
	//biến xác nhận sự hợp lệ của giá trị
	var validdc = true;
	
	//Biến ghi nhận thông báo
	var message = "";
	

	if(dc == ""){
		validdc = false;
		message = "Dịa chỉ không được để trống.";
	}else{
		
		}
	//tham chiếu đối tượng báo lỗi
	var error = document.getElementById("errdc");
	if(!validdc){
		error.innerHTML = message;
		error.style.color = "red";
		 //font-weight
	}
	return validdc;
}

function checkValidUser(){
	var validName = checkName();
	
	var validPass = checkPass();
	
	var validEmail = checkEmail();
	
	var validsdt = checksdt();
	
	var validdc = checkdc();
	
	//Đặt con trỏ vào những vị trí lỗi theo thứ tự ưu tiên từ trên xuống, từ trái sang
	if(!validName){
		document.getElementById("hoten").focus();
		document.getElementById("hoten").select();
	}else if(!validPass){
		document.getElementById("matkhau").focus();
		document.getElementById("matkhau").select();
	}else if(!validEmail){
		document.getElementById("email").focus();
		document.getElementById("email").select();		
	}else if(!validsdt){
		document.getElementById("sodienthoai").focus();
		document.getElementById("sodienthoai").select();		
	}else if(!validdc){
		document.getElementById("diachi").focus();
		document.getElementById("diachi").select();		
	}
	

	return validName && validPass && validEmail && validdc && validsdt;
}

function abc(fn){
	if(this.checkValidUser(fn)){
		fn.method = "Post";
		fn.action = "/GioHang/XacNhanThanhToan";
		fn.submit();
	}
}