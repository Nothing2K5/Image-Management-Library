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
	<!-- Manager Account-->
	<div class="bg-background py-setup">
	    <section class="bg-dark p-4 rounded container">
	        <div class="row mb-3">
	            <div class="col">
	                <button class="btn btn-primary" data-bs-toggle="modal" data-toggle="tooltip" title='Add Account' data-bs-target="#addForm">
	                    <i class="bi bi-card-image"></i> New Account
	                </button>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col">
	                <div class="table-responsive">
	                    <table class="table table-striped table-hover mt-3 text-center table-bordered table-dark">
	                        <thead>
	                            <tr>
	                                <th>ID</th>
									<th>FullName</th>
									<th>UserName</th>
									<th>Password</th>
									<th>RoleID</th>
									<th>Actions</th>
	                            </tr>
	                        </thead>
	                        <tbody id="dataAccount">
	                            <c:forEach items="${account.listResult}" var="object">
	                                <tr>
	                                    <td>${object.id}</td>
	                                    <td>${object.fullName}</td>
	                                    <td>${object.userName}</td>
	                                    <td>${object.password}</td>
	                                    <td>${object.roleId}</td>
	                                    <td><a href='<c:url value="/admin-manager-account?id=${object.id}&type=edit"/>' class="edit" data-toggle="tooltip" title='Edit Account'> <i class="bi bi-pencil-square"></i></a> 
										 	<a type="button" id="btnDeleteAccount" class="delete" data-toggle="tooltip" title='Delete Account'><i class="bi bi-trash"></i></a>
											<input type="hidden" value="" id="id" name="id"/>	
										</td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
		                <form id="formSubmit" action="<c:url value='/admin-manager-account'/>">
		                    <ul class="pagination" id="pagination"></ul>
		                    <input type="hidden" value="" id="page" name="page"/>
		                    <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
		                    <input type="hidden" value="" id="sortName" name="sortName"/>
		                    <input type="hidden" value="" id="sortBy" name="sortBy"/>
		                    <input type="hidden" value="" id="type" name="type"/>
		                </form>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	<!-- End Manager Account-->
	
	<!--Modal Form-->
	<!-- Add Account Form -->
	<div class="modal fade" id="addForm">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	            <form id="myForm">
	                <div class="modal-header bg-dark text-white">
	                    <h4 class="modal-title">New Account</h4>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body bg-dark text-white">
	                    <div class="row g-3">
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="id"><i class="bi bi-check"></i> ID:</label>
	                                <input type="text" class="form-control" id="id" required readonly>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="fullName"><i class="bi bi-person-circle"></i> Full Name:</label>
	                                <input type="text" name="fullName" id="fullName" class="form-control" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="userName"><i class="bi bi-person-circle"></i> User Name:</label>
	                                <input type="text" name="userName" id="userName" class="form-control" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="password"><i class="bi bi-key"></i> Password:</label>
	                                <input type="password" name="password" id="password" class="form-control" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="roleId"><i class="bi bi-tags"></i> RoleID:</label>
	                                <select name="roleId" id="roleId" class="form-select" aria-label="Default select example">
	                                    <c:forEach items="${listRole}" var="object">
	                                        <option value="${object.id}">${object.name}</option>
	                                    </c:forEach>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer bg-dark">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                    <button type="submit" class="btn btn-primary submit" id="btnAddAccount">Add</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>

	
	<script>
	var totalPages = ${account.totalPage};
	var currentPage = ${account.page};
	var limit = 10;
	$(function () {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: totalPages,
			visiblePages: 10,
			startPage: currentPage,
			onPageClick: function (event, page) {
				if (currentPage != page) {
					$('#maxPageItem').val(limit);
					$('#page').val(page);
					$('#sortName').val('id');
					$('#sortBy').val('desc');
					$('#type').val('list');
					$('#formSubmit').submit();
				}
			}
		});
	});
	
	$('#btnAddAccount').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        addAccount(data);  
    });
	
	function addAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${AccountURL}?id="+result.id+"&type=edit&message=add_success";
            },
            error: function (error) {
            	window.location.href = "${AccountURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=add_failed";
            }
        });
    }
    
	// Dam bao JQuery da san sang
	$(document).ready(function () {
	    // Them su kien click vao cac nut xoa
	    $('#dataAccount').on('click', '.delete', function () {
	        // Lay ID account tu hang tuong ung
	        var accountId = $(this).closest('tr').find('td:first').text().trim();
	        // Tao doi tuong data de gui trong yeu cau delete
	        var data = { id: accountId };
	        // Xac nhan xoa
	        Swal.fire({
	            title: "Are you sure?",
	            text: "You won't be able to revert this!",
	            icon: "warning",
	            background: '#1A1D21',
	            color: '#DEE2E6',
	            showCancelButton: true,
	            confirmButtonColor: "#3085d6",
	            cancelButtonColor: "#d33",
	            confirmButtonText: "Yes, delete it!"
	        }).then(function(result) {
	            // Kiem tra neu nguoi dung bam nut "Yes"
	            if (result.isConfirmed) {
	                deleteAccount(data);
	            }
	        });
	    });
	});

    
	function deleteAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "${AccountURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${AccountURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_failed";
            }
        });
    }
	</script>
	
	
</body>
</html>