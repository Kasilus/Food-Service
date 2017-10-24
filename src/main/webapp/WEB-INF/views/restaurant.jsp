<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Restaurants</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/restaurants.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>

<div class="jumbotron">
    <div class="container text-center">
        <h1>Pay Eat Pray</h1>
        <p>All you need!</p>
    </div>
</div>

<nav class="navbar navbar-inverse">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">PEP</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
            <li ><a href="/home">Home</a></li>
            <li class="active"><a href="/restaurants">Restaurants</a></li>
            <li><a href="#">How to order?</a></li>
            <li><a href="#">Contacts</a></li>
            <li><a href="<c:url value="/logout" />">Logout</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Personal area</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        </ul>
    </div>

</nav>

<div class = "container" style="margin-top:30px">

    <div class = "restaurant_item">
        <div class = "row">
            <div class = "col-sm-5">
                <div class = "restaurantPhoto">
                    <img src = "/myImage/imageDisplay?id=${restaurant.id}" alt="photo" >
                </div>
            </div>
            <div class = "col-sm-7">
                <div class = "restaurant_name">
                    <a href="/restaurant/${restaurant.id}"><strong> <c:out value="${restaurant.title}"/></strong></a>
                </div>
                <div class = "restaurant_type">
                    <p><b>Type:</b> <span> <c:out value="${restaurant.type.name}"/></span></p>
                </div>
                <div class = "restaurant_descr">
                    <p><c:out value="${restaurant.description}"/></p>
                </div>
            </div>
        </div>
    </div>

<h1>Menu</h1>

 <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Name</th>
        <th>Cost, UAH</th>
		<th>Buy</th>
      </tr>
    </thead>
    <tbody>

    <c:set var="counter" value="0"></c:set>

    <c:forEach items="${menuList}" var="meal">

        <c:set var="counter" value="${counter + 1}"></c:set>

            <tr id = "meal" + ${counter}>
            <td>${counter}</td>
            <td>${meal.name}</td>
            <td>${meal.price}</td>
            <td class="vcenter"><input type="checkbox" checked = "true" id="" value="1"/></td>
            </tr>

    </c:forEach>


    </tbody>
  </table>
  </div>


</div>

<footer>
  <div class="container-fluid bg-grey text-center">
	<h2><small>&trade;PayEatPray, 2017</small></h2>
 </div>
  </footer>

</body>
</html>
