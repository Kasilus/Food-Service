<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>Pay Eat Pray</title>
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
              <li><a href="/personal_area"><span class="glyphicon glyphicon-user"></span> ${nameOfUser}</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            </ul>
          </div>
      </nav>


      <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">
              <div class="carousel-caption">
                <h3>Eating out for every taste</h3>
                <p>First reataurant</p>
              </div>
            </div>

            <div class="item">
              <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
              <div class="carousel-caption">
                <h3>Eating out for every taste</h3>
                <p>Second reataurant</p>
              </div>
            </div>
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
      </div>


      <div class="about">
        <div class="container" >
            <h1>Why we?</h1>
            <h4>Eat! Everyone want eat. Often, you don't understand what exactly in this moment.
                To solve this problem once and for all, the Pay Eat Pray <abbr title="PayEatPray">PEP</abbr>
                service was created. All your favorite restaurants, bars, fast food restaurants are
                now collected here. Each of them offers its own unique menu, special offers
                and delivery method. You just have to make your choice and wait for the desired! </h4>
        </div>

        <div class="container" >
            <h1>Benefits for everyone</h1>
            <h4>You can register as a regular user and a catering establishment.
                At the same time, the main functions are not cut, but only expanded:
                all participants can make orders without leaving their own account. </h4>
        </div>

        <div class="container" >
            <h1>Simplicity and convenience</h1>
            <h4>Nothing extra for customers. The main purpose is to order food and this is the maximum emphasis.
                Huge selection of criteria for finding the right restaurant. The possibility of buying directly on the page of the chosen restaurant.
                Everything for maximum speed of order and enjoyable use.</h4>
        </div>

        <div class="container">
            <h1>Personal area</h1>
            <h4>Opens great opportunities for a registered user: allows you to edit your profile,
                view order history for all time, leave comments, rate restaurants. Feature is a field
                "Remember". With the help of it you form a personal rating of your favorite (or vice versa) restaurants.</h4>
        </div>

        <div class="container" >
            <h1>Rating of restaurants</h1>
            <h4>Each restaurant may be assessed. A single PayEatPray service will make you right
                choose and stay satisfied with the order. It is also an excellent chance for the growth of young restaurants.
                The most successful get on the main page. This will increase attendance at times.</h4>
        </div>
      </div>


      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="panel panel-primary">
              <div class="panel-heading">Restaurant of week</div>
              <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
              <div class="panel-footer">Title</div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="panel panel-primary">
              <div class="panel-heading">Restaurant of week</div>
              <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
              <div class="panel-footer">Title</div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="panel panel-primary">
              <div class="panel-heading">Restaurant of week</div>
              <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
              <div class="panel-footer">Title</div>
            </div>
          </div>
        </div>
      </div><br><br>

      <div class="container" style="margin-bottom:50px">
        <h1>Quote of the day</h1>
        <blockquote>
          <p>There are only three things women need in life: food, water, and compliments</p>
          <footer>(с) Chris Rock</footer>
        </blockquote>
      </div>


      <footer class="container-fluid text-center">

        <div class="container-fluid bg-grey" style="margin:30px auto">
          <h2 class="text-center">Contacts</h2>
          <div class="row">
            <div class="col-sm-5">
              <p>Questions and wishes will be considered in 3 days.</p>
              <p><span class="glyphicon glyphicon-map-marker"></span> Kyiv, Ukraine</p>
              <p><span class="glyphicon glyphicon-phone"></span> +380 (095) 307-15-44</p>
              <p><span class="glyphicon glyphicon-envelope"></span> its.an.omen.man@gmail.com</p>
            </div>
            <div class="col-sm-7">
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input class="form-control" id="nameSend" name="nameSend" placeholder="Your name" type="text" required>
                </div>
                <div class="col-sm-6 form-group">
                  <input class="form-control" id="emailSend" name="emailSend" placeholder="Your e-mail" type="email" required>
                </div>
              </div>
              <textarea class="form-control" id="commentsSend" name="commentsSend" placeholder="Message" rows="5"></textarea><br>
              <div class="row">
                <div class="col-sm-12 form-group">
                  <button class="btn btn-default pull-right" type="submit">Send</button>
                </div>
              </div>
            </div>
          </div>
        </div>

          <!-- Add Google Maps -->
        <div id="googleMap" style="height:400px;width:100%;"></div>
        <script>
        function myMap() {
        var myCenter = new google.maps.LatLng(50.447273, 30.454054);
        var mapProp = {center:myCenter, zoom:17, scrollwheel:false, draggable:false, mapTypeId:google.maps.MapTypeId.ROADMAP};
        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        var marker = new google.maps.Marker({position:myCenter});
        marker.setMap(map);
        }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBrIO6CheUPkAXXZgac8WparZo6Z9BSSwQ&callback=myMap"></script>

        <div class="container" text-center style="margin:30px auto">
            <h2><small>&trade;PayEatPray, 2017</small></h2>
        </div>


      </footer>

</body>
</html>
