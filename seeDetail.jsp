<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<p> Image Detail </p>
<p> Make sure you add artist before seeing detail</p>
<%
    Connection con = load();
    String I_ID =request.getParameter("image_id");
    String G_ID =request.getParameter("gallery_id");
    
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM detail, image, artist WHERE image.image_id = detail.image_id AND artist.artist_id = image.artist_id";
        ResultSet rs = stmt.executeQuery(sql);
        
    while(rs.next()){
        out.println("<img src='" +  rs.getString("link") + "'style='width:100px;height:100px;>'" + "<br>");
        out.println("<br> Detail_id = " + rs.getString("detail_id") + "<br>");
        out.println("Image_id = " + rs.getString("image_id") + "<br>");
        out.println("Title = " + rs.getString("title") + "<br>");
        out.println("Year = " + rs.getString("year") + "<br>");
        out.println("Type = " + rs.getString("type") + "<br>");
        out.println("Width = " + rs.getString("width") + "<br>");
        out.println("Height = " + rs.getString("height") + "<br>");
        out.println("Location = " + rs.getString("location") + "<br>");
        out.println("Description = " + rs.getString("description") + "<br>");
        out.println("Artist Name = " + rs.getString("artist.name") + "<br>");
        out.println("Artist ID = " + rs.getString("artist.artist_id") + "<br>");
        out.println(rs.getString("link") + "<br>");
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
%>
