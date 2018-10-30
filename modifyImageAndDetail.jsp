<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <body>
    <h2> Modify Detail </h2>
    <p> Please modify the image </p>
<%
    Connection con = load();
    String I_ID = request.getParameter("image_id");
    String A_ID = request.getParameter("artist_id");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM gallery.image WHERE image_id = " + I_ID;
        ResultSet rs = stmt.executeQuery(sql);

%>
   <form action = "modifiedImage.jsp" method = "POST">
   <input type = "hidden" name = "image_id" value = <%=request.getParameter("image_id")%> >
   <p> Image </p>
    Title       : <input type = "text" name = "image_title" required></br>
    Link        : <input type = "text" name = "image_link" required></br> 
    <input type = "submit" value = "Modify Image" />
    </form>
    
    <form action = "modifiedDetail.jsp" method = "POST">
   <input type = "hidden" name = "image_id" value = <%=request.getParameter("image_id")%> >
   <p> Detail </p>
    Year        : <input type = "text" name = "detail_year" required></br>
    Type        : <input type = "text" name = "detail_type" required></br>
    Width       : <input type = "text" name = "detail_width" required></br>
    Height      : <input type = "text" name = "detail_height" required></br>
    Location    : <input type = "text" name = "detail_location" required></br>
    Description : <input type = "text" name = "detail_description" required></br>
    <input type = "submit" value = "Modify Detail" />
  </form>
<%  }catch(Exception e){
    
}


%>        
 </body>
</html>