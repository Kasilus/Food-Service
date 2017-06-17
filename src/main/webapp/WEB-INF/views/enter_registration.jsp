<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
	<head>
		<title>Enter</title>
		<meta charset="utf-8" />
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
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
										<h3>Have an account?</h3>
									</div>
									<div class="modal-body">
										<div class="well">
											<ul class="nav nav-tabs">
												<li>
													<a href="#loginTab" data-toggle="tab">Log in</a>
												</li>
												<li>
													<a href="#registrationTab" data-toggle="tab">Create account</a>
												</li>
											</ul>
											<div id="myTabContent" class="tab-content" style="margin-top:20px">
												<div class="tab-pane active in" id="loginTab">
													<div id="legendEnter">
														<legend class="">Enter</legend>
													</div>

													<form method="POST" action="j_spring_security_check"  class="form-horizontal">
														<div class="form-group" >

															<label class="control-label col-sm-2" for="loginEnter">Login:</label>
															<div class="col-sm-10">
																<input type="text" name="user_login" class="form-control" id="loginEnter" placeholder="Enter login">
															</div>
														</div>

														<div class="form-group" >
															<label class="control-label col-sm-2" for="passwordEnter">Password:</label>
															<div class="col-sm-10">
																<input type="password" name="password_login" class="form-control" id="passwordEnter" placeholder="Enter password">
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
																		<input name="_spring_security_remember_me" type="checkbox"> Remember me</label>
																</div>
															</div>
														</div>

                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
														<div class="form-group" >
															<div class="col-sm-offset-2 col-sm-10">
																<button type="submit" class="btn btn-primary">Send</button>
															</div>
														</div>

													</form>
												</div>



												<div class="tab-pane" id="registrationTab">

													<div id="legendRegistration">
														<legend class="">Registration</legend>
													</div>

													<form:form method="POST" modelAttribute="userForm" class="form-horizontal">
														<div class="form-group">
															<label class="control-label col-sm-2">Who will you be?</label>
															<div class = "col-sm-10">
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="user-radio" id="UserRadiobutton" checked="">User</label>
																</div>
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="restaurant-radio" id="RestaurantRadiobutton">Restaurant</label>
																</div>
															</div>
														</div>

														<spring:bind path="name">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="nameRegistration" id="nameName">Name:</label>
															<div class="col-sm-10">
																<form:input type="text" path="name" class="form-control" id="nameRegistration" placeholder="" />
																<form:errors path="name"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="username">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="usernameRegistration">Login:</label>
															<div class="col-sm-10">
																<form:input type="text" path="username" class="form-control" id="usernameRegistration" placeholder="Create a login" />
																<form:errors path="username"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="password">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="passwordRegistration">Create a password:</label>
															<div class="col-sm-10">
																<form:input type="password" path="password" class="form-control" id="passwordRegistration" placeholder="" />
																<form:errors path="password"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="passwordConfirm">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="passwordConfirmationRegistration">Confirm your password:</label>
															<div class="col-sm-10">
																<form:input type="password" path="passwordConfirm" class="form-control" id="passwordConfirmationRegistration" placeholder="" />

																<form:errors path="passwordConfirm"></form:errors>
																</div>
														</div>
														</spring:bind>

														<spring:bind path="sex">
														<div class="form-group" id="sexSelect">
															<label class="control-label col-sm-2" for="sexRegistration">Sex:</label>
															<div class="col-sm-10">
																<form:select path="sex" id="sexRegistration" cssClass="form-control">
																	<form:option value="M" label="Male" />
																	<form:option value="F" label="Female" />
																</form:select>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="email">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="emailRegistration">E-mail:</label>
															<div class="col-sm-10">
																<form:input type="text" path="email" class="form-control" id="emailRegistration" placeholder="Enter e-mail address" />

																<form:errors path="email"></form:errors>
															</div>
														</div>
														</spring:bind>

														<spring:bind path="phone">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label col-sm-2" for="phoneRegistration">Mobile:</label>
															<div class="col-sm-10">
																<form:input type="text" path="phone" class="form-control" id="phoneRegistration" placeholder="+380" />

																<form:errors path="phone"></form:errors>
															</div>
														</div>
														</spring:bind>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
																<button  type="submit" class="btn btn-primary">Register</button>
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
            $('#nameName').text('Name:');
			document.getElementById('sexSelect').style.display='block';	break;
        case 'restaurant-radio':
            $('#nameName').text('Title:');
			document.getElementById('sexSelect').style.display='none';    break;
}
});
</script>

<script>
	$(function() {
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			localStorage.setItem('lastTab', $(this).attr('href'));
		});

		var lastTab = localStorage.getItem('lastTab');
		if (lastTab) {
			$('[href="' + lastTab + '"]').tab('show');
		}
	});
</script>



	</body>
</html>