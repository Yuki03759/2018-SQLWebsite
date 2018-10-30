<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>

<%! Connection load(){
    try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    System.out.println("Connected to the driver");
    
    }catch(Exception e){
       System.out.println(e.toString());
    }
    
    String url="jdbc:mysql://127.0.0.1:3306/gallery?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String id="gallery";
    String pwd="eecs118"; 
    Connection con = null;
    try{
        con=DriverManager.getConnection(url, id, pwd);
        System.out.println("Driver manager connected");
    }catch(Exception e){
        System.out.println(e.toString());
    }
    return con;
}%>

<%!/* void addGallery(Connection con, String name, String description){
    try{
    PreparedStatement pstmt = con.prepareStatement("insert into gallery values (default,?,?)", Statement.RETURN_GENERATED_KEYS);
    pstmt.clearParameters();
    pstmt.setString(1, name);
    pstmt.setString(2, description);
    pstmt.executeUpdate();
    ResultSet gallery_rs = pstmt.getGeneratedKeys();
    while (gallery_rs.next()){
        System.out.println("Successfully added. Gallery_ID:" + gallery_rs.getInt(1));
    }
    }catch(Exception e){
    }
}*/
%>
