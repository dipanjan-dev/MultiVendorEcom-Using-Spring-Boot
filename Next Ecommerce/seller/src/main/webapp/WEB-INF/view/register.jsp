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

                <c:if test="${not empty errorPassword}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error : </strong> ${errorPassword}

                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty  EmailHave}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error : </strong> ${EmailHave}

                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty  ContactHave}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error : </strong> ${ContactHave}

                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>        
                <c:if test="${not empty  PasswordLength}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error : </strong> ${PasswordLength}

                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>


                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-6 col-12">

                        <div class="register-card">
                            <form id="regForm" action="/seller-info-save" method="POST" modelAttribute="SellerUser">
                                <!-- One "tab" for each step in the form: -->
                                <div class="tab">
                                    <h3 class="tab-header">Personal Information</h3>
                                    <div class="mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="exampleInputEmail1" class="form-label">First Name
                                                    <span>*</span></label>
                                                <input type="text" class="form-control form-input" name="FirstName" required>
                                            </div>
                                            <div class="col">
                                                <label for="exampleInputEmail1" class="form-label">Last Name
                                                    <span>*</span></label>
                                                <input type="text" class="form-control form-input" name="LastName" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address
                                            <span>*</span></label>
                                        <input type="email" class="form-control form-input" name="Email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Contact Number
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" name="Contact" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlTextarea1" class="form-label">Address
                                            <span>*</span></label>
                                        <textarea class="form-control form-input" id="exampleFormControlTextarea1"
                                            rows="3" name="Address" required></textarea>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col">
                                            <label for="exampleInputEmail1" class="form-label">Country
                                                <span>*</span></label>
                                            <select id="countries" class="form-select form-input"
                                                onchange="populateStates()" name="Country" required>
                                                <option value="USA">United States</option>
                                                <option value="Canada">Canada</option>
                                                <option value="Australia">Australia</option>
                                                <option value="India" selected>India</option>
                                                <!-- Add more countries here -->
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="exampleInputEmail1" class="form-label">State
                                                <span>*</span></label>
                                            <select id="states" class="form-select form-input" name="State" required>
                                                <!-- Populated dynamically using JavaScript -->
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab">
                                    <h3 class="tab-header">Business Information</h3>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Business Name
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" name="BusinessName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Business Category
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" name="BusinessCategory" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">GST Number
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" name="GST" required>
                                    </div>
                                </div>
                                <div class="tab">
                                    <h3 class="tab-header">Personal verification </h3>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Aadhaar Card Number
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" maxlength="12" minlength="12"
                                            name="AddhaarCard" required>
                                        <div class="form-text">Don't worry we do not share your any kind of Information
                                            with
                                            others</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">PAN Card Number
                                            <span>*</span></label>
                                        <input type="text" class="form-control form-input" maxlength="10" minlength="10"
                                            name="PanCard" required>
                                        <div class="form-text">Don't worry we do not share your any kind of Information
                                            with
                                            others</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Date of Birth
                                            <span>*</span></label>
                                        <input type="date" class="form-control form-input" name="dateofbirth" required>
                                    </div>
                                </div>
                                <div class="tab">
                                    <h3 class="tab-header">Our terms and conditions</h3>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input form-input" id="exampleCheck1" required>
                                        <label class="form-check-label" for="exampleCheck1">
                                            <strong>Seller Account Terms: </strong> Outline the process for setting up
                                            and
                                            managing a seller account on your platform. This could include registration
                                            requirements, product listing guidelines, and account suspension or
                                            termination
                                            procedures.
                                            <span>*</span></label>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input form-input" id="exampleCheck2" required>
                                        <label class="form-check-label" for="exampleCheck2">
                                            <strong>Order Fulfillment : </strong> Detail how orders placed by buyers
                                            will be
                                            transmitted to sellers, how shipping and delivery will be handled, and any
                                            required timelines.
                                            <span>*</span></label>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input form-input" id="exampleCheck3" required>
                                        <label class="form-check-label" for="exampleCheck3">
                                            <strong>Intellectual Property and Content Usage: </strong> Address any
                                            rights
                                            and licenses related to the content that sellers provide, such as product
                                            images, descriptions, and branding.
                                            <span>*</span></label>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input form-input" id="exampleCheck4" required>
                                        <label class="form-check-label" for="exampleCheck4">
                                            <strong>Account Termination or Suspension: </strong> Describe the
                                            circumstances
                                            under which a seller's account might be suspended or terminated, and the
                                            process
                                            for appealing such actions.
                                            <span>*</span></label>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input form-input" id="exampleCheck5" required>
                                        <label class="form-check-label" for="exampleCheck5">
                                            <strong>Compliance with Laws: </strong> Emphasize that sellers must comply
                                            with
                                            all relevant laws and regulations, including those related to product
                                            safety,
                                            labeling, and intellectual property.
                                            <span>*</span></label>
                                    </div>
                                </div>
                                <div class="tab">
                                    <h3 class="tab-header">Account Security</h3>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label"> Password
                                            <span>*</span></label>
                                        <input type="password" class="form-control form-input" name="Password" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Repeat Password
                                            <span>*</span></label>
                                        <input type="password" class="form-control form-input" name="RepeatPassword" required>
                                    </div>
                                </div>
                                <div style="overflow:auto; margin-top: 30px;">
                                    <div style="float:right;">
                                        <button type="button" id="prevBtn" class="btn btn-dark"
                                            onclick="nextPrev(-1)">Back</button>
                                        <button type="button" id="nextBtn" class="btn btn-success"
                                            onclick="nextPrev(1)">Continue</button>
                                        <button type="submit" id="submitBtn" class="btn btn-success">Submit</button>
                                    </div>
                                </div>

                                <!-- Circles which indicates the steps of the form: -->
                                <div style="text-align:center;margin-top:40px;display: none;">
                                    <span class="step"></span>
                                    <span class="step"></span>
                                    <span class="step"></span>
                                    <span class="step"></span>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>

            <%@include file="script.jsp" %>
                <script>
                    const statesByCountry = {
                        USA: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"],
                        Canada: ["Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland and Labrador", "Northwest Territories", "Nova Scotia", "Nunavut", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan", "Yukon"],
                        Australia: ["Australian Capital Territory", "New South Wales", "Northern Territory", "Queensland", "South Australia", "Tasmania", "Victoria", "Western Australia"],
                        India: ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goias", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"],

                        // Add more country-state mappings here
                    };

                    function populateStates() {
                        const countrySelect = document.getElementById("countries");
                        const stateSelect = document.getElementById("states");
                        const selectedCountry = countrySelect.value;

                        // Clear the state dropdown
                        stateSelect.innerHTML = "";

                        if (selectedCountry in statesByCountry) {
                            const states = statesByCountry[selectedCountry];
                            for (const state of states) {
                                const option = document.createElement("option");
                                option.value = state;
                                option.text = state;
                                stateSelect.appendChild(option);
                            }
                        } else {
                            const option = document.createElement("option");
                            option.text = "Select a Country First";
                            stateSelect.appendChild(option);
                        }
                    }

                    // Initial population of states based on the default selected country
                    populateStates();

                </script>

    </body>

    </html>