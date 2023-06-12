<div class="container mt-5">
    <cfif #rc.allOrders.recordCount# eq 0>
        <h2 class="text-center mt-5 pt-5">No Orders Found</h2>
    <cfelse>
    <h2 class="text-center mb-3">
        Orders List
    </h2>
    <table class="table">
        <thead>
            <tr>
                <th>OrderID</th>
                <th>ProductName</th>
                <th>MRP</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <cfoutput>
                <cfloop query="#rc.allOrders#">
                    <tr>
                        <td>#orderID#</td>
                        <td>#productName#</td>
                        <td>#productPrice#</td>
                        <td>#quantity#</td>
                        <td>#totalPrice#</td>
                        <td>
                            <span class="fw-bold">
                                <cfif #status# eq 'shipped'>
                                    <span class="text-success"> #status#</span>
                                    <cfelse>
                                        <cfif #status# eq 'cancelled'>
                                            <span class="text-danger"> #status#</span>
                                            <cfelse>
                                                <span class="text-primary">#status#</span>
                                        </cfif>
                                </cfif>
                            </span>
                        </td>
                        <td class="text-end">
                            <cfif #status# eq 'placed'>
                                <a href="#buildURL(action='admin.shipOrder',querystring='orderID=#orderID#')#"
                                    class="btn btn-success tooltip-test" title="ship item?" onclick="return confirm('Ship this product ?');"> <i class="bi bi-truck"></i> Ship
                                    product</a>
                            </cfif>
                            <cfif #status# !='cancelled'>
                                <a href="#buildURL(action='admin.cancelOrder',querystring='orderID=#orderID#')#"
                                    class="btn btn-danger tootip-test" title="cancel order?"><i class="bi bi-x-octagon-fill"></i> Cancel</a>
                            </cfif>
                        </td>
                    </tr>
                </cfloop>
            </cfoutput>
        </tbody>
    </table>
    </cfif>
</div>