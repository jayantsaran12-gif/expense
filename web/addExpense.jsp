<%-- 
    Document   : addexpense
    Created on : 20-Nov-2026, 4:51:03 pm
    Author     : Ravindra Ji
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name = request.getParameter("expenseName");
    String category = request.getParameter("category");
    String amount = request.getParameter("amount");

    Connection con = null;
    PreparedStatement ps = null;
    
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker",
                "root",
                ""
        );
        
        String sql = "INSERT INTO expenses"
                   +"(expense_name, category, amount)"
                   +"VALUES (?,?,?)";
        
        ps = con.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.setString(2, category);
        ps.setBigDecimal(3, new java.math.BigDecimal(amount));
        
        ps.executeUpdate();
        
        out.println("<<h2>Expense Added Successfully!</h2>");
        out.println("<p>Expense Name: " + name + "</p>");
        out.println("<p>Category: " + category + "</p>");
        out.println("<p>Amount: Rs. " + amount + "</p>");
    }
    catch(Exception e)
    {
        out.println("Database Error: " + e.getMessage());
    }
    finally
    {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>     


    <br>

    <a href="index.jsp">Add Another Expense</a>

    <br><br>

    <a href="viewExpense.jsp">View All Expenses</a>

</body>
</html>

