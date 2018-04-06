<%-- 
    Document   : Exam Duty Assign
    Created on : 9 Feb, 2018, 5:53:56 PM
    Author     : basilscolu
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@include file="TaxiHeader.jsp" %>
<!DOCTYPE html>
<%
 String TaxiId=session.getAttribute("TaxiId").toString();
    %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taxi Registration</title>
        
    </head>
    <body> 
        <form>
            <table>
                <tr>
                    <td>Vehicle Model:</td><td><input type="text" name="txt_vehiclemodel"></td>
                </tr>
                <tr><td>Vehicle type:</td><td><select name="Vtype" onchange="setrate(this.value)"><option>--select--</option>
                        <%
 ResultSet rv=obj.selectData("select * from tbl_vechicletype");
 while(rv.next())
 {
     %>
     <option value="<%=rv.getString("id")%>" ><%=rv.getString("type")%></option>
   
     
     <%
 }
 %>
                    </td></tr>
                <tr><td>Vehicle Insurance No:</td><td><input type="text" name="txt_VinsuNo"></td></tr>
                                <tr><td>Rent Per Km:</td><td id="ExamDutyGenerationDiv"><input type="text" name="txt_Rent" ></td></tr>
                               <tr><td>Vehicle Rate :</td><td ><input type="text" name="txt_vRent" ></td></tr>
                                <tr><td>Vehicle Year :</td><td ><input type="text" name="txt_vyear" ></td></tr>
                               
                
            </table>
            <input type="submit" name="btn_submit" value="submit">
            
        </form>
    
    <%
 if(request.getParameter("btn_submit")!=null)
 {
     obj.executeCommand("insert into tbl_vehicledetails (taxiid,vmodel,vinsurance,rentperkm,Vtype,Vrate,Vyear)"
             + "VALUES('"+TaxiId+"','"+request.getParameter("txt_vehiclemodel")+"','"+request.getParameter("txt_VinsuNo")+"','"+request.getParameter("txt_Rent")+"'"
             + ",'"+request.getParameter("Vtype")+"','"+request.getParameter("txt_vRent")+"','"+request.getParameter("txt_vyear")+"')");
     

response.sendRedirect("PicUploading.jsp");
 }
 %>
  <script src="jquery.min.js" type="text/javascript"></script>
 <script>
     function setrate(d)
     {
         alert(d);
           $.ajax({url:"ajaxB.jsp?id="+d, 
         success: function(result){
         alert(result);
      $("#ExamDutyGenerationDiv").html(result);
    }});
     }
 </script>
 <!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>
</html>
