<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<%
    Connection con = load();
  
    String CountryName = (request == null)? "None":request.getParameter("country_name");
    if( CountryName== null || CountryName == "")
    {
        CountryName = "None";
    }
    
    String birth_year_name = (request == null)? "None":request.getParameter("birth_year_name");
    if( birth_year_name== null || birth_year_name == "")
    {
        birth_year_name = "None";
    }
    
    out.println("country is " + CountryName + "<br>");
    out.println("birth_year is " + birth_year_name + "<br>");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM artist WHERE artist_id=artist_id";// WHERE image.image_id = detail.image_id";
     
       if( !CountryName.equals("None") )
        {
            sql += " AND country = '" + CountryName + "'";
        }
        if( !birth_year_name.equals("None") )
        {
            sql += " AND birth_year = '" + birth_year_name + "'";
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        out.println("<table>");
        out.println("<tr>");
        out.println("</tr>");
        while(rs.next()){
            out.println("<tr>");
            out.println("<br>");
            out.println("artist name is " + rs.getString("name"));
            out.println("</tr>");
        }
        out.println("</table>");
        }catch(Exception e){
            System.out.println(e.toString());
    }
    %>