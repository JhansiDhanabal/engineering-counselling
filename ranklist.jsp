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
            body{
                background-color: #ff99cc
            }
            table,td,th{
                color: blue;
                border:1px solid black;
                border-collapse: collapse;
                padding: 3px;
                text-align: center;
                background-color: #ccffcc;
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
                String dob=rs.getString("dob");
                String com=rs.getString("community");
                String res=String.valueOf(cutoff)+" "+name;
                arr.add(new pair(res,mail,dob,com));
            }
            Collections.sort(arr,new ranksort());
            for(int i=0;i<arr.size();i++){
                String ov=arr.get(i).first;
                String m=arr.get(i).last;
                String dateofbirth=arr.get(i).dob;
                String community=arr.get(i).com;
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
                st.executeUpdate("insert into ranklist values('"+m+"',"+cut+",'"+na+"','"+dateofbirth+"','"+community+"')");   }
            }
            ResultSet rs1=st.executeQuery("select * from ranklist");
            int index=1;
            out.println("<center><h3>TAMILNADU ENGINEERING ADMISSION-2023</h3><h3>DIRECTORATE OF TECHNICAL EDUCATION, CHENNAI-25</h3><h3>GENERAL ACADEMIC-PROVISIONAL RANK LIST</h3><br><table><tr><th>RANK</th><th>NAME OF THE CANDIDATE</th><th>DATE OF BIRTH</th><th>AGGREGATE MARK</th><th>COMMUNITY</th></tr>");
            while(rs1.next()){
                double cut=rs1.getDouble("cutoff");
                String n=rs1.getString("studentname");
                String dob=rs1.getString("dob");
                String com=rs1.getString("community");
                out.println("<tr><td>"+index+"</td><td style='text-align:left;'>"+n+"</td><td>"+dob+"</td><td>"+cut+"</td><td>"+com+"</td></tr>");
                index++;
            }
             out.println("</table></center>");
        %>
</html>
