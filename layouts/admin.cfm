<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="shortcut icon" href="assets/img/title-logo.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Home page</title>
    <style>
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 999;
            background: linear-gradient(to bottom, rgb(29, 34, 37), rgb(12, 18, 24));
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-dark">
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col ms-5">
                    <cfoutput>
                        <a href="#buildURL('admin')#" class="nav-link text-light fw-bold fs-1"><i
                                class="bi bi-bag-heart-fill"></i> Admin ESHOP</a>
                    </cfoutput>
                </div>
                <div class="col d-flex justify-content-end align-items-center">
                    <cfoutput> <a href=#buildURL('admin')# class="nav-link text-light fw-bold">Products</a>
                        <a href="#buildURL('admin.categoryList')#" class="nav-link text-light fw-bold">Categories </a>
                        <a href="#buildURL('admin.usersList')#" class="nav-link text-light fw-bold">Users</a>
                        <a href="#buildURL('admin.allOrders')#" class="nav-link text-light fw-bold">Orders</a>
                        <a href="#buildURL('auth.logout')#" class="nav-link text-danger fw-bold ms-3"
                            onclick="return confirm('Logout from Eshop-admin?')"> <i class="bi bi-power"></i>
                            Logout</a>
                    </cfoutput>
                </div>
            </div>
        </div>
    </nav>

    <div class="mt-5 pt-5">
        <cfoutput>
            <cfparam name="rc.message" default="#arrayNew(1)#">
                <cfif not arrayIsEmpty(rc.message)>
                    <cfloop array="#rc.message#" index="msg">
                        <div class="alert alert-success alert-dismissible fade show" role="alert"
                            style="position: fixed;top:10px;right:10px;z-index:1000">

                            <strong>#msg#</strong>

                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </cfloop>
                </cfif>
        </cfoutput>
        <div class="d-flex justify-content-between">
            <cfoutput>
                <div class="mt-3 ms-5 d-flex">
                    <form action="#buildURL(action='admin.searchProducts')#" method="post" class="d-flex">
                        <input type="search" name="productName" class="form-control border-0 border-bottom"
                            id="productName" placeholder="Type here to search .." required>
                        <button class="btn btn-success" type="submit"><i class="bi bi-search"></i></button>
                    </form>
                    <form action="#buildURL(action='admin.productsByCategory')#" method="post" class="d-flex ms-5">
                        <select class="form-control border-0 border-bottom" id="categoryID" name="categoryID" required>
                            <option value="">Select products by category ...</option>
                            <cfloop query="#rc.categoryList#">
                                <option value="#categoryID#">#categoryName#</option>
                            </cfloop>
                        </select>
                        <button class="btn btn-outline-success" type="submit"><i class="bi bi-funnel"></i></button>
                    </form>
                </div>
            </cfoutput>
            <div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-info mt-3" data-bs-toggle="modal"
                    data-bs-target="#addCategoryForm"><i class="bi bi-plus-lg"></i>
                    Add New Category
                </button>

                <!-- Modalform for add category -->
                <div class="modal fade" id="addCategoryForm" tabindex="-1" aria-labelledby="addCategoryFormLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <cfoutput>
                                <form action="#buildURL('admin.addCategory')#" method="post">
                            </cfoutput>
                            <div class="modal-header">
                                <h5 class="modal-title" id="addCategoryFormLabel">Category Form</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="text" name="categoryName" placeholder="Enter the Category name here ..."
                                    class="form-control" required>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">submit</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!---   end of model form--->
                <cfoutput>
                    <a href="#buildURL('admin.addProduct')#" class="btn btn-info mt-3 me-3"><i
                            class="bi bi-plus-lg"></i> Add New Product</a>
                </cfoutput>
            </div>
        </div>
        <hr>
        <cfoutput>
            #body#
        </cfoutput>

    </div>
</body>

</html>