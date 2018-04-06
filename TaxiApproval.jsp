<%-- 
    Document   : UserFeedBack
    Created on : 17 Mar, 2018, 8:21:53 PM
    Author     : basilscolu
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taxi Approval</title>
    </head>
    <body>
        <h1>Taxi Approval</h1>
        <table>
            <%
                ResultSet rsa=obj.selectData("select * from tbl_taxiaproval tb,tbl_taxireg reg,tbl_taxiimages ti where tb.Approval='N' and reg.TaxiId=tb.TaxiId and ti.TaxiId=tb.TaxiId");
                while(rsa.next())
                {
                    %>
                    <tr>
                          <td>Taxi name :<%=rsa.getString("Name")%><br>
                            Owner Name :<%=rsa.getString("OwnerName")%><br>
                            Vechicle No :<%=rsa.getString("VechicleNo")%><br>
                            <br>
                      </td>
                        <td>
                            <img style="width: 100%;height: 400px" src="../Taxi/TaxiImages/<%=rsa.getString("Imagename")%>">
                        </td>
                         <td>
                         <td><a href="TaxiApproval.jsp?acc=<%=rsa.getString("TaxiId")%>"><input type="button" value="Accept"></a></td>
                         <td><a href="TaxiApproval.jsp?rej=<%=rsa.getString("TaxiId")%>"><input type="button" value="Reject"></a></td>
                       
                    </tr>
                    
                    <%
                }
                
                %>
        </table>
    </body>
    <%
 if(request.getParameter("acc")!=null)
 {
     obj.executeCommand("update tbl_taxiaproval ap set ap.Approval='Y' where ap.TaxiId='"+request.getParameter("acc")+"'");
 }
 if(request.getParameter("rej")!=null)
 {
   obj.executeCommand("update tbl_taxiaproval ap set ap.Approval='N' where ap.TaxiId='"+request.getParameter("acc")+"'");
 }
     %>
</html>
