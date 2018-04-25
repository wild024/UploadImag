<%-- 
    Document   : show
    Created on : Apr 18, 2018, 10:22:30 AM
    Author     : najch
--%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Blob image = null;
            Connection con = null;
            byte[] imgData = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appdb", "root", "apcl123456");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select photo from contacts where contact_id = '1'");
                if (rs.next()) {
                    image = rs.getBlob(1);
                    imgData = image.getBytes(1, (int) image.length());
                } else {
                    out.println("Display Blob Example");
                    out.println("image not found for given id>");
                    return;
                }
        // display the image
          //      response.setContentType("image/jpg");
          //      OutputStream o = response.getOutputStream();
          //      o.write(imgData);
           //     o.flush();
          //      o.close();
            } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                return;
           } finally {
                try {
                    rs.close();
                   stmt.close();
                   con.close();
               } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
         <TABLE BORDER="1">
            <TR>
               
               <TH>picture</TH>
           </TR>
           <TR>
               
               <TD> <%=imgData %> </TD>
           </TR>
       </TABLE>
       <BR>
    </body>
</html>
