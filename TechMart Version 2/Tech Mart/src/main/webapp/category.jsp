<%@ page import="com.icbt.TechMart.model.product.ProductImplementation" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Kasun Madhumal
  Date: 3/4/2022
  Time: 12:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="resources/Include/header.jsp" %>
<% ArrayList<ProductImplementation> itemDetailsList = (ArrayList<ProductImplementation>) request.getAttribute("itemList");
    int cartItemCount = (int) request.getAttribute("cartItemCount");
    String loginState = (String) request.getAttribute("firstName");
%>

<%--NavigationBar--%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" >
    <a href="" class="navbar-brand">&emsp; TechMart.com</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ">
            <li class="nav-item"><a href="HomePage" class="nav-link">Home</a></li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Catogery</a>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                    <li><a class="dropdown-item" href="CategoryController?category=phone">Phones</a></li>
                    <li><a class="dropdown-item" href="CategoryController?category=charger">Headsets</a></li>
                    <li><a class="dropdown-item" href="CategoryController?category=headset">Chargers</a></li>
                    <li><a class="dropdown-item" href="CategoryController?category=baterry">Battery</a></li>
                    <li><a class="dropdown-item" href="CategoryController?category=cables">Cables</a></li>
                    <li><a class="dropdown-item" href="CategoryController?category=memory Device">Memory devices</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <ul class="navbar-nav ">
        <%
            if(loginState == null){

        %>
        <li class="nav-item">
            <a href="login.jsp" style="text-decoration: none; color:white;">User Login </a>
            <% } else { %>
            <p style="color: white">welcome <% out.print(" "+loginState); %></p>
            <% }%>

        </li>

    </ul>
    <ul class="navbar-nav ">
        <li class="nav-item">
            <a href="CartItemViewController" class="nav-link">
                <!--Shoping Cart-->
                <button type="button" class="btn btn-dark position-relative">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </svg>

                    <span id="unrdMg" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><% out.print(cartItemCount); %>
  							<span class="visually-hidden">unread messages</span>
  						</span>

                </button>
                <!--End Shoping Cart-->

            </a>
        </li>
        <%if(loginState != null){  %>
        <li class="nav-item"><a href="Logout" class="nav-link" style="color: darkred">logout</a></li>
        <% }%>
    </ul>

</nav>








<%--$sqlSubCat="SELECT DISTINCT sub_category FROM items WHERE main_category='$catogery'";--%>
<%--$resultSubCat=$link->query($sqlSubCat);--%>
<%--?>--%>
<h1 style="text-align: center;"><% out.print(itemDetailsList.get(0).getMainCategory());%></h1>
<div class="container">
    <div class="row">





    </div>
</div>
<br>



<%if(loginState == null) { %>
<div class="alert alert-danger" role="alert" align="center">
    <b>Log in before buy products</b>
</div>
<%}%>

<div class="container" >
    <div class="row">

        <% for(int i=0;i<itemDetailsList.size();i++) { %>
        <div class="col-3">
            <table  class="table table-striped table-hover" style="
 				 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  				 text-align: center;" >
                <tr>
                    <td style="height:80px;" align="center">
                        <h4><strong><% out.print(itemDetailsList.get(i).getItemName());  %></strong></h4>

                    </td>
                </tr>
                <tr>
                    <td style="height:300px;">
                        <img src="<% out.print(itemDetailsList.get(i).getImagePath());  %>" alt="image can't load" class="img-thumbnail" width="500px" height="500px" >
                    </td>
                </tr>
                <tr>
                    <td style="height:100px;" align="center">
                        <h3 id="price"><% out.print(itemDetailsList.get(i).getPrize()); %>&nbsp;LKR</h3>

                        <form action="AboutItem" method="post">
                            <input type="hidden" name="itemId" value="itemid">
                            <input type="hidden" name="path1" value="getgome2">
                            <input type="hidden" name="path2" value="getgome3">
                            <input type="submit" value="Buy Now" name="submit" class="btn btn-success" <%if(loginState==null){out.print("disabled");}%>>
                        </form>

                    </td>
                </tr>
            </table>
        </div>

        <% } %>
    </div>
</div>

<%@ include file="resources/Include/footer.html" %>
