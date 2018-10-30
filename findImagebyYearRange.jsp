<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
    String _from = (request==null)? "None" : request.getParameter("year_from");
    String _to = (request==null)? "None" : request.getParameter("year_to");
    
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM detail, image WHERE image.image_id = detail.image_id";
    
        out.println("The year is from " + _from + " to " + _to);
        
        if( !(_from == null) && !(_from == "") && !(_from == "None") )
        {
            sql += " AND year >= '" + Integer.parseInt(_from) + "'";
        }
            
        if( !(_to == null) || !(_to=="") || !(_to == "None") )
        {
            sql += " AND year <= '" + Integer.parseInt(_to) + "'";
        }

        
        ResultSet rs = stmt.executeQuery(sql);
        out.println("<table>");
        out.println("<tr>");
        out.println("</tr>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<img src='" + rs.getString("link") + "'style='width:100px;height:100px;>'");
            out.println("</tr>");
        }
        
        out.println("</table>");
        
    }catch(Exception e){
        out.println(e.toString());
    }

%>
