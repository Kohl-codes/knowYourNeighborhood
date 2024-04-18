<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Know Your Neighborhood | Store Details</title>
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
					background: url('https://img.freepik.com/free-photo/city-architecture-landscape-digital-art_23-2151065629.jpg?t=st=1713401919~exp=1713405519~hmac=d7c7e872e17de803223fa0c1ad4a243481e7c3e9c558ac5843cedd392b6e4bd8&w=826') center/cover no-repeat;
				}


				form {
					padding: 25px;
					background: #fff;
					max-width: 500px;
					width: 100%;
					border-radius: 7px;
					box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);
				}

				form h2 {
					font-size: 27px;
					text-align: center;
					margin: 0px 0 30px;
				}

				form .form-group {
					margin-bottom: 15px;
					position: relative;
				}

				form label {
					display: block;
					font-size: 15px;
					margin-bottom: 7px;
				}

				form input,
				form select {
					height: 45px;
					padding: 10px;
					width: 100%;
					font-size: 15px;
					outline: none;
					background: #fff;
					border-radius: 3px;
					border: 1px solid #bfbfbf;
				}

				form input:focus,
				form select:focus {
					border-color: #9a9a9a;
				}

				form input.error,
				form select.error {
					border-color: #f91919;
					background: #f9f0f1;
				}

				form small {
					font-size: 14px;
					margin-top: 5px;
					display: block;
					color: #f91919;
				}

				form .password i {
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

				.submit-btn {
					margin-top: 30px;
				}

				.submit-btn input {
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

				.submit-btn input:hover {
					background: #292841;
				}
			</style>
		</head>

		<body>
			<form:form method="post" action="save" modelAttribute="storeForm">
				<h2>Add Store</h2>
				<div class="form-group storename">
					<label for="storename">Store Name:</label>
					<form:input path="storeName" id="storename" placeholder="Enter store name" />
				</div>
				<div class="form-group number">
					<label for="number">Phone Number:</label>
					<form:input path="phoneNumber" id="number" placeholder="Enter phone number" />
				</div>
				<div class="form-group local">
					<label for="local">Localities:</label>
					<form:input path="localities" id="local" placeholder="Enter localities" />
				</div>
				<div class="form-group submit-btn">
					<input type="submit" value="Save">
				</div>
			</form:form>
			<script>
				// Selecting form and input elements
				const form = document.querySelector("form");
				const passToggleBtn = document.getElementById("pass-toggle-btn");

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
					const storenameInput = document.getElementById("storename");
					const numberInput = document.getElementById("number");
					const localInput = document.getElementById("local");

					// Getting trimmed values from input fields
					const storename = storenameInput.value.trim();
					const number = numberInput.value.trim();
					const local = localInput.value.trim();

					// Clearing previous error messages
					document.querySelectorAll(".form-group .error").forEach(field => field.classList.remove("error"));
					document.querySelectorAll(".error-text").forEach(errorText => errorText.remove());

					// Performing validation checks
					if (storename === "") {
						showError(storenameInput, "Enter store name");
					}
					if (number === "") {
						showError(numberInput, "Enter phone number");
					}
					if (local === "") {
						showError(localInput, "Enter localities");
					}

					// Checking for any remaining errors before form submission
					const errorInputs = document.querySelectorAll(".form-group .error");
					if (errorInputs.length > 0) return;

					// Submitting the form
					form.submit();
				}

				// Handling form submission event
				form.addEventListener("submit", handleFormData);</script>
		</body>

		</html>