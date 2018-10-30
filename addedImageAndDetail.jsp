<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> adddedImage </title>
 </head>
 
 <body>
    <h4> Image and Detail are added </h4>
    
  
    
<% 
    Connection con = load();
    
    String image_title = request.getParameter("image_title");
    String image_link = request.getParameter("image_link");
    
    String detail_year = request.getParameter("detail_year");
    String detail_type = request.getParameter("detail_type");
    String detail_width = request.getParameter("detail_width");
    String detail_height = request.getParameter("detail_height");
    String detail_location = request.getParameter("detail_location");
    String detail_description = request.getParameter("detail_description");
    
    String gallery_id = request.getParameter("gallery_id");
    String Image_id = addImage(con, image_title, image_link, gallery_id); 
    String Detail_id = addDetail(con, detail_year, detail_type, detail_width, detail_height, detail_location, detail_description);
    addIDs(con, Image_id, Detail_id);
    
    response.sendRedirect("/gallery/allGallery.jsp");
    
%>
  
<%! String addImage(Connection con, String image_title, String image_link, String gallery_id){
    String imageID = null;
    try{
    PreparedStatement pstmt = con.prepareStatement("insert into image values (default,?,?,?, null, null)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, image_title);
    pstmt.setString(2, image_link);
    pstmt.setString(3, gallery_id);
   
    pstmt.executeUpdate();
    ResultSet image_rs = pstmt.getGeneratedKeys();
    while(image_rs.next()){
        imageID = image_rs.getString(1);
    }
    }catch(Exception e){
    }
    return imageID;
}
%>
<%! String addDetail(Connection con, String detail_year, String detail_type, String detail_width, String detail_height, String detail_location, String detail_description){
    String detailID = null;
    try{
    PreparedStatement pstmt = con.prepareStatement("insert into detail values (default,null,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, detail_year);
    pstmt.setString(2, detail_type);
    pstmt.setString(3, detail_width);
    pstmt.setString(4, detail_height);
    pstmt.setString(5, detail_location);
    pstmt.setString(6, detail_description);
    pstmt.executeUpdate();
    ResultSet detail_rs = pstmt.getGeneratedKeys();
    while(detail_rs.next()){
        detailID = detail_rs.getString(1);
    }
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
    return detailID;
}
%>
<%! void addIDs(Connection con, String image_id, String detail_id){
    try{
        PreparedStatement pstmt = con.prepareStatement("UPDATE image SET detail_id=? WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        PreparedStatement pstmt2 = con.prepareStatement("UPDATE detail SET image_id=? WHERE detail_id=?", Statement.RETURN_GENERATED_KEYS);       
        pstmt.clearParameters();
        pstmt.setString(1, detail_id);
        pstmt.setString(2, image_id);
        pstmt2.setString(1, image_id);
        pstmt2.setString(2, detail_id);
        pstmt.executeUpdate();
        pstmt2.executeUpdate();
    }catch(Exception e){
        System.out.println(e.toString());
    }
}

%>
  </body>
 </html>