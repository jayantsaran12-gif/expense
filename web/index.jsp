<%-- 
    Document   : newjsp
    Created on : 20-Nov-2026, 4:43:08 pm
    Author     : Ravindra Ji
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Expense Tracker</title>
</head>
<body>

    <h1>Personal Expense Tracker</h1>

    <h3>Add New Expense</h3>

    <form action="addExpense.jsp" method="post">

        Expense Name:<input type="text" name="expenseName" required>
        <br>

        Category:
        <select name="category">
            <option>Food</option>
            <option>shopping</option>
            <option>Travel</option>
            <option>mediciens</option>
            <option>Education</option>
            <option>fuel</option> 
            <option>Other</option>
        </select>

        <br>
        Amount:<input type="number" name="amount" required>
        <br>

        <input type="submit" value="Add Expense">

    </form>

    <br>

    <a href="viewExpense.jsp">View All Expenses</a>

</body>
</html>
