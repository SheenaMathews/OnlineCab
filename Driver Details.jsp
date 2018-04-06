<%-- 
    Document   : Exam Duty Assign
    Created on : 9 Feb, 2018, 5:53:56 PM
    Author     : basilscolu
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
<%
 String TaxiId=session.getAttribute("TaxiId").toString();
    %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver Details</title>
        
    </head>
    <body> 
       <form action="FileUploadAction1.jsp" enctype="multipart/form-data" method="post">
            <table>
                <tr>
                    <td>Name :</td><td><input type="text" name="txt_name"></td>
                </tr>
                <tr><td>Address :</td><td><textarea name="txt_address"></textarea>
                      
                    </td></tr>
                <tr><td>Dob :</td><td><input type="date" name="txt_dob">
                      
                    </td></tr>
                <tr><td>Age:</td><td><input type="text" name="txt_age"></td></tr>
                                <tr><td>Gender :</td><td ><div > <input type="radio" name="gender" id="radioGender1" value="male" required="" ><label for="radioGender1" class="regcheck" style="margin-right:20px ">male </label>
                                    <input type="radio" name="gender" value="female" id="radioGender2" required=""><label for="radioGender2" class="regcheck">female</label></div></td>
                             </tr>
                                     <tr><td>Religion :</td><td >
                                   
                                             <select name="religion" ><option>--select--</option>
                        <%
 ResultSet rv=obj.selectData("select * from tbl_religion");
 while(rv.next())
 {
     %>
     <option value="<%=rv.getString("religion_id")%>" ><%=rv.getString("religion_name")%></option>
   
     
     <%
 }
 %>
                                             </select>
                                 </td></tr>
                                <tr><td>Blood Group :</td><td ><input type="text" name="txt_Bgroup" ></td></tr>
                                <tr><td>License Scanned Image :</td><td ><input type="file" name="txt_Bgroup" ></td></tr>
                               
                
            </table>
            <input type="submit" name="btn_submit" value="submit">
            
        </form>
    </body>
  
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
 </div>		
        
                                               
				
	
	     <script src="jquery.min.js" type="text/javascript"></script>
    <script>
    function selectTaxi(d)
    {
         $.ajax({url:"ajaxselecttaxi.jsp?loc="+d, 
         success: function(result){
         alert(result);
      $("#taxiResult").html(result);
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



