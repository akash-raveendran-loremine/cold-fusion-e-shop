<section id="banner" class="p-5 d-flex justify-content-center my-5">
    <div class="p-2 bg-light shadow" style="width:80vw;">
        <img src="https://as1.ftcdn.net/v2/jpg/03/14/28/96/1000_F_314289607_ADADbnGr64dpGnddyhZPidCoc6jgKiHK.jpg" alt=""
            style="object-fit: cover;" class="rounded">
    </div>
</section>
<section id="products">
    <h2 class="text-center">
        Products
    </h2>
    <div class="container">
        <div class="row g-4 my-5">
            <cfoutput>
                <cfloop query="#rc.allProducts#">
                    <div class="col-4">
                        <div class="card shadow p-1">
                            <span class="badge rounded-pill bg-success"
                                style="position: absolute;top:220px;right:10px;"><i class="bi bi-bookmark-star"></i>
                                #categoryName#</span>
                            <img src="assets/img/products/#categoryID#.jpg" alt="" class="card-img-top w-100"
                                height="200px" style="object-fit: cover;">
                            <div class="card-body">
                                <p class="card-title fw-bold">
                                    #productName#
                                </p>
                                <p class="card-text text-muted mt-4">
                                    #productDescription#
                                </p>
                                <p class="card-text text-success text-end fw-bold">₹#productPrice#</p>
                            </div>
                            <div class="card-footer text-end">
                                <a href="#buildURL(action='main.buySingleProduct',querystring='productID=#productID#')#" onclick="return confirm('Confirm Buying this item?')" class="btn btn-info">Buy Now</a>
                                <a href="#buildURL(action='main.addToCart',querystring='productID=#productID#')#"
                                    class="btn btn-warning">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </cfloop>
            </cfoutput>
        </div>
    </div>
</section>