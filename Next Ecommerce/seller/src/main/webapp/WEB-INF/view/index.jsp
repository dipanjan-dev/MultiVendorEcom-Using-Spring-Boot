<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Start selling on Universe today.</title>
  <%@include file="links.jsp" %>
</head>

<body>
  <%@include file="header.jsp" %>
  <div class="hero">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-8">
        <h3>Start selling on Universe today.</h3>
        <p>The Seller Central dashboard serves as the central hub for sellers to manage their sales, inventory, and overall business operations on the Universe platform. Whether you're an established seller or just starting out, this dashboard provides essential tools and features to streamline your e-commerce journey.</p>
        <div class="d-grid gap-2 col-4">
          <a class="btn btn-dark fw-medium p-3 d-flex align-items-center justify-content-between" href="/register-seller"">Register As a seller 

            <svg width="20" height="20" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="m14 5 7 7m0 0-7 7m7-7H3"></path>
             </svg>
          </a>
          <span>*T&C applied</span>
        </div>
      </div>
      <div class="col-lg-4">
        <img src="https://res.cloudinary.com/dcbbqwxzr/image/upload/v1692972959/magicpattern-grid-pattern-1692972950052_arccp3.png" height="550px" class="mr-5">
      </div>
    </div>
  </div>
</div>
<div class="cars">
  <div class="container">
    <h3>Become a Seller on Universe</h3>
    <div class="row justify-content-between">
      <div class="col-lg-4">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <h5 class="card-title">Register as a seller</h5>
            <p class="card-text">Create your personalized seller profile and bring your universe to life. Share your story, passions, and the magic behind your offerings.</p>
            <a href="/register-seller"">Create a Seller account</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <h5 class="card-title">Complete your profile</h5>
            <p class="card-text"> Completing your profile is a crucial step in establishing your presence on our platform and making a lasting impression.</p>
            <a href="/login">Know more about Seller Dashboard</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="card" style="width: 100%;">
          <div class="card-body">
            <h5 class="card-title">Ready to launch</h5>
            <p class="card-text">Exciting times lie ahead as you prepare to launch! Here's a checklist to ensure you're fully prepared for a successful launch</p>
          </div>
        </div>
      </div>
    </div>
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

      </script>
      
</body>

</html>