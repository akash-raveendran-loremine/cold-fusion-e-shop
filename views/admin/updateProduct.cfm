<cfoutput>
    <div class="container mt-5 ">
        <div class="card p-5 shadow my-5">
            <h1 class="text-center">
                Update Product
            </h1>

            <cfloop query="#rc.productDetails#">
                <form action="#buildURL(action='admin.updateProduct',querystring='ProductID=#ProductID#')#" method="post">
                    <div class="my-3">
                        <label for="productName" class="form-label">Name of the Product</label>
                        <input type="text" class="form-control border-0 border-bottom" id="productName"
                            name="productName" placeholder="Enter product name here..." value="#productName#" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea type="text" class="form-control border-0 border-bottom" id="productDescription"
                            name="productDescription" placeholder="Enter product Description here..." rows="4"
                            required>#productDescription# </textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price (In INR.)</label>
                        <input type="number" class="form-control border-0 border-bottom" id="productPrice"
                            name="productPrice" placeholder="Enter product price here..." value="#productPrice#"
                            required>
                    </div>
                    <div class="mb-3">
                        <label for="categoryID" class="form-label">Product Category</label>
                        <select class="form-control border-0 border-bottom" id="categoryID" name="categoryID" required>
                            <option>Select Product category here...</option>
                            <option value="#categoryID#" selected>#categoryName#</option>
                            <cfloop query="#rc.categoryList#">
                                <option value="#categoryID#">#categoryName#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control border-0 border-bottom" id="quantity" name="quantity"
                            placeholder="Enter product quantity here..." value="#quantity#" required>
                    </div>
                    <button class="btn btn-success w-100 mt-3">Confirm Update</button>
                </form>
            </cfloop>
        </div>
    </div>
</cfoutput>