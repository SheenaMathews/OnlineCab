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
    String Vname="",Vid="",Vrate="";
    if(request.getParameter("btn_submit")!=null)
    {
        String cname=request.getParameter("txt_state");
      
        if(!request.getParameter("hiddenid").equals(""))
        {
            
            
           int sid=Integer.parseInt(request.getParameter("hiddenid"));
           
          String qq="update tbl_vechicleType set type='"+cname+"'   where id="+sid;
          obb.executeCommand(qq);
          obb.executeCommand("update tbl_vechicleType set rate='"+request.getParameter("txt_rate")+"' where id='"+sid+"'");
      }
        
        else
       {
        
        obb.executeCommand("insert into tbl_vechicleType(type,rate) values('"+cname+"','"+request.getParameter("txt_rate")+"')");
          }
        
    }
    if(request.getParameter("del")!=null)
    {
      int sid2=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_vechicleType where id='"+sid2+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String sid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_vechicleType where id='"+sid1+"'");
       while(rs1.next())
       {
       Vname=rs1.getString("type");
       Vid=rs1.getString("id");
      Vrate=rs1.getString("rate");
    }
    }
   %> 
<html>
    <head>
         <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css">
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <title>Vechicle Type</title>
    </head>
    <body>
       
        <form >
            
            <input type="hidden" name="hiddenid" value="<%=Vid%>">
            
            
          
           
            <div >
                <h1><label style="color: #ff0033">Vehicle Type Entry</label></h1>
                <table>
                   
                
                    <tr>
                        <td><div  ><label >Vehicle Type</label></div></td><td><div><input type="text" name="txt_state" placeholder="Enter Vehicle Type"  value="<%=Vname%>"></div></td>
                    </tr>
                      <tr>
                        <td><div  ><label >Rate Per Km</label></div></td><td><div><input type="text" name="txt_rate" placeholder="Enter rate"  value="<%=Vrate%>"></div></td>
                    </tr>
                    <tr><td></td><td><div  ><input type="submit" value="save" name="btn_submit">
                                  <input type="submit" value="Cancel" name="btn_cancel" > </div></td>
                </tr>
                </table>
                <!--table searching start here-->
                       
               
                         
                
                 
                     <table id="myTable" style="width: 600px;" >
                             <tr >
                                 <td colspan="3"  > <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                                 </td>        
                             </tr>
                             <tr  > 
                             
                              <th >Vehicle Type</th>
                              <th >Rate</th>
                                <th>Edit</th>
                               <th >Delete</th>
                             </tr>
                             <% ResultSet rs1=obb.selectData("select * from tbl_vechicleType ");
                             while(rs1.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs1.getString("type") %>
                                </td>
                                <td>
                                    <%=rs1.getString("rate") %>
                                </td>
                              
                                <td>
                                    <a href="VechicleType.jsp?edit=<%=rs1.getString("id")%>"><input type="button"  value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="VechicleType.jsp?del=<%=rs1.getString("id")%>"><input type="button"  value="delete"></a>
                                </td>
                                   
                            </tr>
                             
                            <% 
                             }
                            
                            %>  
                               
                        </table>
             
                                        <!--table searching end here-->

            </div>
            
                     
        </form>
        

         
    </body>
    
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
