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

    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide sliders"
          style="background: url('https://res.cloudinary.com/dcbbqwxzr/image/upload/v1692549914/SAMSUNG_Z_FOLD_iwjk1b.png') ;">

        </div>
        <div class="swiper-slide sliders"
          style="background: url('https://res.cloudinary.com/dcbbqwxzr/image/upload/v1692550267/SAMSUNG_Z_FOLD_1_zb69si.png');">

        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

    <div class="container">
        <div class="row">
          <c:forEach items="${Allproducts}" var="product">
          <div class="col-lg-3">
            <a href="/product-view/${product.getItemName()}/${product.getProductId()}">
            <div class="card shopping-card">
              <img src="${product.getMainImage()}"
              
              class="card-img-top">

              <div class="card-body">
                
                <h5 class="card-title">${product.getItemName()}</h5>
                <p class="card-text">${product.getMrp()}</p>
              </div>
            </div>
          </a>
          </div>
        </c:forEach>
        </div>
    </div>
    <%@include file="script.jsp" %>
      <script>
        var swiper = new Swiper(".mySwiper", {
          loop: true,
          grabCursor: true,
          effect: "creative",
          creativeEffect: {
            prev: {
              shadow: true,
              translate: ["-20%", 0, -1],
            },
            next: {
              translate: ["100%", 0, 0],
            },
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });

        if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition(function(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // Using the Google Maps Geocoding API
    const geocoder = new google.maps.Geocoder();
    const latLng = new google.maps.LatLng(latitude, longitude);

    geocoder.geocode({ 'location': latLng }, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          const address = results[0].formatted_address;
          console.log("Address:", address);
        } else {
          console.error("No results found");
        }
      } else {
        console.error("Geocoder failed due to:", status);
      }
    });
  }, function(error) {
    console.error("Error getting location:", error.message);
  });
} else {
  console.error("Geolocation is not supported in this browser");
}

// AIzaSyAwBFmt4LN9HC8Ve9ytawhEm5l6WaWCj0g
      </script>
      
</body>

</html>