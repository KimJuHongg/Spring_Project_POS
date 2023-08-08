<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="ErrorPage.jsp"%>
<html>

<head>

<title>SEVENELEVEN</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Dela+Gothic+One&family=Dosis:wght@200;300&family=Koulen&family=Smooch&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f50322ccba.js" crossorigin="anonymous"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
</script>

<style>
   body { 
            padding: 0px;
            margin: 0px;            
        }
    .img{
    position: relative;
    background-image: url("https://static.dailytrend.co.kr/wp-content/uploads/2022/11/08162835/711-cover_1.webp");                                                               
    height: 100vh;
    background-size: cover;
}
 .img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.8);                                                                 
   z-index:1;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     z-index: 3;
     width: 600px;
     text-align: center;
}


<%@ include file="Button.jsp" %>
        

</style>

</head>


<body style="background-color: black;">

<nav class="navbar navbar-expand-md navbar-dark bg-darker fixed-top">
  
  <a class="navbar-brand" href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/7-eleven_logo.svg/2110px-7-eleven_logo.svg.png" style="width:5%; height:5%;" /></a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    <p></p>
  </button>
      

</nav>

      <div class="img">
        <div class="content">
        <h3 class="display-4" style="color:#baab8f;font-family: 'Koulen', cursive;">Join Membership</h3>
        <p class="display-7" style="color:red;font-family: 'Bebas Neue', cursive; margin-bottom:50px;">Please Register to SEVEN ELEVEN.</p>
       <form name="newMember" class="form-horizontal"  action="/register" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 " style="font-family: 'Bebas Neue', cursive; color:#baab8f; font-size:30px;">ID</label>
				<div class="col-sm-8">
					<input name="id" type="text" class="form-control" placeholder="id" style="opacity:0.8;">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" style="font-family: 'Bebas Neue', cursive;color:#baab8f; font-size:30px;">Password</label>
				<div class="col-sm-8">
					<input name="password" type="text" class="form-control" placeholder="password" style="opacity:0.8;" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" style="font-family: 'Bebas Neue', cursive;color:#baab8f; font-size:30px;">Check Password</label>
				<div class="col-sm-8">
					<input name="password_confirm" type="text" class="form-control" placeholder="password confirm" style="opacity:0.8;">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" style="font-family: 'Bebas Neue', cursive;color:#baab8f; font-size:30px;">Name</label>
				<div class="col-sm-8">
					<input name="name" type="text" class="form-control" placeholder="name" style="opacity:0.8;" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" style="font-family: 'Bebas Neue', cursive;color:#baab8f; font-size:30px;">GRADE</label>
				<div class="col-sm-4">
					<input name="grade" type="radio" value="관리자"  style="opacity:0.8;"/><p style="color:white;">관리자</p>
					<input name="grade" type="radio" value="직원" style="opacity:0.8;"/><p style="color:white;">직원</p>
				</div>
			</div>

			<div class="form-group  row">
				<div class="col-sm-12">
				     <button class="w-btn w-btn-red" style="text-align:center;" type="submit">등록</button>
				</div>
			</div>
		</form>

       
        </div>
       <div class="img-cover"></div>
    </div>

</body>
</html>