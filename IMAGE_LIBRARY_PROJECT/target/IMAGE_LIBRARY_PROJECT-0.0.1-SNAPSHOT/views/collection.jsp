<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="API_image_url" value="/api-image"/>
<c:url var="API_album_url" value="/api-album"/>
<c:url var ="URL" value="/home"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>DRAGON WORLD - Bootstrap Template</title>
</head>
<body>
	<!-- Body -->
	<div class="bg-background py-4">
		<!-- Section-->
		<section>
			<div class="container px-4 px-lg-5 mt-5">
				<!-- Explore -->
				<div class="bg-dark py-4 pe-4 ps-4 mb-4 rounded">
                    <div class="d-flex align-items-center justify-content-between">
				        <h5 class="card-title mb-0 fw-semibold flex-grow-1">Explore Image</h5>
				        <c:if test="${not empty sessionScope.ACCOUNTMODEL }">
				        	<button class="btn btn-primary" data-bs-toggle="modal" data-toggle="tooltip" title='Create Album' data-bs-target="#createForm">
				            	<i class="bi bi-journal-album"></i> New Album
				        	</button>
				        	<button class="btn btn-primary" data-bs-toggle="modal" data-toggle="tooltip" title='Add Image' data-bs-target="#addForm">
				            	<i class="bi bi-card-image"></i> New Image
				        	</button>
				        </c:if>
				    </div>
					<div class="row row-cols-xxl-5 row-cols-lg-3 row-cols-md-2 row-cols-1 mt-3 g-3">
                		<div class="col">
			                <h6 class="text-uppercase">Category</h6>  
			                <div class="dropdown form-control">
			                	<label class="dropdown-toggle" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                		${tagCategory.id == null ? "Category" : tagCategory.name }
			                	</label>      
								<ul class="dropdown-menu dropdown-menu-dark form-control" aria-labelledby="dropdownMenuLink">
									<c:forEach items="${listCategory}" var="object">
										<li class="list-group-item">
											<c:url var="url" value="/explore">								
						                    	<c:param name="cateId" value="${object.id}"/>  
											</c:url>
											<a class="dropdown-item" href="${url}">${object.name}</a>
										</li>
									</c:forEach>
								</ul>
							</div>
                		</div>
                		<div class="col">
	                		<form action='<c:url value="explore"/>'>
	                			<h6 class="text-uppercase">Search</h6>
	                        	<input type="text" name="name" id="name" class="form-control" placeholder="Search Image" value="${tagSearch }">              
	                		</form> 	
                        </div>
                        <c:if test="${not empty sessionScope.ACCOUNTMODEL }">
					        <div class="col">
				                <h6 class="text-uppercase">My Album</h6>  
				                <div class="dropdown form-control">
				                	<label class="dropdown-toggle" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				                		${tagAlbum.id == null ? "Album" : tagAlbum.name }
				                	</label>      
									<ul class="dropdown-menu dropdown-menu-dark form-control" aria-labelledby="dropdownMenuLink">
										<c:forEach items="${listAlbum}" var="object">
											<li class="list-group-item">
												<c:url var="url" value="/explore">								
							                    	<c:param name="id" value="${object.id}"/>  
												</c:url>
												<a class="dropdown-item" href="${url}">${object.name}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
	                		</div>
				        </c:if>                  
                	</div>
				</div>
				<!-- End Explore -->
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach items="${listImage }" var="object">
						<div class="col mb-5">
							<a href='<c:url value="/view?id=${object.id }"/>'>
								<img class="card-img-top w-100 shadow-1-strong rounded" src="${object.image }" alt="..." />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>	
		<!-- End Section -->
	</div>
	<!-- End Body -->
	
	<!--Modal Form-->
	<!-- Add Image Form -->
	<div class="modal fade" id="addForm">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	            <form id="myForm">
	                <div class="modal-header bg-dark text-white">
	                    <h4 class="modal-title">New Image</h4>
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
	                                <label for="name"><i class="bi bi-card-image"></i> Name:</label>
	                                <input type="text" name="name" id="name" class="form-control" required>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="form-group">
	                                <label for="image"><i class="bi bi-link"></i> Image:</label>
	                                <input type="text" name="image" id="image" class="form-control" required>
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
	                                <label for="cateId"><i class="bi bi-tags"></i> CateID:</label>
	                                <select name="cateId" id="cateId" class="form-select" aria-label="Default select example" required>
	                                    <c:forEach items="${listCategory}" var="object">
	                                        <option value="${object.id}">${object.name}</option>
	                                    </c:forEach>
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
	                    <button type="submit" class="btn btn-primary submit" id="btnAddImage">Add</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
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
		$('#btnAddImage').click(function (e) {
	        e.preventDefault(); //Tranh submit nham url
	        var data = {};
	        var formData = $('#myForm').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	        addImage(data);  
	    });
		
	    function addImage(data) {
	        $.ajax({
	            url: '${API_image_url}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${URL}?id="+result.id+"&message=add_success";
	            },
	            error: function (error) {
	            	window.location.href = "${URL}?&message=add_failed";
	            }
	        });
	    }
	    
	    $('#btnCreateAlbum').click(function (e) {
	        e.preventDefault();
	        var data = {};
	        var formData = $('#myCreateForm').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	        createAlbum(data);  
	    });
		
	    function createAlbum(data) {
	        $.ajax({
	        	url: '${API_album_url}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${URL}?id="+result.id+"&message=add_success";
	            },
	            error: function (error) {
	            	window.location.href = "${URL}?&message=add_failed";
	            }
	        });
	    }
	</script>
</body>
</html>
