<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String n=request.getParameter("student");
            String m=request.getParameter("mail");
        
        out.println("<form action='choose.jsp?student="+n+"&mail="+m+"' method='post'>");
        out.println("<table>");
        
            String cname;int cse;int it;int ece;int eee;int mech;int civil;int ccode;
            Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery("select * from college");
            while(rs.next())
            {
                ccode=rs.getInt("collegecode");
                cname=rs.getString("collegename");
                cse=rs.getInt("cse");
                it=rs.getInt("it");
                ece=rs.getInt("ece");
                eee=rs.getInt("eee");
                mech=rs.getInt("mech");
                civil=rs.getInt("civil");
        %>
        <tr><td>
        <div class="college">
                <% out.println("<h3><input type='checkbox' name='"+ccode+"'value='"+cname+"'>"+cname+"</h3>"); %>
        <div class="course">
                <%
                    if(cse>0){
                        out.println("<input type='checkbox' value='COMPUTER SCIENCE AND ENGINEERING' name='"+ccode+"cse'>COMPUTER SCIENCE AND ENGINEERING<br>");
                    }
                    if(it>0){
                        out.println("<input type='checkbox' value='INFORMATION TECHNOLOGY' name='"+ccode+"it'>INFORMATION TECHNOLOGY<br>");
                    }
                    if(ece>0){
                        out.println("<input type='checkbox' value='ELECRONIC AND COMMUNICATION ENGINEERING' name='"+ccode+"ece'>ELECRONIC AND COMMUNICATION ENGINEERING<br>");
                    }
                    if(eee>0){
                        out.println("<input type='checkbox' value='ELECTRICAL AND ELECTRONICS ENGINEERING' name='"+ccode+"eee'>ELECTRICAL AND ELECTRONICS ENGINEERING<br>");
                    }
                    if(mech>0){
                        out.println("<input type='checkbox' value='MECHANICAL ENGINEERING' name='"+ccode+"mech'>MECHANICAL ENGINEERING<br>");
                    }
                    if(civil>0){
                        out.println("<input type='checkbox' value='CIVIL ENGINEERING' name='"+ccode+"civil'>CIVIL ENGINEERING<br>");
                    }
                %>
                <br>
            </div>
        </div>
        <%      
            out.println("</td></tr>");
            }
            out.println("<tr><td><center><input type='submit'><center></td></tr></table></form>");
        %>
        
    </body>
</html>
