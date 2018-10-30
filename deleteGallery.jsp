<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
    String G_ID = request.getParameter("gallery_id");
    try{       
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM `gallery`.`gallery` WHERE gallery_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, G_ID);
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        out.println("No Error");
        while(rs.next()){
            out.println("Successfully deleted. Image_ID:" + rs.getInt(1));
        }
    }catch(Exception e){
        out.println("Error");
    }
    response.sendRedirect("/gallery/allGallery.jsp");
%>
    