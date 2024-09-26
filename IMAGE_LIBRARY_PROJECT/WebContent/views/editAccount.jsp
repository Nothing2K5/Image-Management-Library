<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-account"/>
<c:url var ="AccountURL" value="/admin-manager-account"/>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<title>Manager Account</title>
</head>
<body>
	<!-- Edit Account-->
	<div class="bg-background p-5">
        <section class="container bg-dark p-5 rounded">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <form id="myForm">
                        <div class="modal-header bg-dark text-white">
                            <h4 class="modal-title">Information</h4>
                        </div>
                        <div class="modal-body bg-dark">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id"><i class="bi bi-check"></i> ID:</label> 
										<input type="text" name="id" id="id" class="form-control" value="${account.id }" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fullName"><i class="bi bi-person-circle"></i> FullName: </label> 
										<input type="text" name="fullName" id="fullName" class="form-control" value="${account.fullName }" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="userName"><i class="bi bi-person-circle"></i> UserName:</label> 
										<input type="text" name="userName" id="userName" class="form-control" value="${account.userName }" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="password"><i class="bi bi-key"></i> Password:</label> 
										<input type="text" name="password" id="password" class="form-control" value="${account.password }" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cateId"><i class="bi bi-tags"></i> RoleID:</label>
										<select name="roleId" id="roleId" class="form-select" aria-label="Default select example" class="form-control">
											<c:forEach items="${listRole}" var="object">
												<option ${object.id == account.roleId ? 'selected' : '' } value="${object.id}">${object.name}</option>
											</c:forEach>
										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-dark">
                            <a type="button" class="btn btn-secondary" href='<c:url value="/admin-manager-account?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Close</a>
							<button class="btn btn-primary submit" value="Update Account" id="btnUpdateAccount">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
	<!-- End Edit Account-->
	
	<script>
    $('#btnUpdateAccount').click(function (e) {
        e.preventDefault(); //Tranh submit nham url (url dang dung thay vi url can submit)
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        updateAccount(data);  
    });
	
    function updateAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${AccountURL}?id="+result.id+"&type=edit&message=edit_success";
            },
            error: function (error) {
            	window.location.href = "${AccountURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=edit_failed";
            }
        });
    }
	</script>
</body>
</html>