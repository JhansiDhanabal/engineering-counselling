<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
            Enumeration<String>s=request.getParameterNames();
            String str="";
            while(s.hasMoreElements()){
                String s1=s.nextElement();
                String val=request.getParameter(s1);
                if(val.equals(n)!=true && val.equals(m)!=true){
                try{
                    int cc=Integer.parseInt(s1);
                    out.println("<br><h3>"+val+"</h3>");
                }
                catch(Exception e){
                    str=str+s1+" ";
                    out.println(val+"   <br>");
                }
                }
            }
            Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
            Statement st=c.createStatement();
            st.executeUpdate("truncate table choice");
            boolean flag=true;
            ResultSet rs=st.executeQuery("select * from choice");
            while(rs.next()){
                if(rs.getString("mail").equals(m)){
                    flag=false;
                    break;
                }
            }
            if(flag){
            st.executeUpdate("insert into choice values('"+n+"','"+m+"','"+str+"')");}
            out.println("<a href='valid.jsp?user="+n+"&mail="+m+"&pass=123'> confirm </button>");
        %>
    </body>
</html>
