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
            String name=request.getParameter("t1");
            String m=request.getParameter("mail");
            String date=request.getParameter("t3");
            double mark=Double.parseDouble(request.getParameter("t4"));
            double maths=Double.parseDouble(request.getParameter("mat"));
            double chemistry=Double.parseDouble(request.getParameter("che"));
            double physics=Double.parseDouble(request.getParameter("phy"));
            double cutoff=maths+chemistry/2+physics/2;
            Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
            Statement st=c.createStatement();
            boolean flag=true;
            if(n!=null && m!=null && date!=null && mark!=0 && cutoff!=0){
                ResultSet rs=st.executeQuery("select * from student_info");
                while(rs.next()){
                    if(rs.getString("mail").equals(m)){
                        flag=false;
                        break;
                    }
                }
                if(flag){
                st.executeUpdate("insert into student_info values('"+name+"','"+m+"',"+cutoff+","+mark+",'"+date+"')");
                }
            }
            out.println("<a href='valid.jsp?user="+name+"&mail="+m+"&pass=123'> confirm </button>");
        %>
    </body>
</html>