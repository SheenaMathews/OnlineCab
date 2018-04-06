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
 if(request.getParameter("btn_submit")!=null)
 {
     Random rand = new Random();
                                         int n = rand.nextInt(90000) + 10000;
                                         String TaxiId="Taxi"+n;
     Boolean  bb=obj.executeCommand("insert into tbl_taxireg (TaxiId,Name,City,VechicleNo,NoofSeats,ContactNo,OwnerName,Uname,Password ) "
             + "VALUES('"+TaxiId+"','"+request.getParameter("txt_taxiname")+"','"+request.getParameter("locationsel")+"','"+request.getParameter("txt_VechicleNo")+"','"+request.getParameter("txt_noofseats")+"','"+request.getParameter("txt_ContactNo")+"'"
             + ",'"+request.getParameter("txt_OwnerName")+"','"+request.getParameter("txt_Uname")+"','"+request.getParameter("txt_Password")+"')");
     if(bb)
     {
         obj.executeCommand("insert INTO tbl_taxiaproval (TaxiId) VALUES('"+TaxiId+"')");
          session.setAttribute("TaxiId",TaxiId);
         response.sendRedirect("vehicledetails.jsp");
     }
 }
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
                    <td>Taxi Name:</td><td><input type="text" name="txt_taxiname"></td>
                </tr>
                <tr><td>Location District/ City :</td><td>
                        <select  onchange="ajaxcall(this.value)">
                            <option>--select--</option>
                            <%
 ResultSet rLoc =obj.selectData("select * from tbl_district");
 while(rLoc.next())
 {
     %>
     <option value="<%=rLoc.getString("district_id")%>"><%=rLoc.getString("district")%></option>
     <%
 }
 
 %>
                        </select>
                        
                    </td></tr>
                
                <tr><td>Taxi Stand :</td><td>
                        <select id="ExamDutyGenerationDiv" name="locationsel">
                            <option>--select--</option>
                        </select>
                        
                    </td>
                <tr><td>No Of Seats:</td><td><input type="text" name="txt_noofseats"></td></tr>
                                <tr><td>vehicle No:</td><td><input type="text" name="txt_VechicleNo"></td></tr>
                                <tr><td>Contact No:</td><td><input type="text" name="txt_ContactNo"></td></tr>
                                <tr><td>Owner Name:</td><td><input type="text" name="txt_OwnerName"></td></tr>
                                 <tr><td>Choose Username :</td><td><input type="text" name="txt_Uname"></td></tr>
                                <tr><td>Choose Password: </td><td><input type="text" name="txt_Password"></td></tr>
                               
                
            </table>
            <input type="submit" name="btn_submit" value="submit">
            
        </form>
    
    <script src="jquery.min.js" type="text/javascript"></script>
    <script>
        function ajaxcall(d)
        {
           $.ajax({url:"ajaxA.jsp?id="+d, 
         success: function(result){
         //alert(result);
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
