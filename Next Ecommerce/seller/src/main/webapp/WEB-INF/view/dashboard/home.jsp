<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty userData}">

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Welcome ${userData.getFirstName()} - ${userData.getSellerid()}</title>
    <!-- CSS files -->
    <%@include file="links.jsp" %>
  </head>
  <body >
    <div class="page">

      <div class="page-wrapper">
        <!-- Page header -->
        <%@include file="navbar.jsp" %>
        <div class="page-header d-print-none">
          <div class="container-xl">
            <div class="row g-2 align-items-center">
              <div class="col">
                <!-- Page pre-title -->
                <div class="page-pretitle">
                  Overview
                </div>
                <h2 class="page-title">
                  Seller Dashboard
                </h2>
              </div>
            </div>
           
          </div>
        </div>
        <!-- Page body -->
        <div class="page-body">

        </div>
      </div>
    </div>
    <%@include file="script.jsp" %>
  
  </body>
</html>
</c:if>
<c:if test="${empty userData}">
    <c:redirect url="/login"/>
</c:if>