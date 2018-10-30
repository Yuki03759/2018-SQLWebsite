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
    String sql = "SELECT * FROM gallery.artist";
    ResultSet rs = stmt.executeQuery(sql);
    
    out.println("<table>");
    out.println("<tr>");
    out.println("<th>ID</th>");
    out.println("<th>name</th>");
    out.println("<th>birthyear</th>");
    out.println("<th>country</th>");
    out.println("<th>description</th>");
    out.println("</tr>");
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>" + rs.getString("artist_id")+"</td>");
        out.println("<td>" + rs.getString("name")+"</td>");
        out.println("<td>" + rs.getString("birth_year")+"</td>");
        out.println("<td>" + rs.getString("country")+"</td>");
        out.println("<td>" + rs.getString("description")+"</td>");

        out.println("</tr>");
        }
    out.println("</table>");
    }catch(Exception e){
        System.out.println(e.toString());
    }
    
%>
    <p> Go to the top page </P>
    <form action = "return.jsp" method="POST">
    <input type = "submit" value = "return" />
    </br>