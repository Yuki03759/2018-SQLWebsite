<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
  
    String typeName = (request == null)? "None":request.getParameter("type_name");
    if( typeName== null || typeName == "")
    {
        typeName = "None";
    }
    
    String locationName = (request == null)? "None":request.getParameter("location_name");
    if( locationName== null || locationName == "")
    {
        locationName = "None";
    }
    
    out.println("Searched by type " + typeName + "<br>");
    out.println("Searched by location " + locationName + "<br>");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM image,detail WHERE image.image_id = detail.image_id";
        if( !typeName.equals("None") )
        {
            sql += " AND type = '" + typeName + "'";
        }
        if( !locationName.equals("None") )
        {
            sql += " AND location = '" + locationName + "'";
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        out.println("<table>");
        out.println("<tr>");
        out.println("</tr>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<br>" + rs.getString("image.title") + "<br>");
            out.println("<img src='" + rs.getString("link")+"'style='width:100px;height:100px;>'" + "<br>");
            out.println("</tr>");
        }
        out.println("</table>");
        }catch(Exception e){
            System.out.println(e.toString());
    }
    %>