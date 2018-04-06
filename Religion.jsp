<%-- 
    Document   : Religion
    Created on : 15 Aug, 2017, 2:45:55 PM
    Author     : basilscolu
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>
<!DOCTYPE html>
<%
    String ReligionName="",ReligionId="";
    if(request.getParameter("btn_submit")!=null)
    {
        String rname=request.getParameter("txt_religion");
        if(!request.getParameter("hiddenid").equals(""))
        {
            int rid=Integer.parseInt(request.getParameter("hiddenid"));
            obb.executeCommand("update tbl_religion set religion_name='"+rname+"' where religion_id='"+rid+"'");
        }
        else
        {
        obb.executeCommand("insert into tbl_religion(religion_name) values('"+rname+"')");
                }
        
    }
    if(request.getParameter("del")!=null)
    {
      int rid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_religion where religion_id='"+rid+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String rid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_religion where religion_id='"+rid1+"'");
       while(rs1.next())
       {
       ReligionName=rs1.getString("religion_name");
       ReligionId=rs1.getString("religion_id");
       
    }
    }
   %> 
<html>
    <head>
         <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css">
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Religion page</title>
    </head>
    <body>
       
        <form class="Malayali_campaignrightthree">
            
            <input type="hidden" name="hiddenid" value="<%=ReligionId%>">
            
            
          
           
            <div class="ReligionForm_details">
                <h1><label style="color: #ff0033">Religion Entry</label></h1>
                <table>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Religion</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_religion" placeholder="Enter Religion" class="regtxtbox" value="<%=ReligionName%>"></div></td>
                    </tr>
                    <tr><td></td><td><div class="Religion_innerregisterform_new" ><input type="submit" value="save" name="btn_submit" class="campaign_buttonnew">
                                  <input type="submit" value="Cancel" name="btn_cancel" class="campaign_buttonnew cancelbtn"> </div></td>
                </tr>
                </table>
                <!--table searching start here-->
                                      
                         
                
                 <div class="Religion_innerregisterform_table">
                                           <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

                     <table id="myTable" >
                            
                             <tr class="header" >
                              <th style="width:60%;">Profile</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_religion");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("religion_name") %>
                                </td>
                               
                                <td>
                                    <a href="Religion.jsp?edit=<%=rs.getString("religion_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="Religion.jsp?del=<%=rs.getString("religion_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
                                </td>
                                   
                            </tr>
                             
                            <% 
                             }
                            
                            %>  
                               
                        </table>
                </div>
                                        <!--table searching end here-->

            </div>
            
                     
        </form>
        

         
    </body>
    
</html>
