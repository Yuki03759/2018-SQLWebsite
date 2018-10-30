<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<p> Image Artist Detail </p>
<%
    Connection con = load();
    String I_ID =request.getParameter("image_id");
    String G_ID =request.getParameter("gallery_id");
    String A_ID =request.getParameter("artist_id");
    
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM artist WHERE artist_id = " + A_ID;
        ResultSet rs = stmt.executeQuery(sql);
        
    while(rs.next()){
        out.println("artist id = " + rs.getString("artist_id") + "<br>");
        out.println("name = " + rs.getString("name") + "<br>");
        out.println("birth_year = " + rs.getString("birth_year") + "<br>");
        out.println("country = " + rs.getString("country") + "<br>");
        out.println("description = " + rs.getString("description") + "<br>");
        }
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
    
%>
