<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title> <dec:title default="DRAGON WORLD - Bootstrap Template"/> </title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href='<c:url value="/template/assets/favicon.ico"/>' />

<!-- Bootstrap library -->

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" >

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='template/css/main_styles.css'/>" rel="stylesheet" />
<link href="<c:url value='template/css/manager_styles.css'/>" rel="stylesheet" />

<!-- Core theme JS (includes JQuery)-->
<script src='<c:url value="template/js/jquery-3.3.1.min.js"/>' type="text/javascript"></script>	
<script src='<c:url value="template/paging/jquery.twbsPagination.js"/>' type="text/javascript"></script>	

<!-- Sweetalert -->
<link href="<c:url value='template/sweetalert/sweetalert2.css'/>" rel="stylesheet" />
<script src='<c:url value="template/sweetalert/sweetalert2.js"/>' type="text/javascript"></script>	

</head>
<body>

	<div class="wrapper">
		<!-- header -->
		<%@ include file="/common/header.jsp"%>
		<!-- header -->
	
		<!-- Sweetalert -->
		<%@ include file="/common/sweetalert.jsp"%>
		<!-- Sweetalert -->
		
		<dec:body />
	
		<!-- footer -->
		<%@ include file="/common/footer.jsp"%>
		<!-- footer -->
	</div>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<!-- JS Library -->
	
	<!-- Core theme JS-->
</body>
</html>