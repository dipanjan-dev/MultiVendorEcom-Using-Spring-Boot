<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <c:if test="${not empty userData}">

    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
      <meta http-equiv="X-UA-Compatible" content="ie=edge" />
      <title>Universe</title>
      <style>
        /* Style for the loading animation container */
        #loading {
          display: none;
          /* Add styling as needed */
        }
      </style>
      <!-- CSS files -->
      <%@include file="links.jsp" %>
    </head>

    <body onload="loading()">
      <div class="preloader" id="preloader">
        <div class="spinner center">
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
          <div class="spinner-blade"></div>
        </div>
      </div>
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
                      add product
                    </div>
                    <h2 class="page-title">
                      Create a new product
                    </h2>
                  </div>
                </div>

              </div>
            </div>
            <!-- Page body -->
            <div class="page-body container">
              <div class="row justify-content-center">
                <div class="col-lg-10">

                  <div class="card bg-white">
                    <div class="card-body">
                      <form id="regForm" action="/seller/upload-product" method="POST" enctype="multipart/form-data">
                        <div class="tab">
                          <div class="tab-header">Item Details</div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="name" class="form-label">Select Category</label>
                                <select id="category" class="form-select" name="Catrgory"
                                  onchange="populateSubcategories()" autofocus>
                                  <option selected value="clothing"
                                    title="Find the latest fashion trends for men, women, and kids.">Clothing and
                                    Apparel</option>
                                  <option value="electronics"
                                    title="Discover a wide range of electronics, gadgets, and tech accessories.">
                                    Electronics</option>
                                  <option value="home-furniture"
                                    title="Furnish your home with stylish furniture and home decor items.">Home and
                                    Furniture</option>
                                  <option value="beauty"
                                    title="Explore beauty products, skincare essentials, and makeup brands.">Beauty and
                                    Personal Care</option>
                                  <option value="books-media"
                                    title="Browse books, ebooks, music, movies, and other forms of media.">Books and
                                    Media</option>
                                  <option value="sports-outdoors"
                                    title="Get active with sports equipment, outdoor gear, and fitness accessories.">
                                    Sports and Outdoors</option>
                                  <option value="toys-games"
                                    title="Discover a world of toys, games, and entertainment for all ages.">Toys and
                                    Games</option>
                                  <option value="health-wellness"
                                    title="Prioritize your health with wellness products, vitamins, and fitness gear.">
                                    Health and Wellness</option>
                                  <option value="grocery-food"
                                    title="Shop for groceries, fresh produce, packaged foods, and pantry essentials.">
                                    Grocery and Food</option>
                                  <option value="jewelry-accessories"
                                    title="Accessorize with a variety of jewelry pieces and stylish accessories.">
                                    Jewelry and Accessories</option>
                                  <option value="automotive"
                                    title="Find automotive parts, accessories, and maintenance items for your vehicle.">
                                    Automotive</option>
                                  <option value="pet-supplies"
                                    title="Shop for pet food, toys, grooming products, and supplies for your furry friends.">
                                    Pet Supplies</option>
                                  <option value="office-supplies"
                                    title="Stock up on office supplies and stationery for your workspace.">Office
                                    Supplies</option>
                                  <option value="home-improvement"
                                    title="Enhance your home with tools, building materials, and DIY supplies.">Home
                                    Improvement</option>
                                  <option value="gifts-occasions"
                                    title="Discover thoughtful gifts for special occasions and celebrations.">Gifts and
                                    Occasions</option>
                                  <option value="crafts-hobbies"
                                    title="Get creative with craft supplies and materials for various hobbies.">Crafts
                                    and Hobbies</option>
                                  <option value="baby-maternity"
                                    title="Find baby essentials, maternity products, and items for new parents.">Baby
                                    and Maternity</option>
                                  <option value="travel-luggage"
                                    title="Prepare for travel with luggage, accessories, and travel-sized products.">
                                    Travel and Luggage</option>
                                  <option value="electrical-appliances"
                                    title="Shop for larger electrical appliances like refrigerators, washing machines, and ovens.">
                                    Electrical Appliances</option>
                                  <option value="vintage-antiques"
                                    title="Explore unique vintage and antique items with historical value.">Vintage and
                                    Antiques</option>
                                </select>
                              </div>
                            </div>
                            <div class="col">
                              <div class="mb-3">
                                <label for="name" class="form-label">Select Sub-Category</label>
                                <select id="subcategory" class="form-select" name="SubCatrgory">

                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="name" class="form-label">Item Name</label>
                                <input type="text" class="form-control" id="productName" name="ItemName">
                              </div>
                            </div>

                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="name" class="form-label">Brand Name</label>
                                <input type="text" class="form-control" id="productBrand" name="BrandName"
                                  autocomplete="off">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="tab">
                          <div class="tab-header">Item Images</div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Choose Your Main Image</label>
                                <input class="form-control" type="file" id="imageInput1" onchange="displayImage1(event)"
                                  name="MainImage" accept="image/png, image/jpeg,image/jpg">
                              </div>
                              <div id="imageContainer1">
                              </div>
                            </div>
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Choose Your 2<sup>nd</sup> Image</label>
                                <input class="form-control" type="file" id="imageInput2" onchange="displayImage2(event)"
                                  name="SecondImage" accept="image/png, image/jpeg,image/jpg">
                              </div>
                              <div id="imageContainer2">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Choose Your 3<sup>rd</sup> Image</label>
                                <input class="form-control" type="file" id="imageInput3" onchange="displayImage3(event)"
                                  name="ThirdImage" accept="image/png, image/jpeg,image/jpg">
                              </div>
                              <div id="imageContainer3">
                              </div>
                            </div>
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Choose Your 4<sup>th</sup> Image</label>
                                <input class="form-control" type="file" id="imageInput4" onchange="displayImage4(event)"
                                  name="FourthImage" accept="image/png, image/jpeg,image/jpg">
                              </div>
                              <div id="imageContainer4">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="tab">
                          <div class="tab-header">Item Desciption</div>
                          <div class="mb-3">
                            <label for="formFile" class="form-label">Write your desciption in short</label>
                            <textarea name="ShortDescription" id="" class="form-control" rows="2"></textarea>
                          </div>
                          <div class="mb-3">
                            <label for="formFile" class="form-label">Write your full desciption</label>
                            <textarea name="FullDescription" id="" class="form-control" rows="6"></textarea>
                          </div>
                        </div>
                        <div class="tab">
                          <div class="tab-header">Genral Information about Item</div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Maximum retail price</label>
                                <input type="text" class="form-control" id="productId" autocomplete="off" name="Mrp">
                              </div>
                            </div>
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Basic Discount Price</label>
                                <input type="text" class="form-control" id="productId" autocomplete="off" name="Bdp">
                              </div>
                            </div>
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Maximum Discount Price</label>
                                <input type="text" class="form-control" id="productId" autocomplete="off" name="Mdp">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-4">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Available Quantity</label>
                                <input type="text" class="form-control" id="productId" autocomplete="off" name="Stock">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Keywords (Please Separate all Keywords using ,
                                  )</label>
                                <textarea type="text" class="form-control" id="productId" name="keywords"
                                  rows="3"></textarea>
                              </div>
                            </div>
                          </div>

                        </div>
                        <div style="overflow:auto;" class="mt-5">
                          <div style="float:right;">
                            <button type="button" class="btn btn-secondary" id="prevBtn"
                              onclick="nextPrev(-1)">Previous</button>
                            <button type="button" class="btn btn-dark" id="nextBtn" onclick="nextPrev(1)">Next</button>
                            <button type="submit" id="submitBtn" class="btn btn-success">Add Product</button>
                          </div>
                        </div>
                    </div>




                    <!-- Circles which indicates the steps of the form: -->
                    <div style="text-align:center;margin-top:40px;display: none;">
                      <span class="step">
                        Add
                      </span>
                      <span class="step"></span>
                      <span class="step"></span>
                      <span class="step"></span>
                    </div>

                    </form>

                    <div id="loading" style="display: none;">
                      <!-- Add your loading animation (e.g., spinner, GIF, etc.) here -->
                      Loading...
                    </div>

                    <div class="row">
                      <div class="col">

                      </div>
                    </div>

                  </div>

                </div>
              </div>
            </div>
        </div>
      </div>
      </div>
      <%@include file="script.jsp" %>

        <script>
          function populateSubcategories() {
            var categorySelect = document.getElementById("category");
            var subcategorySelect = document.getElementById("subcategory");

            // Clear existing options
            subcategorySelect.innerHTML = "";

            // Subcategories mapping
            var subcategories = {
              "clothing": [
                "Men's Clothing",
                "Women's Clothing",
                "Kids' Clothing",
                "Shoes and Footwear",
                "Accessories",
                "Activewear",
                "Lingerie and Sleepwear",
                "Swimwear"
              ],
              "electronics": [
                "Gadgets and Gizmos",
                "Mobile Phones and Accessories",
                "Computers and Laptops",
                "Audio and Headphones",
                "Cameras and Photography",
                "Wearable Technology",
                "Gaming Consoles and Accessories"
              ],
              "home-furniture": [
                "Furniture",
                "Home Decor",
                "Kitchen and Dining",
                "Bedding and Linens",
                "Home Appliances",
                "Lighting",
                "Storage and Organization"
              ],
              "beauty": [
                "Skincare",
                "Makeup",
                "Haircare",
                "Fragrances",
                "Bath and Body",
                "Personal Grooming",
                "Tools and Accessories"
              ],
              "books-media": [
                "Books",
                "Ebooks",
                "Music",
                "Movies",
                "TV Shows",
                "Magazines",
                "Audiobooks"
              ],
              "sports-outdoors": [
                "Sports Equipment",
                "Outdoor Gear",
                "Fitness Accessories",
                "Camping and Hiking",
                "Cycling",
                "Water Sports",
                "Hunting and Fishing"
              ],
              "toys-games": [
                "Action Figures",
                "Board Games",
                "Puzzles",
                "Dolls and Accessories",
                "Remote Control Toys",
                "Educational Toys",
                "Video Games"
              ],
              "health-wellness": [
                "Vitamins and Supplements",
                "Fitness Equipment",
                "Yoga and Meditation",
                "Personal Care",
                "Health Monitors",
                "Natural Remedies"
              ],
              "grocery-food": [
                "Fresh Produce",
                "Packaged Foods",
                "Snacks and Beverages",
                "Pantry Essentials",
                "Baking Supplies",
                "Organic and Specialty Foods"
              ],
              "jewelry-accessories": [
                "Necklaces and Pendants",
                "Earrings",
                "Bracelets and Bangles",
                "Rings",
                "Watches",
                "Bags and Purses",
                "Hats and Caps"
              ],
              "automotive": [
                "Automotive Parts",
                "Accessories",
                "Maintenance Items"
              ],
              "pet-supplies": [
                "Pet Food",
                "Toys",
                "Grooming Products",
                "Supplies"
              ],
              "office-supplies": [
                "Stationery",
                "Organization",
                "Writing Supplies",
                "Desk Accessories"
              ],
              "home-improvement": [
                "Tools",
                "Building Materials",
                "DIY Supplies",
                "Home Renovation"
              ],
              "gifts-occasions": [
                "Gift Ideas",
                "Special Occasions",
                "Celebrations"
              ],
              "crafts-hobbies": [
                "Craft Supplies",
                "Materials",
                "Hobbies"
              ],
              "baby-maternity": [
                "Baby Essentials",
                "Maternity Products",
                "Parenting Items"
              ],
              "travel-luggage": [
                "Luggage",
                "Travel Accessories",
                "Travel-Sized Products"
              ],
              "electrical-appliances": [
                "Refrigerators",
                "Washing Machines",
                "Ovens",
                "Appliances"
              ],
              "vintage-antiques": [
                "Vintage Items",
                "Antique Items"
              ]
            };


            var selectedCategory = categorySelect.value;
            var subcategoryOptions = subcategories[selectedCategory];

            // Populate subcategory options
            for (var i = 0; i < subcategoryOptions.length; i++) {
              var option = document.createElement("option");
              option.value = subcategoryOptions[i];
              option.text = subcategoryOptions[i];
              subcategorySelect.appendChild(option);
            }
          }
          function displayImage1(event) {
            const imageContainer = document.getElementById('imageContainer1');
            const imageInput1 = event.target;

            if (imageInput1.files && imageInput1.files[0]) {
              const reader = new FileReader();

              reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '100%'; // You can adjust the image size
                img.style.maxHeight = '200px'; // You can adjust the image size
                imageContainer.innerHTML = '';
                imageContainer.appendChild(img);
              };

              reader.readAsDataURL(imageInput1.files[0]);
            }
          }
          function displayImage2(event) {
            const imageContainer = document.getElementById('imageContainer2');
            const imageInput2 = event.target;

            if (imageInput2.files && imageInput2.files[0]) {
              const reader = new FileReader();

              reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '100%'; // You can adjust the image size
                img.style.maxHeight = '200px'; // You can adjust the image size // You can adjust the image size
                imageContainer.innerHTML = '';
                imageContainer.appendChild(img);
              };

              reader.readAsDataURL(imageInput2.files[0]);
            }
          }
          function displayImage3(event) {
            const imageContainer = document.getElementById('imageContainer3');
            const imageInput3 = event.target;

            if (imageInput3.files && imageInput3.files[0]) {
              const reader = new FileReader();

              reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '100%'; // You can adjust the image size
                img.style.maxHeight = '200px'; // You can adjust the image size // You can adjust the image size
                imageContainer.innerHTML = '';
                imageContainer.appendChild(img);
              };

              reader.readAsDataURL(imageInput3.files[0]);
            }
          }
          function displayImage4(event) {
            const imageContainer = document.getElementById('imageContainer4');
            const imageInput4 = event.target;

            if (imageInput4.files && imageInput4.files[0]) {
              const reader = new FileReader();

              reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '100%'; // You can adjust the image size
                img.style.maxHeight = '200px'; // You can adjust the image size // You can adjust the image size
                imageContainer.innerHTML = '';
                imageContainer.appendChild(img);
              };

              reader.readAsDataURL(imageInput4.files[0]);
            }
          }
        </script>
        <script>
          document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("regForm");
            const loading = document.getElementById("loading");

            form.addEventListener("submit", function (e) {
              e.preventDefault(); // Prevent the default form submission

              // Show the loading animation
              loading.style.display = "block";
              form.style.display="none";

              // Serialize the form data (or use FormData if needed)
              const formData = new FormData(form);

              fetch('/seller/upload-product', {
                method: 'POST',
                body: formData
              })
                .then(response => {
                  if (response.ok) {
                    window.location.href = '/seller/view-product';
                  }
                  form.style.display="block";
                  loading.style.display = "none";
                })
                .catch(error => {
                  form.style.display="block";
                  loading.style.display = "none";
                });
            });
          });

        </script>

    </body>

    </html>
  </c:if>
  <c:if test="${empty userData}">
    <c:redirect url="/login" />
  </c:if>