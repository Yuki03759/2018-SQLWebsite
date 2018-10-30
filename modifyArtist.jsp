<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <body>
    <h2> Modify Artist </h2>
    <p> Please modify the artist </p>
<%
    Connection con = load();
    String A_ID = request.getParameter("artist_id");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM gallery.artist WHERE artist_id = " + A_ID;
        ResultSet rs = stmt.executeQuery(sql);

%>
    <form action = "modifiedArtist.jsp" method = "POST">
   <input type = "hidden" name = "artist_id" value = <%=request.getParameter("artist_id")%> >
    name        : <input type = "text" name = "name" required></br>
    birth_year        : <input type = "text" name = "birth_year" required></br>
    country       : <input type = "text" name = "country" required></br>
    description      : <input type = "text" name = "description" required></br>
    <input type = "submit" value = "Modify Artist" />
  </form>

<%  }catch(Exception e){
    
}


%>        
 </body>
</html>