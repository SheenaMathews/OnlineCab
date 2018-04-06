<%-- 
    Document   : TaxiFeedBack
    Created on : 17 Mar, 2018, 7:55:19 PM
    Author     : basilscolu
--%>
<%
   String TaxiId=session.getAttribute("TaxiId").toString();
          
    
    
    %>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver Complaints</title>
    </head>
    <body>
        <form>
        <h1>Give Your Complaints!</h1>
        <table>
      
      <td>    <textarea  name="txtFEED" maxlength="250" style="width: 400px;height: 200px;" placeholder="give your feedback max 250 character !"></textarea>
          <br>
      
          <input type="submit" name="btn_save" value="save">
      </td>
        </table>
      <%
      if(request.getParameter("btn_save")!=null)
      {
          obj.executeCommand("insert into tbl_drivercomplaints (taxiId,date,complaints) VALUES('"+TaxiId+"',curdate(),'"+request.getParameter("txtFEED")+"')");
     response.sendRedirect("Homepage.jsp");
      }
      
      %>
        </form>
    </body>
</html>
