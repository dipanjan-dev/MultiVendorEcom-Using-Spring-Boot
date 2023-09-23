<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start selling on Universe today.</title>
    <%@include file="links.jsp" %>
</head>

<body class="register-body">
    <%@include file="header.jsp" %>
        <div class="container">
            <c:if test="${not empty failedLogin}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error : </strong> ${failedLogin}

                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>      
            <c:if test="${not empty usernotFound}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error : </strong> ${usernotFound}

                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <div class="row justify-content-center align-items-center">
           
                <div class="col-lg-4 col-12">
                    <div class="register-card shadow-sm mt-5">
                        <form class="login" action="/verification-code" method="POST">
                            <h3 class="tab-header mb-4">Seller Verification</h3>
                            <p class="small text-muted">a verification code to ${SellerData}</p>
                            <p style="color: red;">${wrongOTP}</p>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Enter Verifcation Code
                                    <span>*</span></label>
                                <input type="text" class="form-control form-input" name="otp" required autocomplete="off" autofocus>
                                
                            </div>
                            <div class="d-grid gap-2 col-8 mx-auto mb-5">
                                <button class="btn btn-dark p-2" type="submit">Continue</button>
                              </div>

                        </form>
                    </div>
                    <div class="text-center mt-5">
                    <a href="" class="text-decoration-none fw-medium text-muted" style="color: inherit;">Report an Issue</a>
                </div>
                </div>
            </div>

        </div>

        <%@include file="script.jsp" %>
   
</body>

</html>