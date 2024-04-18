<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
						rel="stylesheet">
					<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
					<style>
						body {

							padding: 0 10px;
							min-height: 100vh;
							background: url('https://png.pngtree.com/background/20230522/original/pngtree-an-anime-styled-illustration-of-an-autumn-street-with-vehicles-picture-image_2693350.jpg') center / cover no-repeat;
						}

						.update-btn {
							background-color: #1BB295;
							color: white;
							border: none;
							border-radius: 7px;
							cursor: pointer;
							transition: background-color 0.3s;
						}

						.delete-btn {
							background-color: rgb(214, 7, 7);
							color: white;
							border: none;
							border-radius: 7px;
							cursor: pointer;
							transition: background-color 0.3s;
						}


						.update-btn:hover,
						.delete-btn:hover,
						.plus:hover {
							filter: brightness(85%);
						}

						.h1 {
							padding: 20px;
						}
					</style>
					<title>Know Your Neighborhood | View Stores</title>
					<%@ page isELIgnored="false" %>
				</head>

				<nav class="navbar navbar-expand-lg  " style="border-radius: 7px; background-color:#ffffff">
					<div class="container-fluid">
						<a class="navbar-brand" href="#StoreInfo"><b style="color: #3c3b5f;">Know Your Neighborhood
							</b>| Stores</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
							aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<form action="logout" method="post" class="ms-auto d-flex">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="submit" name="Logout" value="Logout" class="btn logout" style="background-color: #3c3b5f;
									color: white; ">
							</form>
						</div>
					</div>
				</nav>

				<body class="p-3 m-0 border-0 bd-example m-0 border-0">
					<div class="container-fluid text-center align-middle">
						<div class="row">
							<h1 class="text-center h1"></h1>
						</div>

						<div class="row">

							<!-- Error message -->
							<c:if test="${not empty error_message}">
								<h2 style="color: rgb(255, 255, 255);">${error_message}</h2>
							</c:if>

							<!-- Empty stores -->
							<c:if test="${empty stores}">
								<sec:authorize access="hasRole('VIEW_CONTACT')">
									<div class="center d-flex justify-content-center align-items-center ">s
										<span style="color: rgb(0, 0, 0); padding: 25px;
													margin:10px;
													background: #fff;
													max-width: 500px;
													width: 100%;
													border-radius: 7px;
													box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);">
											<b style="font-size: larger;">No stores are added yet. </b>
										</span>
									</div>
								</sec:authorize>

								<sec:authorize access="hasRole('ADD_CONTACT')">
									<div class="center d-flex justify-content-center align-items-center ">
										<span style="padding: 25px;
												background: #fff;
												max-width: 500px;
												width: 100%;
												border-radius: 7px;
												box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);">
											<em style="color: #5c5c5c;"> Please click the + button to add new stores to
												the
												system.</em>
											<form:form action="StoreInfo" method="get">
												<a href="/StoreInfo" class="btn plus-btn plus " style="background-color: #b34daa;;
													color: rgb(255, 255, 255);
													padding: 5px 10px;
													border-radius: 10px;
													cursor: pointer;
													margin: 10px 0 0 10px;"> + </a>
											</form:form>
										</span>
									</div>
								</sec:authorize>


							</c:if>
						</div>


						<c:if test="${not empty stores}">
							<div class="row">
								<div class="table-responsive" >
									<table class="table align-middle table-hover" >
										<thead class="table-dark">
											<tr >
												<th scope="col">Store Name</th>
												<th scope="col">Phone Number</th>
												<th scope="col">Localities</th>

												<sec:authorize access="hasRole('VIEW_CONTACT')">
													<th scope="col"></th>
													<th scope="col"></th>
												</sec:authorize>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="store" items="${stores}">
												<tr>
													<td><span>${store.storeName}</span></td>
													<td><span>${store.phoneNumber}</span></td>
													<td><span>${store.localities}</span></td>
													<td><span>
															<sec:authorize access="hasRole('ADD_CONTACT')">
																<form:form action="updateStore" method="get">
																	<input type="hidden" name="id"
																		value="${store.id}" />
																	<button type="submit"
																		class="update-btn ">Update</button>
																</form:form>
															</sec:authorize>
														</span></td>

													<td><span>
															<sec:authorize access="hasRole('ADD_CONTACT')">
																<form:form action="deleteStore" method="get">
																	<input type="hidden" name="id"
																		value="${store.id}" />
																	<button type="submit"
																		class="delete-btn">Delete</button>
																</form:form>
															</sec:authorize>
														</span></td>

										
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<sec:authorize access="hasRole('ADD_CONTACT')">
								<form:form action="StoreInfo" method="get">
									<a href="/StoreInfo" class="btn plus-btn plus  " style=" background-color: #b34daa;
									color: rgb(255, 255, 255);
									padding: 5px 10px;
									border-radius: 10px;
									cursor: pointer;
									margin: 0;
									display: block;
									float: left;"> + </a>
								</form:form>
							</sec:authorize>

						</c:if>

					</div>


					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
				</body>

				</html>