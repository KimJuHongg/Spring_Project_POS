 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="com.example.demo.Product" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="container marketing mt-5 mb-5">
       <h4 style="color:white; margin-top:50px;">재고관리</h4>
      <div class="row featurette"   style="margin-top:2px;">
        <div class="col-md-7" style="background-color:white;">
        <table class="table table-hover" style="background-color:white;">
               <tr>
                  <th style="font-family: 'Bebas Neue', cursive;">#</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Description</th>
                  <th style="font-family: 'Bebas Neue', cursive;">QTY</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Price</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Order Date</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Extended</th>
               </tr>
            <c:forEach items="${products}" var="product" varStatus="status" >
               <tr>
                   <td>${product.code}</td>
                   <td>${product.productname}</td>
                   <td>${product.quantity}</td>
                   <td>${product.price}</td>
                   <td>
             <form class="form-signin" action="/up" method="post">
                 <input type="hidden" name="qtyup" value="${product.code}" />
                 <button type="submit" class="btn btn-success increase-btn">+</button>
            </form>
            <form class="form-signin" action="/down" method="post" style="margin-top:5px;">
                 <input type="hidden" name="qtydown" value="${product.code}" />
                 <button type="submit" class="btn btn-success increase-btn">&nbsp;-&nbsp;</button>
            </form>
            <form class="form-signin" action="/productdelete" method="post" style="margin-top:5px;">
                 <input type="hidden" name="delete" value="${product.code}" />
                 <button type="submit" class="btn btn-danger increase-btn">&nbsp;X&nbsp;</button>
            </form>
               </td>
              </tr>
           </c:forEach>
               
        </table>
           </div>
         <div class="col-md-1" style="">
         </div>
        
        <div class="col-md-4" style="background-color:#DEDEDE; border-radius: 20px;">
        <div class="col-lg-12 text-center">
        <img src="https://cdn.freebiesupply.com/logos/large/2x/7-eleven-logo-png-transparent.png" style="width:40%; height:10%; text-align:center;" />
        </div>
            <form class="form-signin" action="/adminsucess" method="post">
               <div class="form-group mb-3 text-center">
                <h4 style="color:black; margin-top:20px;">Product Order</h4>
               <input type="text" name='productcode' placeholder="Product Code" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4">
               <input type="text" name='productname' style="margin-top:20px;"placeholder="Product Name" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4" >
               <input type="text" name='productquantity' style="margin-top:20px;"placeholder="Product Quantity" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4">
               <input type="text" name='productprice' style="margin-top:20px;"placeholder="Product Price" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4">
               <button class="w-btn w-btn-red" type="submit" style="text-align:center;margin-top:20px;">Product Register</button>
               </div> 
            </form>
        </div>
        </div>
        <hr style="background-color:#baab8f;">
        <h4 style="color:white; margin-top:50px;">통계</h4>
        <div class="col-lg-12 text-center">
        <table class="table table-hover" style="background-color:white;">
        <h4 style="margin-top:20px; color:white;">하루 최고 판매량</h4>
                <tr>
                  <th style="font-family: 'Bebas Neue', cursive;">#</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Description</th>
                  <th style="font-family: 'Bebas Neue', cursive;">QTY</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Price</th>
                </tr>
            <c:forEach var="product" items="${topSellingProducts}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.productname}</td>
                    <td>${product.quantity}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
        </table>
        
      <table class="table table-hover" style="background-color:white;">
        <h4 style="margin-top:20px; color:white;">일주일 최고 판매량</h4>
                <tr>
                  <th style="font-family: 'Bebas Neue', cursive;">#</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Description</th>
                  <th style="font-family: 'Bebas Neue', cursive;">QTY</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Price</th>
                </tr>
            <c:forEach var="product" items="${weektopSellingProducts}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.productname}</td>
                    <td>${product.quantity}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
        </table>
        

      <table class="table table-hover" style="background-color:white;">
        <h4 style="margin-top:20px; color:white;">한달 최고 판매량</h4>
                <tr>
                  <th style="font-family: 'Bebas Neue', cursive;">#</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Description</th>
                  <th style="font-family: 'Bebas Neue', cursive;">QTY</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Price</th>
                </tr>
            <c:forEach var="product" items="${monthtopSellingProducts}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${product.productname}</td>
                    <td>${product.quantity}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
        </table>        
        </div>
        <div class="col-md-5">
        </div>
        </div>
      </div>
</div>




