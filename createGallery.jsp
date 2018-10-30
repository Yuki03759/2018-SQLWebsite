<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> createGallery </title>
 </head>
 
 <body>
<% 
    Connection con = load();
    
    String gallery_name = request.getParameter("gallery_name");
    String gallery_description = request.getParameter("gallery_description");

    addGallery(con, gallery_name, gallery_description);
  
    response.sendRedirect("/gallery/index.jsp");
  %>
  
<%! void addGallery(Connection con, String name, String description){
    try{
    PreparedStatement pstmt = con.prepareStatement("insert into gallery values (default,?,?)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, name);
    pstmt.setString(2, description);
    pstmt.executeUpdate();
    ResultSet gallery_rs = pstmt.getGeneratedKeys();
    while (gallery_rs.next()){
        System.out.println("Successfully added. Gallery_ID:" + gallery_rs.getInt(1));
    }
    }catch(Exception e){
    }
}
%>  
  </body>
 </html>