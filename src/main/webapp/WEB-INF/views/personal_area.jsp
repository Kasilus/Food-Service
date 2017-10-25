
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Personal Area</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index.css">

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
            <li class="active"><a href="#">Home</a></li>
            <li><a href="restaurants">Restaurants</a></li>
            <li><a href="#">How to order?</a></li>
            <li><a href="#">Contacts</a></li>
            <li><a href="<c:url value="/logout" />">Logout</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${userInfo.name}</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        </ul>
    </div>
</nav>



<div class="container">
    <div class="row">
        <div class="row">
            <div class="col-md-5 col-md-offset-2">
                <label class="control-label">Name:</label>
            </div>
            <div class="col-md-3">
                <label class="control-label">${userInfo.name}</label>
            </div>
        </div>
    </div>
</div>


<div class="form-group">
    <label class="control-label col-sm-2">Name:</label>
    <div class="col-sm-10">
        <label class="control-label">${userInfo.name}</label>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">E-mail:</label>
    <div class="col-sm-10">
        <label class="control-label">${userInfo.email}</label>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Register time:</label>
    <div class="col-sm-10">
        <label class="control-label">${userInfo.registerTime}</label>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Sex:</label>
    <div class="col-sm-10">
        <label class="control-label">${userInfo.sex}</label>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Phone number:</label>
    <div class="col-sm-10">
        <label class="control-label">${userInfo.phone}</label>
    </div>
</div>




</body>


</html>