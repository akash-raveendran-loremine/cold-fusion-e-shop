<cfoutput>
    <cfif rc.userOrders.recordCount eq 0>
        <div class="text-center">
            <h1 class=" py-5">
                You Haven't Ordered Anything Yet.🙁
            </h1>
            <a href="#buildURL('main.default')###products" class="btn btn-outline-success text-decoration-none">Start
                Shopping
                Now ... <i class="bi bi-cart4"></i>
            </a>
        </div>
        <cfelse>
    <h1 class="text-center">Your Orders</h1>
    <div class="container my-5 px-5">

        <cfloop query="#rc.userOrders#">
            <div class="card  p-1 mt-3  shadow">
                <div class="row">
                    <div class="col">
                        <img src="assets/img/products/#categoryID#.jpg" class="w-100" alt="">
                    </div>
                    <div class="col">
                        <p class="text-start mt-5 fw-bold">
                            #productName#
                        </p>
                        <p class="text-secondary">
                            #productDescription#
                        </p>
                        <div class="fw-bold mb-3">
                            Qty. #quantity#&nbsp;
                        </div>
                        <p class="fw-bold">
                            Total : <span class="text-success">
                                ₹ #totalPrice#
                            </span>
                        </p>
                        <div class="text-end mt-5 me-5 fw-bold">
                        <cfif #status# eq 'shipped'>
                            <p class="text-success"><i class="bi bi-truck"></i> Order Is #status#</p>
                            <cfelse>
                            <cfif #status# eq 'cancelled'>
                            <p class="text-danger"><i class="bi bi-x-octagon-fill"></i> Order Is #status#</p>
                            <cfelse>
                            <p class="text-primary"><i class="bi bi-check2-circle"></i> Order Is #status#</p>
                            </cfif>
                        </cfif>
                        </div>
                    </div>
                </div>
            </div>
        </cfloop>
    </div>
    </cfif>
</cfoutput>