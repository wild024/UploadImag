<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>
    <BODY>
        <H1>Fetching Data From a Database</H1>
        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/appdb", "root", "apcl123456");
            Statement statement = connection.createStatement();
            String id = request.getParameter("id");  
            ResultSet resultset = 
                statement.executeQuery("select * from contacts") ; 
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {
        %>
        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
               <TH>Name</TH>
               <TH>City</TH>
              
               <TH>picture</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getInt(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getBlob(4) %> </TD>
           </TR>
       </TABLE>
       <BR>
       <% 
           } 
       %>
    </BODY>
</HTML>