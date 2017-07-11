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
             <form action="/search">
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
                      <select class="form-control" id="restaurantsOnPage" name="restaurantsOnPage">
                          <option ${count == 3 ? 'selected="selected"' : ''} value="3">3</option>
                        <option ${count == 5 ? 'selected="selected"' : ''} value="5">5</option>
                        <option ${count == 10 ? 'selected="selected"' : ''}  value="10">10</option>
                        <option ${count == 15 ? 'selected="selected"' : ''} value="15">15</option>
                        <option ${count == 20 ? 'selected="selected"' : ''} value="20">20</option>
                          <%--<option ${count == 50 ? 'selected="selected"' : ''} value="50">50</option>--%>
                      </select>
                    </div>
                </div>
              </form>
        </div>
  
        <div class="restaurant_list">

<c:forEach items="${restaurantList}" var="restaurant">



    <div class = "restaurant_item">
        <div class = "row">
            <div class = "col-sm-5">
                <div class = "restaurantPhoto">
                    <img src = "/myImage/imageDisplay?id=${restaurant.id}" alt="photo" >
                </div>
            </div>
            <div class = "col-sm-7">
                <div class = "restaurant_name">
                    <a href="#"><strong> <c:out value="${restaurant.title}"/></strong></a>
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

</c:forEach>

        </div>

        <div class = "pages_numbers">
        <ul class="pagination">


            <li class="${pageNumber == 1 ? "active" : ""}"><a href="search?restaurantsOnPage=${count}&pageNumber=${1}">1</a></li>

            <c:choose>

                <c:when test="${pageNumber == 1 || pageNumber == 2}">
                    <c:set var="begin" value="2"></c:set>
                        <c:choose>
                            <c:when test="${allPages<6}">
                                <c:set var="end" value="${allPages}"></c:set>
                            </c:when>
                            <c:otherwise>
                                <c:set var="end" value="6"></c:set>
                            </c:otherwise>
                        </c:choose>
                </c:when>
                <c:otherwise>

                    <c:if test="${(allPages - 5)>2 }">
                    <li class="non-active"><a href="#">...</a></li>
                    </c:if>

                    <c:choose>

                        <c:when test="${allPages - pageNumber >= 5 }">
                            <c:set var="begin" value="${pageNumber}"></c:set>
                            <c:set var="end" value="${pageNumber + 5}"></c:set>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                               <c:when test="${allPages > 5}">
                                   <c:set var="begin" value="${pageNumber-(5-(allPages - pageNumber))}"/>
                               </c:when>
                               <c:otherwise>
                                   <c:set var="begin" value="${2}"/>
                               </c:otherwise>
                           </c:choose>

                            <c:set var="end" value="${allPages}"/>
                        </c:otherwise>

                    </c:choose>

                </c:otherwise>
            </c:choose>

            <c:forEach var="i" begin="${begin}" end="${end}">
                <li class="${i == pageNumber ? "active" : ""}"><a href="search?restaurantsOnPage=${count}&pageNumber=${i}">${i}</a></li>
            </c:forEach>

            <c:if test="${end != allPages}">
                <c:if test="${end != allPages - 1}">
                    <li class="non-active"><a href="#">...</a></li>
                </c:if>
                <li class="${allPages == pageNumber ? "active" : ""}"><a href="search?restaurantsOnPage=${count}&pageNumber=${allPages}">${allPages}</a></li>
            </c:if>

        </ul>
          </div>
          </div>

          <footer>
              <div class="container-fluid bg-grey text-center">
                <h2><small>&trade;PayEatPray, 2017</small></h2>
              </div>
          </footer>

    <script>
    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires="+d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
                }
        }
        return "";
    }
    </script>

</body>
</html>
