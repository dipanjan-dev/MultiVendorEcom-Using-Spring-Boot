<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Snaphunt - get your all product here</title>
  <%@include file="links.jsp" %>
</head>

<body class="bg-light">
  <%@include file="header.jsp" %>



    <div class="container">
        <div class="row">
            <img src="${productDetails.getMainImage()}" alt="">
            
            ${productDetails.getItemName()}
            ${productDetails.getCatrgory()}
        </div>
    </div>
    <%@include file="script.jsp" %>

</body>

</html>