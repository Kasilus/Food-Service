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
            <li ><a href="home">Home</a></li>
            <li class="active"><a href="#">Restaurants</a></li>
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

    <div class = "container">

        <div class = "search_with_params">
             <form>
                <div class = "search">
                    <div class = "row">
                        <div class = "col-sm-2">
                        </div>
                        <div class = "col-sm-8">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class = "row">
                    <div class = "col-sm-6">
                    </div>
                    <div class = "col-sm-2">
                        <label for="restaurantsSort">Sort by:</label>
                          <select class="form-control" id="restaurantsSort">
                            <option>popularity</option>
                            <option>rate</option>
                            <option>the newest</option>
                          </select>
                    </div>
                    <div class = "col-sm-2">
                    <label for="restaurantsOnpage">Amount on page:</label>
                      <select class="form-control" id="restaurantsOnpage">
                        <option>5</option>
                        <option>10</option>
                        <option>15</option>
                        <option>20</option>
                      </select>
                    </div>
                </div>
              </form>
        </div>
  
        <div class="restaurant_list">

          <div class = "restaurant_item">
              <div class = "row">
                <div class = "col-sm-5">
                    <div class = "restaurantPhoto">
                        <img src = "${contextPath}/resources/images/dominos.jpg" alt="photo" >
                    </div>
                </div>
                <div class = "col-sm-7">
                    <div class = "restaurant_name">
                        <a href="#"><strong>Domino's Pizza</strong></a>
                    </div>
                    <div class = "restaurant_type">
                        <p><b>Type:</b> <span>Pizzeria</span></p>
                    </div>
                    <div class = "restaurant_descr">
                    <p>"Domino's Pizza" is a world-wide network of pizzerias that has overcome the long path to leadership. Since 1960, the company has not stopped increasing the number of pizzerias around the world..
                        Today "Domino's Pizza" has already become a world brand and is the No. 1 company in the world for the delivery of pizza - the order is delivered in 30 minutes. The global network has more than 12 000
                        pizzerias in 85 countries of the world. Each Dominos pizzeria not only hospitably opens its doors to visitors and carries on a culinary journey to tasting pizza, but
                        is ready to bring you a culinary masterpiece home.</p>
                    </div>
                </div>
              </div>
          </div>

            <div class = "restaurant_item">
                <div class = "row">
                    <div class = "col-sm-5">
                        <div class = "restaurantPhoto">
                            <img src = "${contextPath}/resources/images/dominos.jpg" alt="photo" >
                        </div>
                    </div>
                    <div class = "col-sm-7">
                        <div class = "restaurant_name">
                            <a href="#"><strong>Domino's Pizza</strong></a>
                        </div>
                        <div class = "restaurant_type">
                            <p><b>Type:</b> <span>Pizzeria</span></p>
                        </div>
                        <div class = "restaurant_descr">
                            <p>"Domino's Pizza" is a world-wide network of pizzerias that has overcome the long path to leadership. Since 1960, the company has not stopped increasing the number of pizzerias around the world..
                                Today "Domino's Pizza" has already become a world brand and is the No. 1 company in the world for the delivery of pizza - the order is delivered in 30 minutes. The global network has more than 12 000
                                pizzerias in 85 countries of the world. Each Dominos pizzeria not only hospitably opens its doors to visitors and carries on a culinary journey to tasting pizza, but
                                is ready to bring you a culinary masterpiece home.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class = "restaurant_item">
                <div class = "row">
                    <div class = "col-sm-5">
                        <div class = "restaurantPhoto">
                            <img src = "${contextPath}/resources/images/dominos.jpg" alt="photo" >
                        </div>
                    </div>
                    <div class = "col-sm-7">
                        <div class = "restaurant_name">
                            <a href="#"><strong>Domino's Pizza</strong></a>
                        </div>
                        <div class = "restaurant_type">
                            <p><b>Type:</b> <span>Pizzeria</span></p>
                        </div>
                        <div class = "restaurant_descr">
                            <p>"Domino's Pizza" is a world-wide network of pizzerias that has overcome the long path to leadership. Since 1960, the company has not stopped increasing the number of pizzerias around the world..
                                Today "Domino's Pizza" has already become a world brand and is the No. 1 company in the world for the delivery of pizza - the order is delivered in 30 minutes. The global network has more than 12 000
                                pizzerias in 85 countries of the world. Each Dominos pizzeria not only hospitably opens its doors to visitors and carries on a culinary journey to tasting pizza, but
                                is ready to bring you a culinary masterpiece home.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class = "restaurant_item">
                <div class = "row">
                    <div class = "col-sm-5">
                        <div class = "restaurantPhoto">
                            <img src = "${contextPath}/resources/images/dominos.jpg" alt="photo" >
                        </div>
                    </div>
                    <div class = "col-sm-7">
                        <div class = "restaurant_name">
                            <a href="#"><strong>Domino's Pizza</strong></a>
                        </div>
                        <div class = "restaurant_type">
                            <p><b>Type:</b> <span>Pizzeria</span></p>
                        </div>
                        <div class = "restaurant_descr">
                            <p>"Domino's Pizza" is a world-wide network of pizzerias that has overcome the long path to leadership. Since 1960, the company has not stopped increasing the number of pizzerias around the world..
                                Today "Domino's Pizza" has already become a world brand and is the No. 1 company in the world for the delivery of pizza - the order is delivered in 30 minutes. The global network has more than 12 000
                                pizzerias in 85 countries of the world. Each Dominos pizzeria not only hospitably opens its doors to visitors and carries on a culinary journey to tasting pizza, but
                                is ready to bring you a culinary masterpiece home.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class = "restaurant_item">
                <div class = "row">
                    <div class = "col-sm-5">
                        <div class = "restaurantPhoto">
                            <img src = "${contextPath}/resources/images/dominos.jpg" alt="photo" >
                        </div>
                    </div>
                    <div class = "col-sm-7">
                        <div class = "restaurant_name">
                            <a href="#"><strong>Domino's Pizza</strong></a>
                        </div>
                        <div class = "restaurant_type">
                            <p><b>Type:</b> <span>Pizzeria</span></p>
                        </div>
                        <div class = "restaurant_descr">
                            <p>"Domino's Pizza" is a world-wide network of pizzerias that has overcome the long path to leadership. Since 1960, the company has not stopped increasing the number of pizzerias around the world..
                                Today "Domino's Pizza" has already become a world brand and is the No. 1 company in the world for the delivery of pizza - the order is delivered in 30 minutes. The global network has more than 12 000
                                pizzerias in 85 countries of the world. Each Dominos pizzeria not only hospitably opens its doors to visitors and carries on a culinary journey to tasting pizza, but
                                is ready to bring you a culinary masterpiece home.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class = "pages_numbers">
        <ul class="pagination">
            <li class="active"><a href="#">1</a></li>
            <li ><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
          </ul>
          </div>
          </div>

          <footer>
              <div class="container-fluid bg-grey text-center">
                <h2><small>&trade;PayEatPray, 2017</small></h2>
              </div>
          </footer>

</body>
</html>
