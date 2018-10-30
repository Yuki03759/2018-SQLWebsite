<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
    try{
    Statement stmt = con.createStatement();
    String sql = "SELECT * FROM gallery.gallery";
    ResultSet rs = stmt.executeQuery(sql);
    
    out.println("<table>");
    out.println("<tr>");
    out.println("<th>ID</th>");
    out.println("<th>Name</th>");
    out.println("<th>Description</th>");
    out.println("</tr>");
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>" + rs.getString("gallery_id")+"</td>");
        out.println("<td>" + rs.getString("name")+"</td>");
        out.println("<td>" + rs.getString("description")+"</td>");
 %>     <td>
 
        <form action = "viewGallery.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "submit" value = "view"/>
        </form>
        
        <form action = "addImageAndDetail.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "submit" value = "add Image"/>
        </form>
        
        <form action = "deleteGallery.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "submit" value = "delete"/>        
        </form>
        
        <form action = "modifyGallery.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "submit" value = "modify"/>        
        </form>
        
        </td>
        
    <%out.println("</tr>");
        }
    out.println("</table>");
    }catch(Exception e){
    }
    
%>