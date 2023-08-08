<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="EUC-KR">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Dela+Gothic+One&family=Dosis:wght@200;300&family=Koulen&family=Smooch&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f50322ccba.js" crossorigin="anonymous"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
   background-color: rgba(0, 0, 0, 0.3);                                                                 
   z-index:1;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     z-index: 2;
     width: 300px;
     text-align: center;
}

        

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
         
         <form class="form-signin" action="/Login" method="post" style="margin-top:150px;">
           <div class="form-group mb-3">
               <input type="text" name='id' placeholder="User Name" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4">
            </div>
            <div class="form-group mb-3">
              <input id="password" type="password" name='password' placeholder="Password" required class="form-control rounded-pill border-0 shadow-sm px-4 text-primary">
            </div>
             <button type="submit" class="btn btn-Dark btn-block text-uppercase mb-2 rounded-pill shadow-sm" style="background-color:#008163; color:white;font-family: 'Bebas Neue', cursive;" onclick="location.href='/Home'">Login</button>          
       </form>
             <div class="text-center d-flex justify-content-between mt-1">
             <form class="form-signin" action="/register" method="post" style="">
             <p style="color:white; font-size:14px;">Create <a href="/register" class="font-italic text-muted"> 
             <u style="color:red; font-size:14px;">Account</u></a></p>   
             </form>           
             </div>
       <c:if test="${not empty error}">
    <div class='alert alert-danger'>${error}</p>
    </div>
</c:if>        
        </div>
       <div class="img-cover"></div>
    </div>

</body>
</html>