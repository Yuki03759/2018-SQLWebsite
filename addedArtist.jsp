<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> createArtist </title>
 </head>
 
 <body>
 
<% 
    Connection con = load();
    
    String artist_name = request.getParameter("artist_name");
    String artist_birthyear = request.getParameter("artist_birthyear");
    String artist_country = request.getParameter("artist_country");
    String artist_description = request.getParameter("artist_description");
    String Artist_id = addArtist(con, artist_name, artist_birthyear, artist_country, artist_description);   
    String Image_id = request.getParameter("image_id");
    addArtistID(con, Artist_id, Image_id);
    response.sendRedirect("/gallery/allGallery.jsp");
%>


<%! String addArtist(Connection con, String name, String birthyear, String country, String description){
    String artistID = null;
    try{
    PreparedStatement pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, name);
    pstmt.setString(2, birthyear);
    pstmt.setString(3, country);
    pstmt.setString(4, description);
    pstmt.executeUpdate();
    ResultSet rs = pstmt.getGeneratedKeys();
    while (rs.next()){
        artistID = rs.getString(1);
    }
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
    return artistID; 
}%>

<%! void addArtistID(Connection con, String artist_id, String image_id){
    try{
        PreparedStatement pstmt = con.prepareStatement("UPDATE image SET artist_id=? WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, artist_id);
        pstmt.setString(2, image_id);
        pstmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e.toString());
        }
}
%>
  </body>
 </html>
    