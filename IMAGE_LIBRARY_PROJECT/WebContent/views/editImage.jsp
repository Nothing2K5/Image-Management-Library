<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-image"/>
<c:url var ="ImageURL" value="/user-manager-image"/>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<title>Manager Image</title>
</head>
<body>
	<!-- Edit Image-->
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
                                        <input type="text" name="id" id="id" class="form-control" value="${image.id}" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name"><i class="bi bi-card-image"></i> Name:</label> 
                                        <input type="text" name="name" id="name" class="form-control" value="${image.name}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="image"><i class="bi bi-link"></i> Image:</label> 
                                        <input type="text" name="image" id="image" class="form-control" value="${image.image}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="description"><i class="bi bi-card-text"></i> Description:</label> 
                                        <input type="text" name="description" id="description" class="form-control" value="${image.description}" required readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cateId"><i class="bi bi-tags"></i> CateID:</label>
                                        <select name="cateId" id="cateId" class="form-select">
                                            <c:forEach items="${listCategory}" var="object">
                                                <option ${object.id == image.cateId ? 'selected' : '' } value="${object.id}">${object.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="accountId"><i class="bi bi-person-vcard"></i> AccountID:</label> 
                                        <input type="text" name="accountId" id="accountId" class="form-control" value="${image.accountId}" required readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-dark">
                            <a type="button" class="btn btn-secondary" href='<c:url value="/user-manager-image?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Close</a>
                            <button class="btn btn-primary" type="submit" id="btnUpdateImage">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <!-- End Edit Image-->
	
	<script>	
    $('#btnUpdateImage').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        updateImage(data);  
    });
	
    function updateImage(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${ImageURL}?id="+result.id+"&type=edit&message=edit_success";
            },
            error: function (error) {
            	window.location.href = "${ImageURL}?page=1&maxPageItem=10&&sortName=id&sortBy=desc&type=list&message=edit_failed";
            }
        });
    }
	</script>
</body>
</html>