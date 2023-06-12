<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <title>Signup</title>
</head>

<body style="background: linear-gradient(to right,rgb(205, 255, 205) , rgb(181, 181, 247));">
  <!--- error alert start --->
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

        <!--- error alert end --->
    <div class="container">
        <div class="card shadow p-5 m-5 mt-2">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center mb-5">Login</h1>
                </div>
                <div class="col p-5">
                    <img src="https://pngimg.com/uploads/shopping_cart/small/shopping_cart_PNG73.png" alt=""
                        class="w-75">
                </div>
                <div class="col">
                <cfoutput>
                    <form action=#buildURL(action='auth.login')# method='post'>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control border-0 border-bottom" id="email"
                                 name="email" placeholder="Enteryour email address here..." required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control border-0 border-bottom"
                                id="password" name="password" placeholder="Enter password  here..." required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                        <cfoutput>
                        <p class="text-muted mt-2 text-end">Doesn't have an account <a href="#buildURL('auth.signup')#">register here</a></p>
                        </cfoutput>
                    </form>
                </cfoutput>
                </div>
            </div>
        </div>
    </div>

</body>

</html>