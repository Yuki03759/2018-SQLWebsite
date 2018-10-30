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
    String new_detail_year = request.getParameter("detail_year");
    String new_detail_type = request.getParameter("detail_type");
    String new_detail_width = request.getParameter("detail_width");
    String new_detail_height = request.getParameter("detail_height");
    String new_detail_location = request.getParameter("detail_location");
    String new_detail_description = request.getParameter("detail_description");
    
    
    
    String I_ID = request.getParameter("image_id");
    
    
    Statement stmt = con.createStatement();
    String sql = "SELECT*FROM image WHERE image_id = " + I_ID;
    ResultSet rs = stmt.executeQuery(sql);

    out.println("new_detail_year is" + new_detail_year);
    out.println("new_detail_type is " + new_detail_type);
    out.println("new_detail_width is " + new_detail_width);
    out.println("new_detail_height is " + new_detail_height);
    out.println("new_detail_location is " + new_detail_location);
    out.println("new_detail_description is " + new_detail_description);
    out.println("I_ID is" + I_ID);
    out.println("before modifyDetail function");
    modifyDetail(con, I_ID, new_detail_year, new_detail_type, new_detail_width, new_detail_height, new_detail_location, new_detail_description);
    
    response.sendRedirect("/gallery/allGallery.jsp");
    
%>

<%! void modifyDetail(Connection con, String image_id, String n_year, String n_type, String n_width, String n_height, String n_location, String n_description){
  
    try{
        PreparedStatement pstmt = con.prepareStatement("UPDATE detail SET year=?, type=?, width=?, height=?, location=?, description=? WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, n_year);
        pstmt.setString(2, n_type);
        pstmt.setString(3, n_width);
        pstmt.setString(4, n_height);
        pstmt.setString(5, n_location);
        pstmt.setString(6, n_description);
        pstmt.setString(7, image_id);
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