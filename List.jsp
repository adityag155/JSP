<%@  page  import="java.sql.*"  %>

<html>
<body>

<%
      Connection con=null;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "javapatil"); 

          String query="Select * from student order by sno";

           Statement stmt=con.createStatement();
           ResultSet rs=stmt.executeQuery(query);
%>

<table border="1" align="center">
<tr>
<th>Student No</th>
<th>Student Name</th>
<th>Student Age</th>
</tr>

<%
           while(rs.next()) 
            {
%>

           <tr>
           <td><% out.println(rs.getInt("sno")); %></td>
           <td><% out.println(rs.getString("sname")); %></td>
           <td><% out.println(rs.getInt("age")); %></td>
           </tr>
<%
            }
%>

</table>

<%
           rs.close();
           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 

%>

</body>
</html>




