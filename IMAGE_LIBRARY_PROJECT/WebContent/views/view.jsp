<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-image"/>
<c:url var ="URL" value="/home"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- Product section-->
	<section class="bg-background py-4">
		<form id="myForm">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-setting mb-5 mb-md-0" src="${image.image }" alt="..." />
						<input type="hidden" value="${image.image }" name="image" id="image">
					</div>
					<div class="col-md-6">
						<div class="mb-1">Image ID: ${image.id }</div>
						<input type="hidden" value="${image.id}" name="id" id="id" required>
						<h1 class="display-5 fw-bolder">${image.name }</h1>
						<input type="hidden" value="${image.name}" name="name" id="name" required>
						<c:forEach items="${listCategory}" var="object">
							<div class="fs-5">
								<c:if test="${object.id == image.cateId}">
									<span>Category: ${object.name}</span>
								</c:if>
							</div>
						</c:forEach>
						<p class="lead">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
						consequatur obcaecati excepturi alias magni, accusamus eius
						blanditiis delectus ipsam minima ea iste laborum vero?</p>
						<div class="d-flex">
							<button class="btn btn-outline-light flex-shrink-0" id="download" type="submit">Download</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	
	<script>
	$('#download').click(function (e) {
        e.preventDefault(); //Tranh submit nham url
        var data = {};
        var formData = $('#myForm').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        download(data);  
    });
	
    function download(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	if (result) {
                    window.location.href = "${URL}?id="+result+"&message=download_success";
                } else {
                    window.location.href = "${URL}?message=download_failed";
                }
            },
            error: function (error) {
            	window.location.href = "${URL}?message=download_failed";
            }
        });
    }
	</script>
</body>
</html>
