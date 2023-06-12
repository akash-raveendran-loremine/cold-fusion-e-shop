<h1 class="text-center">Items In Your cart</h1>
<div class="row m-5">
    <div class="col-7">
        <cfoutput>
            <cfloop query="#rc.userCart#">
                <div class="card  p-1 mt-3 border-0 border-bottom border-secondary">
                    <div class="row">
                        <div class="col">
                            <img src="assets/img/products/#categoryID#.jpg" class="w-100" alt="">
                        </div>
                        <div class="col">
                            <a href="#buildURL(action='main.removeProductFromCart',querystring='productID=#productID#')#"
                                class="btn btn-danger rounded-pill" style="position: absolute;right:10px"
                                onclick="return confirm('Remove this item from cart?');">
                                <i class="bi bi-trash text-light"></i></a>
                            <p class="text-start mt-5 fw-bold">
                                #productName#
                            </p>
                            <p class="text-secondary">
                                #productDescription#
                            </p>
                            <div class="d-flex justify-content-between align-items-baseline mt-5">
                                <p class="fw-bold">
                                    Total : <span class="text-success">
                                        ₹ #totalPrice#
                                    </span>
                                </p>
                                <div class="text-end">
                                    Qty.
                                    <cfif #quantity# !=1>
                                        <a class="btn btn-outline-primary rounded-circle fw-bold"
                                            href="#buildURL(action='main.decrementCartProduct',querystring='cartID=#cartID#')#">-</a>
                                    </cfif>
                                    &nbsp;
                                    #quantity#
                                    &nbsp;
                                    <a class="btn btn-outline-primary rounded-circle fw-bold"
                                        href="#buildURL(action='main.incrementCartProduct',querystring='cartID=#cartID#')#">+</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </cfloop>

        </cfoutput>
    </div>
    <div class="col-5">
        <div class="card p-5 border-secondary" style="position:fixed;top:35vh;right:10px; width: 30vw;">
            <p class="text-center fw-bold fs-5">
                TotalAmount : ₹ <cfoutput> #rc.netTotal#</cfoutput>
            </p>
            <div class="d-flex">
                <cfoutput>
                    <a href="#buildURL('main.buyFromCart')#" class="btn btn-success w-100"
                        onclick="return confirm('Confirm order ?')">Proceed to Buy</a>
                </cfoutput>
            </div>
        </div>
    </div>
</div>