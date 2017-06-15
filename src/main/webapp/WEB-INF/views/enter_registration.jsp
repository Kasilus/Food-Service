﻿<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Вход</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${contextPath}resources/css/enter_registration.css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"> </script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"> </script>

	</head>

	<body>

					<div class="container">
						<div class="row">
							<div class="span12">
								<div class="" id="loginModal">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h3>У вас уже есть аккаунт?</h3>
									</div>
									<div class="modal-body">
										<div class="well">
											<ul class="nav nav-tabs">
												<li class="active">
													<a href="#login" data-toggle="tab">Войти</a>
												</li>
												<li>
													<a href="#registration" data-toggle="tab">Создать аккаунт</a>
												</li>
											</ul>
											<div id="myTabContent" class="tab-content" style="margin-top:20px">
												<div class="tab-pane active in" id="login">
													<div id="legendEnter">
														<legend class="">Вход</legend>
													</div>

													<form method="POST" action="j_spring_security_check"  class="form-horizontal">
														<div class="form-group" >

															<label class="control-label col-sm-2" for="loginEnter">Логин:</label>
															<div class="col-sm-10">
																<input type="text" name="user_login" class="form-control" id="loginEnter" placeholder="Введите логин">
															</div>
														</div>

														<div class="form-group" >
															<label class="control-label col-sm-2" for="passwordEnter">Пароль:</label>
															<div class="col-sm-10">
																<input type="password" name="password_login" class="form-control" id="passwordEnter" placeholder="Введите пароль">
															</div>
														</div>

														<div class="form-group" >
																<div class=" col-sm-offset-2 col-sm-10">
																	<c:if test="${not empty error}">
																		<span class="error">${error}</span>
																	</c:if>
																</div>
														</div>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
																<div class="checkbox">
																	<label>
																		<input name="_spring_security_remember_me" type="checkbox"> Запомнить меня</label>
																</div>
															</div>
														</div>

                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
														<div class="form-group" >
															<div class="col-sm-offset-2 col-sm-10">
																<button type="submit" class="btn btn-primary">Отправить</button>
															</div>
														</div>

													</form>
												</div>



												<div class="tab-pane fade" id="registration">

													<div id="legendRegistration">
														<legend class="">Регистрация</legend>
													</div>

													<form:form method="POST" modelAttribute="userForm" class="form-horizontal">
														<div class="form-group">
															<label class="control-label col-sm-2">Кем вы будете?</label>
															<div class = "col-sm-10">
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="user-radio" id="UserRadiobutton" checked="">Пользователь</label>
																</div>
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="restaurant-radio" id="RestaurantRadiobutton">Заведение общественного питания</label>
																</div>
															</div>
														</div>

														<spring:bind path="name">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="nameRegistration" id="nameName">Имя:</label>
															<div class="col-sm-10">
																<form:input type="text" path="name" class="form-control" id="nameRegistration" placeholder="" />
																<form:errors path="name"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="username">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="usernameRegistration">Логин:</label>
															<div class="col-sm-10">
																<form:input type="text" path="username" class="form-control" id="usernameRegistration" placeholder="Придумайте логин" />
																<form:errors path="username"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="password">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="passwordRegistration">Придумайте пароль:</label>
															<div class="col-sm-10">
																<form:input type="password" path="password" class="form-control" id="passwordRegistration" placeholder="" />
																<form:errors path="password"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="passwordConfirm">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="passwordConfirmationRegistration">Подтвердите пароль:</label>
															<div class="col-sm-10">
																<form:input type="password" path="passwordConfirm" class="form-control" id="passwordConfirmationRegistration" placeholder="" />

																<form:errors path="passwordConfirm"></form:errors>
																</div>
														</div>
														</spring:bind>

														<div class="form-group" id="sex">
															<label class="control-label col-sm-2" for="sexRegistration">Пол:</label>
															<div class="col-sm-10">
																  <select class="form-control" id="sexRegistration">
																	<option>Мужской</option>
																	<option>Женский</option>
																  </select>
															</div>
														</div>

														<spring:bind path="email">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="emailRegistration">Почта:</label>
															<div class="col-sm-10">
																<form:input type="text" path="email" class="form-control" id="emailRegistration" placeholder="Введите адрес почты" />

																<form:errors path="email"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="phone">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="phoneRegistration">Мобильный телефон:</label>
															<div class="col-sm-10">
																<form:input type="text" path="phone" class="form-control" id="phoneRegistration" placeholder="+380" />

																<form:errors path="phone"></form:errors>
															</div>
														</div>
														</spring:bind>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
																<button  type="submit" class="btn btn-primary">Зарегестрироваться</button>
															</div>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

<script>

$('input[name=usertype]').change(function()  {
    // change the page per this logic
    switch ($('input[name=usertype]:checked').val()) {
        case 'user-radio':
            $('#nameName').text('Имя:');
			document.getElementById('sex').style.display='block';	break;
        case 'restaurant-radio':
            $('#nameName').text('Название:');
			document.getElementById('sex').style.display='none';    break;
}
});
</script>



	</body>
</html>