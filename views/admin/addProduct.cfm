<cfoutput>
    <div class="container mt-5 pt-5">
        <div class="card p-5 shadow my-5">
            <h1 class="text-center">
                Add New Product
            </h1>
            <form action="#buildURL('admin.addProduct')#" method="post">
                <div class="my-3">
                    <label for="productName" class="form-label">Name of the Product</label>
                    <input type="text" class="form-control border-0 border-bottom" id="productName" name="productName"
                        placeholder="Enter product name here..." required>
                </div>
                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea type="text" class="form-control border-0 border-bottom" id="productDescription"
                        name="productDescription" placeholder="Enter product Description here..." rows="4"
                        required></textarea>
                </div>
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price (In INR.)</label>
                    <input type="number" class="form-control border-0 border-bottom" id="productPrice"
                        name="productPrice" placeholder="Enter product price here..." required>
                </div>
                <div class="mb-3">
                    <label for="categoryID" class="form-label">Product Category</label>
                    <select class="form-control border-0 border-bottom" id="categoryID" name="categoryID" required>
                        <option>Select Product category here...</option>
                        <cfloop query="#rc.categoryList#">
                            <option value="#categoryID#">#categoryName#</option>
                        </cfloop>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control border-0 border-bottom" id="quantity" name="quantity"
                        placeholder="Enter product quantity here..." required>
                </div>
                <button class="btn btn-success w-100 mt-3">Submit</button>
            </form>
        </div>
    </div>
</cfoutput>