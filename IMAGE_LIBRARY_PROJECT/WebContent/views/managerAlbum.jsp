<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-album"/>
<c:url var ="AlbumURL" value="/user-manager-album"/>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<title>Manager Album</title>
</head>
<body>
	<!-- Manager Album-->
	<div class="bg-background py-setup">
	    <section class="bg-dark p-4 rounded container">
	        <div class="row mb-3">
	            <div class="col">
	                <button class="btn btn-primary" data-bs-toggle="modal" data-toggle="tooltip" title='Create Album' data-bs-target="#createForm">
	                    <i class="bi bi-journal-album"></i> New Album
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
	                                <th>Description</th>
	                                <th>Cover Image Id</th>
	                                <th>Privacy Status</th>
	                                <th>AccountID</th>
	                                <th>Actions</th>
	                            </tr>
	                        </thead>
	                        <tbody id="dataAlbum">
	                            <c:forEach items="${album.listResult }" var="object">
	                                <tr>
	                                    <td>${object.id }</td>
	                                    <td>${object.name }</td>
	                                    <td>${object.description }</td>
	                                    <td>${object.coverImageId }</td>
	                                    <td>${object.privacyStatus }</td>
	                                    <td>${object.accountId }</td>
	                                    <td><a href='<c:url value="/user-manager-album?id=${object.id}&type=edit"/>' class="edit" data-toggle="tooltip" title='Edit Album'> <i class="bi bi-pencil-square"></i></a> 
										 	<a type="button" id="btnDeleteAlbum" class="delete" data-toggle="tooltip" title='Delete Album'><i class="bi bi-trash"></i></a>
											<input type="hidden" value="" id="id" name="id"/>	
										</td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
		                <form id="formSubmit" action="<c:url value='/user-manager-album'/>">
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
	<!-- End Manager Album-->

	<!--Modal Form-->
	<!-- Create Album Form -->
	<div class="modal fade" id="createForm">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	            <form id="myCreateForm">
	                <div class="modal-header bg-dark text-white">
	                    <h4 class="modal-title">New Album</h4>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body bg-dark text-white">
	                    <div class="row g-3">
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="id"><i class="bi bi-check"></i> ID:</label>
	                                <input type="text" name="id" id="id" class="form-control" required readonly>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="name"><i class="bi bi-journal-album"></i> Name:</label>
	                                <input type="text" name="name" id="name" class="form-control" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="description"><i class="bi bi-card-text"></i> Description:</label>
	                                <input type="text" name="description" id="description" class="form-control" required readonly>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="coverImageId"><i class="bi bi-link"></i> Cover Image Id:</label>
	                                <input type="text" name="coverImageId" id="coverImageId" class="form-control" value="1" required readonly>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="privacyStatus"><i class="bi bi-shield-lock"></i> Privacy Status:</label>
	                                <select name="privacyStatus" id="privacyStatus" class="form-select" aria-label="Default select example" required>                                    
	                                	<option value="public">Public</option> 
	                                	<option value="private">Private</option>
	                                	<option value="shared">Shared</option>          
	                                </select>
	                            </div>
	                        </div>	                        
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="accountId"><i class="bi bi-person-vcard"></i> AccountID:</label>
	                                <input type="text" name="accountId" id="accountId" class="form-control" value="${sessionScope.ACCOUNTMODEL.id }" required readonly>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer bg-dark">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                    <button type="submit" class="btn btn-primary submit" id="btnCreateAlbum">Create</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>

	
	<script>
	var totalPages = ${album.totalPage};
	var currentPage = ${album.page};
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
	
	$('#btnCreateAlbum').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myCreateForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        addImage(data);  
    });
	
    function addImage(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${AlbumURL}?id="+result.id+"&type=edit&message=create_success";
            },
            error: function (error) {
            	window.location.href = "${AlbumURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=create_failed";
            }
        });
    }
    
  	
    $(document).ready(function () {   
        $('#dataAlbum').on('click', '.delete', function () {
            var albumId = $(this).closest('tr').find('td:first').text().trim();        
            var data = { id: albumId };              
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
	            if (result.isConfirmed) {
	            	deleteAlbum(data);
	            }
	        });
	    });
	});
    
	function deleteAlbum(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "${AlbumURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${AlbumURL}?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list&message=delete_failed";
            }
        });
    }
	</script>
</body>
</html>