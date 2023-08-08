<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

<title>SEVENELEVEN</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Dela+Gothic+One&family=Dosis:wght@200;300&family=Koulen&family=Smooch&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f50322ccba.js" crossorigin="anonymous"></script>




<style>
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

   body { 
            padding: 0px;
            margin: 0px;            
        }
   video { 
            padding: 0px;
            margin: 0px;            
        }
        
.img-fluid {
  max-width: 100%;
  height: 650px;
}

p a {
    font-size: inherit;
    font-weight: inherit;
    color: #baab8f;
    letter-spacing: inherit;
}
p a:link{
    font-size: inherit;
    font-weight: inherit;
    color: #baab8f;
    letter-spacing: inherit;
}
p a:visited {
    font-size: inherit;
    font-weight: inherit;
    color: #baab8f;
    letter-spacing: inherit;
}
p a:ahover {
    font-size: inherit;
    font-weight: inherit;
    color: white;
    letter-spacing: inherit;
}
p a:active{
    font-size: inherit;
    font-weight: inherit;
    color: black;
    letter-spacing: inherit;
}

.ghost-button {
 display: inline-block;
 width:100px;
 height:50px;
 padding: 8px;
 color: #baab8f;
 border: 2px solid #baab8f;
 outline: none;
 text-decoration: none;
 text-align:center;
}


<jsp:include page="Button.jsp" /><title>SEVENELEVEN</title>

</style>

</head>


<body style="background-color: black;">

<!-- 메뉴바 호출 -->
<jsp:include page="Menubar.jsp" />

<jsp:include page="Count.jsp" />

</body>
</html>