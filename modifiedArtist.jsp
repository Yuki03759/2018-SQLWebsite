<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <head>
  <title> modifiedArtist </title>
 </head>
 
 <body>
    <h4> Modified Artist </h4>
    
<% 
    Connection con = load();
    String new_name = request.getParameter("name");
    String new_birth_year = request.getParameter("birth_year");
    String new_country = request.getParameter("country");
    String new_description = request.getParameter("description");
    String A_ID = request.getParameter("artist_id");
    
    Statement stmt = con.createStatement();
    String sql = "SELECT*FROM artist WHERE artist_id = " + A_ID;
    ResultSet rs = stmt.executeQuery(sql);
    
    out.println("new_name is" + new_name);
    out.println("new_birth_year is " + new_birth_year);
    out.println("new_country is " + new_country);
    out.println("new_description is " + new_description);
    out.println("A_ID is" + A_ID);
    
    modifyImage(con, A_ID, new_name, new_birth_year, new_country, new_description);
    
    response.sendRedirect("/gallery/allGallery.jsp");
    
%>

<%! void modifyImage(Connection con, String artist_id, String n_name, String n_birthyear, String n_country, String n_description){
  
    try{
        System.out.println("In function, new_name = " + n_name);
        System.out.println("In function, n_birthyear = " + n_birthyear);
        System.out.println("In function, n_country = " + n_country);
        System.out.println("In function, n_description = " + n_description);
        PreparedStatement pstmt = con.prepareStatement("UPDATE artist SET name=?, birth_year=?, country=?, description=? WHERE artist_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, n_name);
        pstmt.setString(2, n_birthyear);
        pstmt.setString(3, n_country);
        pstmt.setString(4, n_description );
        pstmt.setString(5, artist_id );
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        while(rs.next()){
            System.out.println("Successfuly added. Artist_ID" + rs.getInt(1));
        }
    }catch(Exception e){
        
    }
}
%>

  </body>
 </html>