
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>
<html>
 <body>
    <h2> Image Detail </h2>
    <p> Please add the image detail </p>

   <form action = "addedImage.jsp" method = "POST">
   <input type = "hidden" name = "gallery_id" value = <%=request.getParameter("gallery_id")%> > 
   <p> Image </p>
    Title       : <input type = "text" name = "image_title" required></br>
    Link        : <input type = "text" name = "image_link" required></br>
  
   <p> Detail </p>
    Year        : <input type = "text" name = "detail_year" required></br>
    Type        : <input type = "text" name = "detail_type" required></br>
    Width       : <input type = "text" name = "detail_width" required></br>
    Height      : <input type = "text" name = "detail_height" required></br>
    Location    : <input type = "text" name = "detail_location" required></br>
    Description : <input type = "text" name = "detail_description" required></br>
    
    <input type = "submit" value = "Add" />
  </form>
        
 </body>
</html>