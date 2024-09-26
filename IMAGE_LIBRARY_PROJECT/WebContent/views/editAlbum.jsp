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
	<!-- Edit Album-->
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
                                        <input type="text" name="id" id="id" class="form-control" value="${album.id}" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name"><i class="bi bi-journal-album"></i> Name:</label> 
                                        <input type="text" name="name" id="name" class="form-control" value="${album.name}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="description"><i class="bi bi-card-text"></i> Description:</label> 
                                        <input type="text" name="description" id="description" class="form-control" value="${album.description}" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="coverImageId"><i class="bi bi-link"></i> Cover Image Id:</label> 
                                        <input type="text" name="coverImageId" id="coverImageId" class="form-control" value="${album.coverImageId}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="privacyStatus"><i class="bi bi-shield-lock"></i> Privacy Status:</label>
                                        <select name="privacyStatus" id="privacyStatus" class="form-select">                                           
                                            <option ${"public" == album.privacyStatus ? 'selected' : '' } value="public">public</option>
                                            <option ${"private" == album.privacyStatus ? 'selected' : '' } value="private">private</option>     
                                            <option ${"shared" == album.privacyStatus ? 'selected' : '' } value="shared">shared</option>                                                 
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="accountId"><i class="bi bi-person-vcard"></i> AccountID:</label> 
                                        <input type="text" name="accountId" id="accountId" class="form-control" value="${album.accountId}" required readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-dark">
                            <a type="button" class="btn btn-secondary" href='<c:url value="/user-manager-album?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Close</a>
                            <button class="btn btn-primary" type="submit" id="btnUpdateAlbum">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <!-- End Edit Album-->
	
	<script>	
    $('#btnUpdateAlbum').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        updateAlbum(data);  
    });
	
    function updateAlbum(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${AlbumURL}?id="+result.id+"&type=edit&message=edit_success";
            },
            error: function (error) {
            	window.location.href = "${AlbumURL}?page=1&maxPageItem=10&&sortName=id&sortBy=desc&type=list&message=edit_failed";
            }
        });
    }
	</script>
</body>
</html>