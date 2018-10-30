<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
    String I_ID = request.getParameter("image_id");
    try{
       
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM image WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, I_ID);
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        while(rs.next()){
           out.println("Successfully deleted. Image_ID:" + rs.getInt(1));
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
    deleteDetail(con, I_ID);
    response.sendRedirect("/gallery/allGallery.jsp");
%>

<%! void deleteDetail(Connection con, String image_id){
   try{
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM detail WHERE image_id=?", Statement.RETURN_GENERATED_KEYS);
        pstmt.clearParameters();
        pstmt.setString(1, image_id);
        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
       
}
%>