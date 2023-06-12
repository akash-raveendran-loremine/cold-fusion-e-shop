<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/img/title-logo.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <title>E-shop</title>
    <style>
        .card-img-top {
            transition: all ease .3s;
        }

        .card-img-top:hover {
            transform: scale(1.1);
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: linear-gradient(to bottom, rgb(29, 70, 104), rgb(23, 55, 82));
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-dark">
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col ms-5">
                    <a href="#" class="nav-link text-light fw-bold fs-1"><i class="bi bi-bag-heart-fill"></i> E shoP</a>
                </div>
                <div class="col d-flex justify-content-end align-items-center">
                    <cfoutput>
                        <a href="#buildURL('main.default')###products" class="nav-link text-light"><i
                                class="bi bi-bag"></i> Products</a>
                        <a href="#buildURL('main.cart')#" class="nav-link text-light"> <i class="bi bi-cart4"></i>
                            Cart
                            <span class="badge rounded-pill bg-light text-primary" id="cartCount"
                                style="transform: translateY(-10px);"> </span>
                        </a>
                        <a href="#buildURL('main.orders')#" class="nav-link text-light"><i class="bi bi-truck"></i>
                            Orders <span class="badge rounded-pill bg-light text-primary" id="orderCount"
                                style="transform: translateY(-10px);"> </span></a>
                        <a href="#buildURL('auth.logout')#" class="nav-link text-danger fw-bold"
                        onclick="return confirm('Logout from Eshop?')"
                        >
                            Logout <i class="bi bi-power"></i></a>
                    </cfoutput>
                </div>
            </div>
        </div>
    </nav>
    <div style="min-height: 54vh;margin-top: 15vh;">
        <cfoutput>
            #body#
        </cfoutput>
    </div>
    <footer id="footer" class="bg-dark px-5 pt-5">
        <div class="d-flex justify-content-between mb-3">
            <div class="left">
                <h1 class="text-light">E shop</h1>
                <p class="text-muted">Best products at best prices</p>
            </div>
            <div class="right pt-5">
                <form action="" class="d-flex">
                    <input type="text" class="border-0 border-bottom px-2 py-1 w-100"
                        placeholder="Enter your email to contact us">
                    <button class="btn btn-outline-warning">Submit</button>
                </form>
            </div>
        </div>
        <hr class="text-secondary">
        <p class="text-center text-info pb-2 mb-0">Created By Akash</p>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                type: 'GET',
                url: "index.cfm?action=main.getCartCount",
                success: function (response) {
                    // console.log(response);//count of products in cart
                    $('#cartCount').html(response);
                },
                error: function (error) {
                    console.log(error);
                }
            });
            $.ajax({
                type: 'GET',
                url: "index.cfm?action=main.getOrdersCount",
                success: function (response) {
                    console.log(response);//count of  orders
                    $('#orderCount').html(response);
                },
                error: function (error) {
                    console.log(error);
                }
            })
        })
    </script>
</body>

</html>