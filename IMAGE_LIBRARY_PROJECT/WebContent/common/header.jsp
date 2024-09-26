<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Header -->
<header class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="#">
			DRAGON
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item">
					<a class="nav-link active"aria-current="page" href='<c:url value="/home"/>'>Home</a>
				</li>
				<c:if test="${sessionScope.ACCOUNTMODEL.roleId == 1 }">
					<%-- <li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/user-manager-image?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Image</a></li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/user-manager-category?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Category</a></li> --%>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/admin-manager-account?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Account</a></li>
				</c:if>
				<c:if test="${sessionScope.ACCOUNTMODEL.roleId == 2 }">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/user-manager-image?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Image</a></li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/user-manager-category?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Category</a></li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/user-manager-album?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Manager Album</a></li>
				</c:if>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:forEach items="${listCategory}" var="object">
							<li class="list-group-item text-white">
								<a class="dropdown-item" href='<c:url value="/explore?cateId=${object.id }"/>'>${object.name}</a>
							</li>
						</c:forEach>
					</ul>
				</li>
			</ul>
			<ul class="navbar-nav">
				<c:if test="${sessionScope.ACCOUNTMODEL != null }">
					<c:if test="${sessionScope.ACCOUNTMODEL.roleId == 1}">
						<li class="nav-item dropdown">
							<a class="nav-link" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-gear"></i></a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li class="list-group-item text-white">
									<a class="dropdown-item" href='<c:url value="/admin-home?choose=backup"/>'>Backup</a>
									<a class="dropdown-item" href='<c:url value="/admin-home?choose=restore"/>'>Restore</a>
								</li>
							</ul>
						</li>
					</c:if>
					<li class="nav-item"><a class="nav-link" href="#">${sessionScope.ACCOUNTMODEL.fullName }</a></li>
					<a href="<c:url value='/logout?action=logout'/>"><button class="btn btn-outline-dark">LOGOUT</button></a>
				</c:if>
				<c:if test="${sessionScope.ACCOUNTMODEL == null }">
					<div class="* btn-group-md">
						<button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#signUpForm">SIGN UP</button>
						<button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#loginForm">LOGIN</button>	
					</div>
				</c:if>
			</ul>
		</div>
	</div>
</header>
<!-- End Header -->

<!--Modal Form-->
<!-- Login Form -->
<div class="modal fade" id="loginForm">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="<c:url value='/login?action=login'/>" method="post">
                <div class="modal-header bg-dark text-white">
                    <h3 class="modal-title">Login</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body bg-dark text-white">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="userName"><i class="bi bi-person-circle"></i> UserName:</label>
                                <input type="text" name="userName" id="userName" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="password"><i class="bi bi-key"></i> Password:</label>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-dark">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary submit">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Sign Up Form -->
<div class="modal fade" id="signUpForm">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="<c:url value='/sign-up?action=signUp'/>" method="post" name="signUp">
                <div class="modal-header bg-dark text-white">
                    <h3 class="modal-title">Sign Up</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body bg-dark text-white">
                    <div class="row g-3">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="fullName"><i class="bi bi-person-circle"></i> Full Name:</label>
                                <input type="text" name="fullName" id="fullName" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="userName"><i class="bi bi-person-circle"></i> User Name:</label>
                                <input type="text" name="userName" id="userName" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="password"><i class="bi bi-key"></i> Password:</label>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="rePassword"><i class="bi bi-check"></i> Re-enter Password:</label>
                                <input type="password" name="rePassword" id="rePassword" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-dark">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary submit">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>
