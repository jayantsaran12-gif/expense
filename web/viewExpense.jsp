<%-- 
    Document   : viewExpense
    Created on : 21-Nov-2026, 11:46:28 am
    Author     : Ravindra Ji
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Expenses</title>
</head>
<body>

<h1>Personal Expense Tracker</h1>

<h2>All Expenses</h2>

<table border="1" cellpadding="10">

<tr>
    <th>ID</th>
    <th>Expense Name</th>
    <th>Category</th>
    <th>Amount</th>
    <th>Date</th>
</tr>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/expense_tracker",
            "root",
            ""
        );

        st = con.createStatement();

        rs = st.executeQuery(
            "SELECT * FROM expenses ORDER BY id DESC"
        );

        while(rs.next())
        {
%>

<tr>
    <td><%=rs.getInt("id")%></td>

    <td><%=rs.getString("expense_name")%></td>

    <td><%=rs.getString("category")%></td>

    <td>Rs. <%=rs.getBigDecimal("amount")%></td>

    <td><%=rs.getTimestamp("expense_date")%></td>
</tr>

<%
        }
    }
    catch(Exception e)
    {
        out.println("Database Error: " + e.getMessage());
    }
    finally
    {
        if(rs != null) rs.close();
        if(st != null) st.close();
        if(con != null) con.close();
    }
%>

</table>

<br>

<a href="index.jsp">Add New Expense</a>

</body>
</html>
