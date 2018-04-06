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
    String StateName="",stateId="",country_id="";
    if(request.getParameter("btn_submit")!=null)
    {
        String cname=request.getParameter("txt_state");
        String countryid=request.getParameter("selCountry");
        if(!request.getParameter("hiddenid").equals(""))
        {
            
            
           int sid=Integer.parseInt(request.getParameter("hiddenid"));
          
           String qq="update tbl_district set district='"+cname+"' where district_id="+sid;
           obb.executeCommand(qq);
      }
        else
       {
        
        obb.executeCommand("insert into tbl_district(district) values('"+cname+"')");
          }
        
    }
    if(request.getParameter("del")!=null)
    {
      int sid2=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_district where district_id='"+sid2+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String sid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_district where district_id='"+sid1+"'");
       while(rs1.next())
       {
       StateName=rs1.getString("district");
       stateId=rs1.getString("district_id");
    
       
    }
    }
   %> 
<html>
    <head>
         <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css">
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <title>District</title>
    </head>
    <body>
       
        <form >
            
            <input type="hidden" name="hiddenid" value="<%=stateId%>">
            
            
          
           
            <div >
                <h1 ><label style="color: #ff0033">District/City Entry</label></h1>
                <table>
                    
                    <tr>
                        <td><div  ><label >District/City</label></div></td><td><div ><input type="text" name="txt_state" placeholder="Enter District/City" class="regtxtbox" value="<%=StateName%>"></div></td>
                    </tr>
                    <tr><td></td><td><div  ><input type="submit" value="save" name="btn_submit" >
                                  <input type="submit" value="Cancel" name="btn_cancel" > </div></td>
                </tr>
                </table>
                <!--table searching start here-->
                       
               
                         
                
                 <div class="Religion_innerregisterform_table">
                     <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                                          <table id="myTable" >
                            
                             <tr class="header" >
                              <th style="width:60%;">District / City</th>
                            
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs1=obb.selectData("select * from tbl_district ");
                             while(rs1.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <b> <%=rs1.getString("district") %></b>
                                </td>
                              
                                <td>
                                    <a href="District.jsp?edit=<%=rs1.getString("district_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="District.jsp?del=<%=rs1.getString("district_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
         <div class="bengali_campaigntopernew"></div>
                         <div class="bengali_campaignbottom"></div> 

         
    </body>
    <!--script--->
    <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    
</html>
