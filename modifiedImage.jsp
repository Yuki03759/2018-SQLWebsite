<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> modifiedDetail </title>
 </head>
 
 <body>
    <h4> Modified Detail </h4>
    
<% 
    Connection con = load();
    String new_image_title = request.getParameter("image_title");
    String new_image_link = request.getParameter("image_link");
    String I_ID = request.getParameter("image_id");

    Statement stmt = con.createStatement();
    String sql = "SELECT*FROM image WHERE image_id = " + I_ID;
    ResultSet rs = stmt.executeQuery(sql);
    
    out.println("new_image_title is" + new_image_title);
    out.println("new_image_link is " + new_image_link);
    out.println("I_ID is" + I_ID);
    
    modifyImage(con, I_ID, new_image_title, new_image_link);
    
    response.sendRedirect("/gallery/allGallery.jsp");
    
%>

<%! void modifyImage(Connection con, String image_id, String n_image_title, String n_image_link){
  
    try{
        System.out.println("In function, n_image_title = " + n_image_title);
        System.out.println("In function, image_id = " + image_id);
        PreparedStatement pstmt = con.prepareStatement("UPDATE image SET title=?, link=? WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, n_image_title);
        pstmt.setString(2, n_image_link);
        pstmt.setString(3, image_id);
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        while(rs.next()){
            System.out.println("Successfuly added. Image_ID" + rs.getInt(1));
        }
    }catch(Exception e){
        
    }
}
%>

  </body>
 </html>