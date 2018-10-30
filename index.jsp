<html>
 <head>
    <title> EECS118_Project2</title>
 </head>
 
 <center><h1> Yuki Gallery </h1></center>
 <body>
 
  <form action = "createGallery.jsp" method = "POST">
   <input type = "hidden" name = "gallery_id" value = <%=request.getParameter("gallery_id")%> > 
    <h3> Add Gallery </h3>
    Name        : <input type = "text" name = "gallery_name" required></br>
    Description : <input type = "text" name = "gallery_description" required></br>
    <input type = "submit" value = "Add Gallery" />
  </form>
  
  <form action = "allGallery.jsp" method = "POST">
    <input type = "submit" value = "View Gallery" />
  </form>

  <form action = "findImage.jsp" method = "POST">
    <br></br>
    <h3> Find Images </h3>
    Find by Type : <input type = "text" name = "type_name"> <br>
    Find by Location : <input type = "text" name = "location_name">
    <input type = "submit" value = "Find" />
  </form>
  
  <form action = "findImageByArtist.jsp" method = "POST">
    Find by Artist Name : <input type = "text" name = "artist_name">
    <input type = "submit" value = "Find"><br><br>
  </form>
  
  <form action = "findImagebyYearRange.jsp" method = "POST">
    Year From : <input type = "text" name = "year_from">
    to  <input type = "text" name = "year_to">
    <input type = "submit" value = "Find">
  </form>
  
  <form action = "findArtist.jsp" method = "POST">
    Find by country : <input type = "text" name = "country_name"> <br>
    Find by birth year : <input type = "text" name = "birth_year_name">
    <input type = "submit" value = "Find" />
  </form>

 </body>
</html>