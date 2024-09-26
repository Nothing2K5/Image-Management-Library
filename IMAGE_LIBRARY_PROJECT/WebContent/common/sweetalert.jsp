<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<input type="hidden" id="message" value="${message }">
<script type="text/javascript">
	var message = document.getElementById("message").value;
	if (message == "not_permission") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Not Permission!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "not_login") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Not Login!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "login_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Wrong Username Or Password!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "login_success") {
		Swal.fire({
			title : "Good job!",
			text : "Login Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "sign_up_failed_user_name_exists") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Username Already Exists!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "sign_up_failed_re_password") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Password And Re_Password Do Not Match!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "sign_up_success") {
		Swal.fire({
			title : "Good job!",
			text : "Sign Up Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "logout_success") {
		Swal.fire({
			title : "Good job!",
			text : "Logout Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "add_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Add Failed!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "add_failed_user_name_exists") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Username Already Exists!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	}else if (message == "add_success") {
		Swal.fire({
			title : "Good job!",
			text : "Add Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "delete_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Delete Failed!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "delete_success") {
		Swal.fire({
			title : "Good job!",
			text : "Delete Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "edit_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Edit Failed!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "edit_success") {
		Swal.fire({
			title : "Good job!",
			text : "Edit Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "download_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Download Failed!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "download_success") {
		Swal.fire({
			title : "Good job!",
			text : "Download Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "create_failed") {
		Swal.fire({
			icon : "error",
			title : "Oops...",
			text : "Create Failed!",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	} else if (message == "create_success") {
		Swal.fire({
			title : "Good job!",
			text : "Create Success!",
			icon : "success",
			background: '#1A1D21',
			color: '#DEE2E6'
		});
	}
</script>