<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Вход</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">

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
														
													<form class="form-horizontal">
														<div class="form-group">
															<label class="control-label col-sm-2" for="loginEnter">Логин:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="loginEnter" placeholder="Введите логин">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-sm-2" for="passwordEnter">Пароль:</label>
															<div class="col-sm-10">
																<input type="password" class="form-control" id="passwordEnter" placeholder="Введите пароль">
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
																<div class="checkbox">
																	<label>
																		<input type="checkbox"> Запомнить меня</label>
																	</div>
																</div>
														</div>
														<div class="form-group">
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

													<form class="form-horizontal">
														<div class="form-group">
															<label class="control-label col-sm-2">Кем вы будете?</label>
															<div class = "col-sm-10">
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="user-radio" id="Userbutton" checked="">Пользователь</label>
																</div>
																<div class="radio-inline">
																	<label>
																		<input type="radio" name="usertype" value="place-radio" id="Restaurantbutton">Заведение общественного питания</label>
																</div>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-sm-2" for="nameRegistration" id="nameName">Имя:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="nameRegistration" placeholder="">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-sm-2" for="loginRegistration">Логин:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="loginRegistration" placeholder="Придумайте логин">
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-sm-2" for="passwordRegistration">Придумайте пароль:</label>
															<div class="col-sm-10">
																<input type="password" class="form-control" id="passwordRegistration" placeholder="">
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-sm-2" for="passwordConfirmationRegistration">Подтвердите пароль:</label>
															<div class="col-sm-10">
																<input type="password" class="form-control" id="passwordConfirmationRegistration" placeholder="">
																</div>
														</div>

														<div class="form-group" id="sex">
															<label class="control-label col-sm-2" for="sexRegistration">Пол:</label>
															<div class="col-sm-10">
																  <select class="form-control" id="sexRegistration">
																	<option>Мужской</option>
																	<option>Женский</option>
																  </select>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-sm-2" for="emailRegistration">Почта:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="emailRegistration" placeholder="Введите адрес почты">
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-sm-2" for="phoneRegistration">Мобильный телефон:</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="phoneRegistration" placeholder="+380">
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
																<button  type="submit" class="btn btn-primary">Зарегестрироваться</button>
															</div>
														</div>
													</form>
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
        case 'place-radio':
            $('#nameName').text('Название:');
			document.getElementById('sex').style.display='none';    break;
}
});
</script>					



	</body>
</html>