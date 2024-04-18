<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Know Your Neighborhood |Login</title>
		<!-- Fontawesome CDN Link For Icons -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap');

			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: 'Open Sans', sans-serif;
			}

			body {
				display: flex;
				align-items: center;
				justify-content: center;
				padding: 0 10px;
				min-height: 100vh;
				background: url('https://marketplace.canva.com/EAFsQwcHTCM/1/0/1600w/canva-blue-illustration-night-city-desktop-wallpaper-Pl5xruiCVXY.jpg') center/cover no-repeat;
			}

			.login-form form {
				padding: 25px;
				background: #fff;
				max-width: 500px;
				width: 100%;
				border-radius: 7px;
				box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);
			}

			.login-form form h2 {
				font-size: 27px;
				text-align: center;
				margin: 0px 0 30px;
			}

			.login-form form .form-group {
				margin-bottom: 15px;
				position: relative;
			}

			.login-form form label {
				display: block;
				font-size: 15px;
				margin-bottom: 7px;
			}

			.login-form form input,
			.login-form form select {
				height: 45px;
				padding: 10px;
				width: 100%;
				font-size: 15px;
				outline: none;
				background: #fff;
				border-radius: 3px;
				border: 1px solid #bfbfbf;
			}

			.login-form form input:focus,
			.login-form form select:focus {
				border-color: #9a9a9a;
			}

			.login-form form input.error,
			.login-form form select.error {
				border-color: #f91919;
				background: #f9f0f1;
			}

			.login-form form small {
				font-size: 14px;
				margin-top: 5px;
				display: block;
				color: #f91919;
			}

			.login-form form .password i {
				position: absolute;
				right: 0px;
				height: 45px;
				top: 28px;
				font-size: 13px;
				line-height: 45px;
				width: 45px;
				cursor: pointer;
				color: #939393;
				text-align: center;
			}

			.login-form .submit-btn {
				margin-top: 30px;
			}

			.login-form .submit-btn input {
				color: white;
				border: none;
				height: auto;
				font-size: 16px;
				padding: 13px 0;
				border-radius: 5px;
				cursor: pointer;
				font-weight: 500;
				text-align: center;
				background: #3c3b5f;
				transition: 0.2s ease;
			}

			.login-form .submit-btn input:hover {
				background: #292841;
			}
		</style>
	</head>

	<body class="login-form">
		<form method="post" action="/login">
			<h2 style="color: #3c3b5f;">Login</h2>

			<div class="form-group username">
				<label for="username">User Name:</label>
				<input path="userName" id="username" name="username" placeholder="Enter user name" />
			</div>
			<div class="form-group password">
				<label for="password">Password:</label>
				<input path="password" id="password" name="password" placeholder="Enter password" />
			</div>

			<c:if test="${error_string != null}">
				<p style="color: #cf0000;">${error_string}</p>
			</c:if>

			<div class="form-group submit-btn">
				<input type="submit" name="Login" value="Login">
			</div>
		</form>
		<script>
			// Selecting form and input elements
			const form = document.querySelector("form");

			// Function to display error messages
			const showError = (field, errorText) => {
				field.classList.add("error");
				const errorElement = document.createElement("small");
				errorElement.classList.add("error-text");
				errorElement.innerText = errorText;
				field.closest(".form-group").appendChild(errorElement);
			}

			// Function to handle form submission
			const handleFormData = (e) => {
				e.preventDefault();

				// Retrieving input elements
				const usernameInput = document.getElementById("username");
				const passwordInput = document.getElementById("password");

				// Getting trimmed values from input fields
				const username = usernameInput.value.trim();
				const password = passwordInput.value.trim();

				// Clearing previous error messages
				document.querySelectorAll(".form-group .error").forEach(field => field.classList.remove("error"));
				document.querySelectorAll(".error-text").forEach(errorText => errorText.remove());

				// Performing validation checks
				if (username === "") {
					showError(usernameInput, "Enter user name");
				}
				if (password === "") {
					showError(passwordInput, "Enter password");
				}

				// Checking for any remaining errors before form submission
				const errorInputs = document.querySelectorAll(".form-group .error");
				if (errorInputs.length > 0) return;

				// Submitting the form
				form.submit();
			}

			// Handling form submission event
			form.addEventListener("submit", handleFormData);
		</script>

	</body>

	</html>