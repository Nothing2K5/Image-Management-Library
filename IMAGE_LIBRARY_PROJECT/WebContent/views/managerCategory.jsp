<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-category"/>
<c:url var ="CategoryURL" value="/user-manager-category"/>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<title>Manager Category</title>
</head>
<body>
	<!-- Manager Category-->
	<div class="bg-background py-setup">
	    <section class="bg-dark p-4 rounded container">
	        <div class="row mb-3">
	            <div class="col">
	                <button class="btn btn-primary" data-bs-toggle="modal" data-toggle="tooltip" title='Add Category' data-bs-target="#addForm">
	                   <i class="bi bi-tag"></i> New Category
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
	                                <th>Name</th>	                             
	                                <th>Actions</th>
	                            </tr>
	                        </thead>
	                        <tbody id="dataCategory">
	                            <c:forEach items="${category.listResult }" var="object">
	                                <tr>
	                                    <td>${object.id }</td>
	                                    <td>${object.name }</td>	                                 
	                                    <td><a href='<c:url value="/user-manager-category?id=${object.id}&type=edit"/>' class="edit" data-toggle="tooltip" title='Edit Category'> <i class="bi bi-pencil-square"></i></a> 
										 	<a type="button" id="btnDeleteCategory" class="delete" data-toggle="tooltip" title='Delete Category'><i class="bi bi-trash"></i></a>
											<input type="hidden" value="" id="id" name="id"/>	
										</td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
		                <form id="formSubmit" action="<c:url value='/user-manager-category'/>">
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
	<!-- End Manager Category-->

	<!--Modal Form-->
	<!-- Add Category Form -->
	<div class="modal fade" id="addForm">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	            <form id="myForm">
	                <div class="modal-header bg-dark text-white">
	                    <h4 class="modal-title">New Category</h4>
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
	                                <label for="name"><i class="bi bi-person-circle"></i> Name:</label>
	                                <input type="text" name="name" id="name" class="form-control" required>
	                            </div>
	                        </div>	                      	                    
	                    </div>
	                </div>
	                <div class="modal-footer bg-dark">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                    <button type="submit" class="btn btn-primary submit" id="btnAddCategory">Add</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>

	
	<script>
	var totalPages = ${category.totalPage};
	var currentPage = ${category.page};
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
	
	$('#btnAddCategory').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        addCategory(data);  
    });
	
    function addCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${CategoryURL}?id="+result.id+"&type=edit&message=add_success";
            },
            error: function (error) {
            	window.location.href = "${CategoryURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=add_failed";
            }
        });
    }
    
  	//Dam bao JQuery da san sang
    $(document).ready(function () {
        // Them su kien click vao cac nut xoa
        $('#dataCategory').on('click', '.delete', function () {
        	//Lay ID hinh anh tu hang tuong ung
            var categoryId = $(this).closest('tr').find('td:first').text().trim();
            // Tao doi tuong data de gui trong yeu cau delete
            var data = { id: categoryId };  
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
	            	deleteCategory(data);
	            }
	        });
	    });
	});
    
	function deleteCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "${CategoryURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${CategoryURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_failed";
            }
        });
    }
	</script>	
</body>
</html>