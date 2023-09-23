<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    Cookie[] cookies = request.getCookies();
    String sellerEmail = null;
    
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("SellerData")) {
                sellerEmail = cookie.getValue();
                break;
            }
        }
    }
%>

    ${userData.getEmail()}
    
</body>
</html>