 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.example.demo.sale" %>
  <%@ page import="com.example.demo.wallet" %>
 <div class="container marketing mt-5 mb-5">
      <div class="row featurette"   style="margin-top:100px;">
        <div class="col-md-7" style="background-color:white;">
        <table class="table table-hover" style="background-color:white;">
               <tr>
                  <th style="font-family: 'Bebas Neue', cursive;">#</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Description</th>
                  <th style="font-family: 'Bebas Neue', cursive;">QTY</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Price</th>
                  <th style="font-family: 'Bebas Neue', cursive;">Extended</th>
               </tr>
            <c:forEach items="${products}" var="product" varStatus="status">
               <tr>
                   <td>${status.index + 1}</td>
                   <td>${product.productname}</td>
                   <td >1</td>
                   <td >${product.price}</td>
                   <td>
            <form class="form-signin" action="/cancel" method="post">
                 <input type="hidden" name="cancelcode" value="${product.productname}" />
                 <button class="btn btn-danger" type="submit" style="text-align:center; margin-bottom:20px; margin-top:10px;">X</button>
            </form>
              </tr>
              <c:set var="sale" value="${sale + (1 * product.price)}" />
           </c:forEach>
        </table>
           </div>
         <div class="col-md-1" style="">
         </div>
        
        <div class="col-md-4" style="background-color:#DEDEDE; border-radius: 20px;">
        <div class="col-lg-12 text-center">
        <img src="https://cdn.freebiesupply.com/logos/large/2x/7-eleven-logo-png-transparent.png" style="width:30%; height:15%; text-align:center;" />
        </div>
        <br/>
        <i class="fa-solid fa-user" style="white-space:nowrap;color:white; font-size:30px;"></i>
            <h4 style="white-space:nowrap;">${name}님</h4>
        <br/>
        <i class="fa-solid fa-dollar-sign" style=" white-space:nowrap; color:white; font-size:30px;"></i>
        <h4 style="white-space:nowrap;" ><span id="saleValue">${sale}</span>원</h4>
        <div class="col-lg-12 text-center">
            <form class="form-signin" action="/Home" method="post">
               <div class="form-group mb-3">
               <input type="text" name='productcode' placeholder="Product Code" required autofocus class="form-control rounded-pill border-0 shadow-sm px-4">
               <button class="w-btn w-btn-red" type="submit" style="text-align:center;margin-top:20px;">Register</button>
               </div>
            </form>
            <form class="form-signin" action="/payment" method="post">
               <div class="form-group mb-3">
                 <input type="hidden" name="saleAmount" value="${sale}" />
                 <button class="w-btn w-btn-gra1" type="submit" style="text-align:center; margin-bottom:20px; margin-top:10px;">Payment</button>
               </div>
            </form>
        </div>
        </div>
        </div>
      </div>
<hr style="background-color:#baab8f;">