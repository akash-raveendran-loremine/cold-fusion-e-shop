<cfoutput>
    <div class="container">
        <cfif #rc.allProducts.recordCount# eq 0>
                <h2 class="text-center mt-5 pt-5">No Products Found</h2>
        <cfelse>
            <div class="card p-5">
                <h2 class="text-center mb-3">All Products</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name </th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#rc.allProducts#">
                            <tr>
                                <td>#ProductID#</td>
                                <td>#productName#</td>
                                <td>#productDescription#</td>
                                <td>#productPrice#</td>
                                <td>#quantity#</td>
                                <td>#categoryName#</td>
                                <th>
                                    <a href="#buildURL(action='admin.deleteProduct',querystring='ProductID=#ProductID#')#"
                                        class="btn btn-danger tooltip-test" title="Delete product"
                                        onclick='return confirm("Confirm Deleting this Product?")'>
                                        <i class="bi bi-trash text-light"></i>
                                    </a>
                                    <a href="#buildURL(action='admin.updateProduct',querystring='ProductID=#ProductID#')#"
                                        class="btn btn-warning tooltip-test" title="Edit product">
                                        <i class="bi bi-pencil-square "></i>
                                    </a>
                                </th>
                            </tr>

                        </cfloop>
                    </tbody>
                </table>

            </div>
        </cfif>
    </div>
</cfoutput>