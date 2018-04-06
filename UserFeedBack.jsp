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
        <title>User Feed Back</title>
    </head>
    <body>
        <h1>User Feed Back</h1>
        <table>
            <%
                ResultSet rsa=obj.selectData("select * from tbl_feedback fd,tbl_user us where fd.userId=us.userId  order by Fdate desc");
                while(rsa.next())
                {
                    %>
                    <tr>
                        <td><%=rsa.getString("name")%></td>
                        <td><label><%=rsa.getString("feedback")%></label></td>
                        <td><%=rsa.getString("Fdate")%></td>
                    </tr>
                    
                    <%
                }
                
                %>
        </table>
    </body>
</html>
