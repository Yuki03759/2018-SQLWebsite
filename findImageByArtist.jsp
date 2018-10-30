<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
    String ArtistName = request.getParameter("artist_name");
    String _from = (request==null)? "None" : request.getParameter("year_from");
    String _to = (request==null)? "None" : request.getParameter("year_to");
    int total = 0;
    int count = 0;
    out.println("ArtistName is " + ArtistName);
    
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM artist, image WHERE image.artist_id = artist.artist_id";
        sql += " AND artist.name = '" + ArtistName + "'";
        
        ResultSet rs = stmt.executeQuery(sql);
        out.println("<table>");
        out.println("<tr>");
        out.println("</tr>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<img src='" + rs.getString("link")+"'style='width:100px;height:100px;>'");
            out.println("</tr>");
        }
        out.println("</table>");
    }catch(Exception e){
        out.println(e.toString());
    }

%>

