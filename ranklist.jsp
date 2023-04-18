<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="rank.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table,td,th{
                color: blue;
                border:1px solid black;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body></body>
    
        <%
            Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
            Statement st=c.createStatement();
            st.executeUpdate("truncate table ranklist");
            ResultSet rs=st.executeQuery("select * from student_info");
            
            ArrayList<pair>arr=new ArrayList<pair>();
            while(rs.next()){
                String name=rs.getString("studentname");
                String mail=rs.getString("mail");
                double cutoff=rs.getDouble("cutoff");
                String res=String.valueOf(cutoff)+" "+name;
                arr.add(new pair(res,mail));
            }
            Collections.sort(arr,new ranksort());
            for(int i=0;i<arr.size();i++){
                String ov=arr.get(i).first;
                String m=arr.get(i).last;
                double cut=Double.parseDouble(ov.substring(0,4));
                String na=ov.substring(6);
                Connection c3=DriverManager.getConnection("jdbc:derby://localhost:1527/miniproject");
                Statement st3=c3.createStatement();
                boolean flag=true;
                ResultSet rs2=st3.executeQuery("select * from ranklist");
                while(rs2.next()){
                    String mail=rs2.getString("mail");
                    if(mail.equals(m)==true){
                        flag=false;
                        break;
                    }
                }
                c3.close();
                if(flag){
                st.executeUpdate("insert into ranklist values('"+m+"',"+cut+",'"+na+"')");   }
            }
            ResultSet rs1=st.executeQuery("select * from ranklist");
            out.println("<table><tr><th>rank</th><th>name</th></tr>");
            while(rs1.next()){
                double cut=rs1.getDouble("cutoff");
                String n=rs1.getString("studentname");
                out.println("<tr><td>"+cut+"</td><td>"+n+"</td></tr>");
            }
             out.println("</table>");
        %>
</html>
