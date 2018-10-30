<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.Exception"%>
<%@ include file="function.jsp" %>

<p> Find From Type </p>
        

<%
    Connection con = load();
    String typeName =request.getParameter("type_name");
    String imageID_inDetail = null;
    String imageID_inImage = null;
    
    try{
        Statement stmt = con.createStatement();
        String sql = "SELECT*FROM detail";
        ResultSet rs = stmt.executeQuery(sql);
        
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>imageID</th>");
        out.println("</tr>");
        
        while(rs.next()){
        if (typeName.equals(rs.getString("type"))){
            imageID_inDetail = rs.getString("image_id");
            out.println("<tr>");
            
            out.println("<td>" + imageID_inDetail +"</td>");
            imageID_inImage = func_ImageIDinImage(imageID_inDetail);
            try{
                Statement stmt2 = con.createStatement();
                String sql2 = "SELECT*FROM image WHERE image_id = " + imageID_inImage;
                ResultSet rs2 = stmt.executeQuery(sql2);
                while(rs2.next()){
                    out.println("<img src='" + rs2.getString("link")+"'style='width:100px;height:100px;>'");
                }
            out.println(imageID_inImage);
            out.println("</tr>");
                }catch(Exception e){
                    System.out.println(e.toString());   
                }
            }
        }   
    out.println("</table>");
    }catch(Exception e){
            System.out.println(e.toString());   
    }
%>

<%! String func_ImageIDinImage(String imageID_inDetail){
            String imageID_inImage = null;
    try{
            Connection con = load();
            Statement stmt = con.createStatement();
            System.out.println("imageID_inDetail is " + imageID_inDetail);
            String sql = "SELECT * FROM image where image_id = " + imageID_inDetail;
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                System.out.println(rs.getString("image_id"));
                imageID_inImage = rs.getString("image_id");
                break;
            }
            
    }catch(Exception e){
            System.out.println(e.toString());
        }
            return imageID_inImage;
       }
%>
