<%-- 
    Document   : valid
    Created on : Apr 14, 2023, 10:07:34 AM
    Author     : USER
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
    *
    {
    margin: 0px;
    padding: 0px;
    }
    body{
        background-image: url('IMG-20230418-WA0001.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size:cover;
    }
    .header
    {

    background-color: skyblue;
    line-height: 30px;
    padding-left: 30px;
    }

    a,a:hover
    {
    text-decoration: none!important;
    }

    .logout
    {
    float: right;
    padding-right: 30px;
    }

    ul
    {
    background-color: #424a5b;
    width: 16%;
    height: 100%;
    position: fixed;
    padding-top: 5%;
    text-align: center;
    }

    ul li
    {
    list-style: none;
    padding-bottom: 30px;
    font-size: 15px;
    }

    ul li a
    {
    color: white;
    font-weight: bold;
    }

    ul li a:hover
    {
    color: skyblue;
    text-decoration: none;
    }

    .content
    {
    margin-left: 20%;
    margin-top: 5%;
    }
    img{
        height: 45%;
        width: 45%;
    }
            </style>

        </head>
        <body>

    <header class="header">
    <center><h3>TAMIL NADU ENGINEERING COUNSELLING-2023</h3>
                <h4>B.E/B.Tech ONLINE REGISTRATION</h4>
    </center>
    </header>
            <%
            String n=request.getParameter("user");
            String m=request.getParameter("mail");
            String p=request.getParameter("pass");
            out.println("<aside><ul><li><a href='register.jsp?student="+n+"&mail="+m+"'>APPLICATION FORM</a></li><li><a href='ranklist.jsp'>RANKLIST</a><li><a href='college.jsp?student="+n+"&mail="+m+"'>CHOICES</a></li><li><a href='allocated.jsp'>SEAT ALLOTMENT</a></li></ul></aside>");
            String pass;
            Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
            Statement st=c.createStatement();
            boolean flag=true;boolean dummy=true;
            ResultSet rs=st.executeQuery("select * from student");
            while(rs.next()){
                if(rs.getString("email").equals(m)){
                    n=rs.getString("studentname");
                    pass=rs.getString("password");
                    flag=false;
                    if(pass.equals(p)!=true){
                        out.println("<div class='content'><a href='login signup.html'>INVALID USER ID AND PASSWORD</a></div>");
                        dummy=false;
                    }      
                    break;
                }
            }
    %>

    <div class="content">
        <center> 
    <%
        if(flag){
                st.executeUpdate("insert into student values('"+n+"','"+m+"','"+p+"')");
                out.println("<h1>WELCOME TO ENGINEERING COUNSELLING "+n.toUpperCase()+"<br></h1>");
            }
            else if(dummy){
                out.println("<h1>WELCOME TO ENGINEERING COUNSELLING "+n.toUpperCase()+"<br></h1>");
            }
    %>
    <br><br><img src="Screenshot (7).png">
       </center>
    </div>
    </body>
</html>