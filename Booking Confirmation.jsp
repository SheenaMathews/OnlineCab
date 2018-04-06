<%-- 
    Document   : Booking Confirmation
    Created on : 17 Mar, 2018, 7:07:39 PM
    Author     : basilscolu
--%>

<%
      String BID=request.getParameter("BID");
             
   
    %>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta http-equiv="refresh" content="30"/>
        <title>JSP Page</title>
    </head>
    <body>
        <label style="color: red">Stay On The Page OtherWise You Dont Get The Confirmation !!</label>  
    <%
      String timegap="";
      ResultSet rsa=obj.selectData("select * from tbl_booking tb where tb.BID='"+BID+"' and CURTIME()<=tb.Time+500");
      if(rsa.next())
      {
         
          
          if(rsa.getString("AcceOrRej").equals("NotYet"))
          {
              %>
               <h1>Your Booking Id:<%=BID%> Is Successful and being processing, your Booking Status will Inform You within 5 Mins!</h1>
              <%
          }
          else if(rsa.getString("AcceOrRej").equals("accept"))

          {
             %>
               <h1>Your Booking Id:<%=BID%> is Successful and your cab will pick You within 5 Mins @ <%=rsa.getString("landMark")%></h1>
              <% 
          }
           else if(rsa.getString("AcceOrRej").equals("reject"))

          {
             %>
               <h1>Your Booking Id:<%=BID%> is Reject and Try Another Cab</h1>
               <h2><a href="taxi Search.jsp">Click Here !</a></h2>
              <% 
          }
      }
      else
      {
          %>
          <h1>Your Booking Id:<%=BID%> is Reject Because Of The Time Out and no reaction from the Taxi Driver <br>
          Sorry for the inconvinience</h1>
               <h2><a href="taxi Search.jsp">Click Here !</a></h2>
              <% 
      }
      %>
        
       
    </body>
</html>
