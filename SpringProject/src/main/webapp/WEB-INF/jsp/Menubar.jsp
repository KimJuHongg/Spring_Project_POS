<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Dela+Gothic+One&family=Dosis:wght@200;300&family=Koulen&family=Smooch&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f50322ccba.js" crossorigin="anonymous"></script>
  <%@ page import="com.example.demo.wallet" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-darker fixed-top"  style="z-index:999;">
  <a class="navbar-brand"><img src="https://logos-world.net/wp-content/uploads/2021/08/7-Eleven-Emblem.png" style="width:10%; height:10%;" /></a>
  
  <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
   
    <ul class="navbar-nav">  
      <li class="nav-item dropdown">
	<a class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown" style="font-size:25px; color:white;"><i class="fa-solid fa-bars"></i></a>
    <ul class="dropdown-menu bg bg-darker" style="background-color:#baab8f;">
      <li class="dropdown-item">
        <a class="nav-link" href="" style="color:black;"><i class="fa-solid fa-dollar-sign"  style="margin-right:5px;"></i>${wallet}</a>
      </li>
    </ul>
      <li class="nav-item"><a class="nav-link" href="/admin" style="color:white; font-size:30px; text-align:center;"><i class="fa-solid fa-address-card"></i></a></li>
      <li class="nav-item"><a class="nav-link" href="/Home" style="color:white; font-size:30px; text-align:center;"><i class="fa-solid fa-cart-shopping"></i></a></li>
    </ul>
  </div>
</nav>
  
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      <script src = "https://code.jquery.com/jquery-3.3.1.slim.min.js" 
         integrity = "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
         crossorigin = "anonymous">
      </script>
      
      <script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
         integrity = "sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" 
         crossorigin = "anonymous">
      </script>
      
      <script src = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
         integrity = "sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" 
         crossorigin = "anonymous">
      </script>

