<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<p> Image </p>
<%
    Connection con = load();
    String I_ID =request.getParameter("image_id");
    String G_ID = request.getParameter("gallery_id");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM gallery.image WHERE gallery_id = " + G_ID;
        ResultSet rs = stmt.executeQuery(sql);
        int count = 1;
        out.println("<table>");
    while(rs.next()){
        out.println("<tr>");
        out.println("Image " + count);
        out.println("<br></br>");        
        out.println("Title - " + rs.getString("title"));        
        out.println("<img src='" + rs.getString("link")+"'style='width:100px;height:100px;>'");
 %>     <td>
        <br>
        <form action = "seeDetail.jsp" method = "POST"></br>
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> > 
        <input type = "hidden" name = "title" value = <%=rs.getString("title")%> > 
        <input type = "submit" value = "see detail"/>
        </form>
        
        <form action = "deleteImage.jsp" method = "POST">
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> > 
        <input type = "submit" value = "delete Image"/>        
        </form>
        
        <form action = "addArtist.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> > 
        <input type = "submit" value = "add Artist"/>
        </form>
        
        <form action = "seeArtist.jsp" method = "POST"></br>
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> >
        <input type = "hidden" name = "artist_id" value = <%=rs.getString("artist_id")%> > 
        <input type = "submit" value = "see artist"/>
        </form>
        
        <form action ="modifyImageAndDetail.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> >
        <input type = "hidden" name = "artist_id" value = <%=rs.getString("artist_id")%> > 
        <input type = "submit" value = "modify Image and detail"/>
        </form>
        
        <form action = "modifyArtist.jsp" method = "POST">
        <input type = "hidden" name = "gallery_id" value = <%=rs.getString("gallery_id")%> > 
        <input type = "hidden" name = "image_id" value = <%=rs.getString("image_id")%> >
        <input type = "hidden" name = "artist_id" value = <%=rs.getString("artist_id")%> > 
        <input type = "submit" value = "modify Artist"/>
        </form>
        
        </td>
        </br>
        
    <%out.println(rs.getString("link"));
    out.println("</tr>");
    count++;
    %>
    
    <br></br>
    <%
        }
    out.println("</table>");
    }catch(Exception e){
        System.out.println(e.toString());
    }
%>

