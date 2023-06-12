<cfoutput>
    <div class="container">
            <div class="card p-5">
                <h2 class="text-center mb-3"> Users List</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>User Name </th>
                            <th>Email ID</th>
                            <th>Phone Number</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#rc.usersList#">
                            <tr>
                                <td>#username#</td>
                                <td>#email#</td>
                                <td>#phoneNumber#</td>
                                <th>
                                    <a href="#buildURL(action='admin.removeUser',querystring='email=#email#')#"
                                        class="btn btn-danger tooltip-test" title="Remove User"
                                        onclick='return confirm("Confirm Removing this User?")'>
                                        <i class="bi bi-trash text-light"></i>
                                    </a>
                                    
                                </th>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div>
    </div>
</cfoutput>