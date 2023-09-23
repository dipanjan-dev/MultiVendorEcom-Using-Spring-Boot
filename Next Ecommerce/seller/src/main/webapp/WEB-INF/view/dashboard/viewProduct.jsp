<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <c:if test="${not empty userData}">
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
      <meta http-equiv="X-UA-Compatible" content="ie=edge" />
      <title>${userData.getSellerid()}</title>
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
                      Overview
                    </div>
                    <h2 class="page-title">
                      View Products
                    </h2>
                  </div>
                </div>

              </div>
            </div>
            <!-- Page body -->
            <c:if test="${not empty deleteDone}">
              <div class="alert alert-s alert-dismissible fade show" role="alert">
                  ${deleteDone}

                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
          </c:if>   
            <div class="page-body container">
              <div class="cards bg-transparent border-none">
                <div class="table-responsive">
                  <table id="myTable" class="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th>SL Number</th>
                        <th>Product Id</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Available Stock</th>
                        <th class="no-print">Action</th>
                      </tr>
                    </thead>
                    <tbody class="table-tbody">
                      <c:forEach items="${productData}" var="product">
                        <tr>
                          <td></td>
                          <td>${product.getProductId()}</td>
                          <td>${product.getItemName()}</td>
                          <td>${product.getCatrgory()}</td>
                          <td>${product.getBdp()}</td>
                          <td>${product.getStock()}</td>
                          <td>
                            <a href="" class="me-2" data-bs-toggle="tooltip" data-bs-title="Edit This Product" data-bs-placement="left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-edit"
                                width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1"></path>
                                <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z"></path>
                                <path d="M16 5l3 3"></path>
                              </svg>
                            </a>
                            <a href="/seller/delete-item/product/${userData.getSellerid()}/${product.getProductId()}" data-bs-toggle="tooltip" data-bs-title="Delete this Product" data-bs-placement="right">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash"
                                width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M4 7l16 0"></path>
                                <path d="M10 11l0 6"></path>
                                <path d="M14 11l0 6"></path>
                                <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12"></path>
                                <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3"></path>
                              </svg>
                            </a>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>

            </div>
        </div>
      </div>
      <%@include file="script.jsp" %>
        <script>
          // let table = new DataTable('#myTable');
          $('#myTable').dataTable({
            dom: 'Bfrtip',
            buttons: [
            {
              extend: 'print',
              exportOptions: {
                columns: ':not(.no-print)' // Exclude columns with class "no-print"
              }
            },
            {
              extend: 'copy',
              exportOptions: {
                columns: ':not(.no-print)' // Exclude columns with class "no-print"
              }
            },
            {
              extend: 'excel',
              exportOptions: {
                columns: ':not(.no-print)' // Exclude columns with class "no-print"
              }
            }, 
            {
              extend: 'pdf',
              exportOptions: {
                columns: ':not(.no-print)' // Exclude columns with class "no-print"
              }
            }
            ],
            colReorder: {
              realtime: true
            },
            "lengthMenu": [50,100,500,1000,2000,5000,10000,50000,100000],
         "order":[],
            rowReorder: true,
            select: true,
            "language": {
              "emptyTable": "Product Not Found"
            },       
            "scrollCollapse": true,
            "columnDefs": [
      {
        "targets": 0, // Target the first column (serial number column)
        "render": function(data, type, row, meta) {
          // If the rendering is for display, show the serial number
          if (type === 'display') {
            return meta.row + 1; // Serial numbers start from 1
          }
          return data;
        }
      }
    ]
          });
        </script>
    </body>

    </html>
  </c:if>
  <c:if test="${empty userData}">
    <c:redirect url="/login" />
  </c:if>