<cfoutput>
    <div class="container mt-5">
        <cfparam name="rc.allProducts" default="#arrayNew(1)#">
            <div class="card p-5">
                <h2 class="text-center mb-3">All Categories</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Category ID</th>
                            <th>Product Name </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#rc.categoryList#">
                            <tr>
                                <td>#categoryID#</td>
                                <td>#categoryName#</td>
                                <td><a href="#buildURL(action='admin.deleteCategory',querystring='id=#categoryID#')#"
                                        class="btn btn-danger"
                                        onclick='return confirm("Confirm Deleting this category?")'>
                                        <i class="bi bi-trash text-light"></i>
                                    </a>
                                    <button class="btn btn-primary editButton" data-bs-toggle="modal"
                                        data-bs-target="##editCategoryForm" data-bs-catID="#categoryID#"
                                        data-bs-catName='#categoryName#'>
                                        <i class="bi bi-pencil-square editButton" data-bs-catID="#categoryID#"
                                            data-bs-catName='#categoryName#'></i>
                                    </button>
                                </td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div>
    </div>
</cfoutput>


<!-- Modal form for updating category -->
<div class="modal fade" id="editCategoryForm" tabindex="-1" aria-labelledby="editCategoryFormLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <cfoutput>
                <form action="" method="post" id="updateForm">
            </cfoutput>
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryFormLabel">Update Category </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" id="categoryName" name="categoryName" placeholder="Enter the Category name here ..."
                    class="form-control" required>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Update</button>
            </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.querySelector('.table').addEventListener('click', (e) => {
        let button = e.target;
        if (button.classList.contains('editButton')) {
            let id = button.getAttribute('data-bs-catID');
            let categoryName = button.getAttribute('data-bs-catName');

            //setting action of the form
            let updateForm = document.getElementById("updateForm");
            updateForm.action = "?action=admin.updateCategory&id=" + id + "";

            //setting input with the category name
            let categoryNameInput = document.getElementById("categoryName");
            categoryNameInput.value = categoryName;
        }
    })
</script>