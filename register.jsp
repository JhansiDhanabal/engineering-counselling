<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table{
                color: blue;
                border:1px solid black;
            }
        </style>
    </head>
    <body>
        <center>
        <h1>student details</h1>
        <%
        String n=request.getParameter("student");
        String m=request.getParameter("mail");
        %>
        <form method="post" action="validation.jsp">
        <table>
            <tr><td><label>name:</label></td><td><input type="text" name="t1"></td></tr>
            <tr><td><label>year of 12th pass:</label></td><td><input type="text" name="t2"></td></tr>
            <tr><td><label>date of birth:</label></td><td><input type="date" name="t3"></td></tr>
            
            <tr><td><label>maths mark:</label></td><td><input type="text" name="mat"></td></tr>
            <tr><td><label>chemistry mark:</label></td><td><input type="text" name="che"></td></tr>
            <tr><td><label>physics mark:</label></td><td><input type="text" name="phy"></td></tr>
            
            <tr><td><label>total mark in 12th:</label></td><td><input type="text" name="t4"></td></tr>
            <tr><td><label>percentage:</label></td><td><input type="text" name="t5"></td></tr>
            <tr><td><label>upload 12th mark sheet:</label></td><td><input type="file" name="t6"></td></tr>
            <tr><td><label>upload your photo:</label></td><td><input type="file" name="t7"></td></tr>
            <% 
            out.println("<input type='hidden' name='student' value='"+n+"'>");
            out.println("<input type='hidden' name='mail' value='"+m+"'>");
            %>
        </table><br><br>
        <input type="submit">
        </form>
    </center>
    </body>
</html>
