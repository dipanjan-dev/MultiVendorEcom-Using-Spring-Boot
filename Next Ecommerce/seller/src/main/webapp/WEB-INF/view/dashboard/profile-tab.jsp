<div class="row">
    <div class="col-lg-2">
        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png" alt="user-image"
            class="rounded-user-image" id="blah">
        <!-- <div class="mt-3">
            <label for="formFile" class="form-label">Select image</label>
            <input class="form-control" type="file" id="imgInp"
            onchange="profileImage(event)" name="SecondImage" accept="image/png, image/jpeg,image/jpg">
          </div> -->

          
    </div>
    <div class="col-lg-10">

        <div class="mb-3">
            <label for="" class="form-label">Full Name</label>
            <input type="text" class="form-control" readonly
                value="${userData.getFirstName().trim()} ${userData.getLastName().trim()}">
        </div>
        <div class="mb-3">
            <label for="" class="form-label">Email Address</label>
            <input type="text" class="form-control" readonly
                value="${userData.getEmail()}">
        </div>
        <div class="mb-3">
            <label for="" class="form-label">Contact Number</label>
            <input type="text" class="form-control" readonly
                value="${userData.getContact()}">
        </div>
        <div class="mb-3">
            <label for="" class="form-label">Business Name</label>
            <input type="text" class="form-control" readonly
                value="${userData.getBusinessName()}">
        </div>
    </div>
</div>

<script>
    imgInp.onchange = evt => {
        const [file] = imgInp.files
        if (file) {
            blah.src = URL.createObjectURL(file)
        }
    }
</script>