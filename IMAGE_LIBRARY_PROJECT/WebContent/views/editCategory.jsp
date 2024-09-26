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
	<!-- Edit Category-->
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
                                        <input type="text" name="id" id="id" class="form-control" value="${category.id}" required readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name"><i class="bi bi-person-circle"></i> Name:</label> 
                                        <input type="text" name="name" id="name" class="form-control" value="${category.name}" required>
                                    </div>
                                </div>
                            </div>                           
                        </div>
                        <div class="modal-footer bg-dark">
                            <a type="button" class="btn btn-secondary" href='<c:url value="/user-manager-category?page=1&maxPageItem=10&sortName=id&sortBy=desc&type=list"/>'>Close</a>
                            <button class="btn btn-primary" type="submit" id="btnUpdateCategory">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <!-- End Edit Category-->
	
	<script>	
    $('#btnUpdateCategory').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        updateCategory(data);  
    });
	
    function updateCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${CategoryURL}?id="+result.id+"&type=edit&message=edit_success";
            },
            error: function (error) {
            	window.location.href = "${CategoryURL}?page=1&maxPageItem=10&&sortName=id&sortBy=desc&type=list&message=edit_failed";
            }
        });
    }
	</script>
</body>
</html>