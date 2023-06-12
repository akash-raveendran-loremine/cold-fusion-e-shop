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
    <title>Signup</title>
</head>

<body style="background: linear-gradient(to bottom, rgb(29, 70, 104), rgb(23, 55, 82));">

    <!--- error alert start --->
    <cfoutput>
    <cfparam name="rc.message" default="#arrayNew(1)#">
        <cfif not arrayIsEmpty(rc.message)>
            <cfloop array="#rc.message#" index="msg">
                <div class="alert alert-danger alert-dismissible fade show" role="alert"
                    style="position: fixed;top:10px;right:10px;z-index:1000">
                    <cfoutput>
                        <strong>#msg#</strong>
                    </cfoutput>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </cfloop>
        </cfif>
    </cfoutput>

        <!--- error alert end --->
        <div class="container">
            <div class="card shadow p-5 m-4 ">
                <div class="row">
                    <div class="col-12">
                        <h1 class="text-center mb-5">Signup</h1>
                    </div>
                    <div class="col p-5">
                        <img src="https://pngimg.com/uploads/shopping_cart/small/shopping_cart_PNG73.png" alt=""
                            class="w-75">
                    </div>
                    <div class="col">
                        <cfoutput>
                            <form method="post" action=#buildURL(action='auth.signup' )#>
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control border-0 border-bottom" id="username"
                                        placeholder="Enter your name here..." name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input type="email" class="form-control border-0 border-bottom" id="email"
                                        name="email" placeholder="Enter your email address here..." required>
                                </div>
                                <div class="mb-3">
                                    <label for="phoneNumber" class="form-label">Phone Number</label>
                                    <input type="number" class="form-control border-0 border-bottom" name="phoneNumber"
                                        id="phoneNumber" placeholder="Enter your phone number here..." required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control border-0 border-bottom" id="password"
                                        name="password" placeholder="Enter password  here..." required>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                                <p class="text-muted mt-3 text-end">already have an account
                                    <a href="#buildURL('auth.login')#">login here</a>
                                </p>
                            </form>
                        </cfoutput>
                    </div>
                </div>
            </div>
        </div>

</body>

</html>