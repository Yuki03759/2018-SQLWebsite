<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> modifiedGallery </title>
 </head>
 
 <body>
    <h4> Modified Gallery </h4>
    
<% 
    Connection con = load();
    String new_name = request.getParameter("name");
    String new_description = request.getParameter("description");
    String G_ID = request.getParameter("gallery_id");
    
    Statement stmt = con.createStatement();
    String sql = "SELECT*FROM gallery WHERE gallery_id = " + G_ID;
    ResultSet rs = stmt.executeQuery(sql);
    
    modifyGallery(con, G_ID, new_name, new_description);
    
    response.sendRedirect("/gallery/allGallery.jsp");
    
%>

<%! void modifyGallery(Connection con, String gallery_id, String n_name, String n_description){
  
    try{
        PreparedStatement pstmt = con.prepareStatement("UPDATE gallery SET name=?, description=? WHERE gallery_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, n_name);
        pstmt.setString(2, n_description );
        pstmt.setString(3, gallery_id );
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        while(rs.next()){
            System.out.println("Successfuly added. Gallery_ID" + rs.getInt(1));
        }
    }catch(Exception e){
        
    }
}
%>

  </body>
 </html>