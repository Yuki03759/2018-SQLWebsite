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
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM gallery.image WHERE image_id = " + I_ID;
        ResultSet rs = stmt.executeQuery(sql);
%>
  <form action = "addedArtist.jsp" method = "POST">
   <input type = "hidden" name = "image_id" value = <%=request.getParameter("image_id")%> > 
   <p> Add Artist </p>
    Name        : <input type = "text" name = "artist_name"></br>
    BirthYear  : <input type = "text" name = "artist_birthyear"></br>
    Country     : <input type = "text" name = "artist_country"></br>
    Description : <input type = "text" name = "artist_description"></br>
    <input type = "submit" value = "Add Artist" />
  </form> 
<%   }catch(Exception e){
    
    }
%>
 </body>
</html>