<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<html>
 <body>
    <h2> Modify Gallery </h2>
    <p> Please modify the gallery </p>
<%
    Connection con = load();
    String G_ID = request.getParameter("gallery_ID");
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM gallery.gallery WHERE gallery_id = " + G_ID;
        ResultSet rs = stmt.executeQuery(sql);

%>
    <form action = "modifiedGallery.jsp" method = "POST">
   <input type = "hidden" name = "gallery_id" value = <%=request.getParameter("gallery_id")%> >
    name        : <input type = "text" name = "name" required></br>
    description      : <input type = "text" name = "description" required></br>
    <input type = "submit" value = "Modify Gallery" />
  </form>

<%  }catch(Exception e){
    
}


%>        
 </body>
</html>