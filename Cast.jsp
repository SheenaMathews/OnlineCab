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
    String CastName="",CastId="",relid="";
    if(request.getParameter("btn_submit")!=null)
    {
        String cname=request.getParameter("txt_cast");
        String rid=request.getParameter("selRel");
        if(!request.getParameter("hiddenid").equals(""))
        {
            
            
           int cid=Integer.parseInt(request.getParameter("hiddenid"));
           
           String qq="update tbl_cast set cast_name='"+cname+"'  where cast_id="+cid;
          
           obb.executeCommand(qq);
           obb.executeCommand("update tbl_cast set religion_id='"+rid+"' where cast_id='"+cid+"'");
           
      }
        else
       {
        
        obb.executeCommand("insert into tbl_cast(religion_id,cast_name) values('"+rid+"','"+cname+"')");
          }
        
    }
    if(request.getParameter("del")!=null)
    {
      int cid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_cast where cast_id='"+cid+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String cid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_cast where cast_id='"+cid1+"'");
       while(rs1.next())
       {
       CastName=rs1.getString("cast_name");
       CastId=rs1.getString("cast_id");
       relid=rs1.getString("religion_id");
       
    }
    }
   %> 
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Religion page</title>
    </head>
    <body>
       
        <form class="Malayali_campaignrightthree" >
            
            <input type="hidden" name="hiddenid" value="<%=CastId%>">
            
            
          
            <div class="ReligionForm_details">
                <h1><label style="color: #ff0033">Cast Entry</label></h1>
                <table>
                    <tr>
                        <td>
                              <div class="Religion_innerregisterform_new" ><label class="religionlabel">Religion</label></div>
                        </td>
                       
                        <td><div class="Religion_innerregisterform_new"><select name="selRel" class="regtxtbox" ><option>--selected--</option>
                            
                                     <%
                       ResultSet rs=obb.selectData("select * from tbl_religion");
                       while(rs.next())
                       {
                        %>
                        <option value="<%=rs.getString("religion_id")%>"  <%if(rs.getString("religion_id").equals(relid)){%> selected="true" <% } %> ><%=rs.getString("religion_name")%></option>
                                <%
                                    }
                                    %> </select></div>
                                    </td>
                                   
                    </tr>
                
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Cast</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_cast" placeholder="Enter Cast" class="regtxtbox" value="<%=CastName%>"></div></td>
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
                              <th style="width:60%;">Cast</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs1=obb.selectData("select * from tbl_religion r, tbl_cast c where r.religion_id=c.religion_id order by c.religion_id asc");
                             while(rs1.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <b> <%=rs1.getString("religion_name") %></b>
                                </td>
                               <td>
                                   <b> <%=rs1.getString("cast_name") %></b>
                               </td>
                                <td>
                                    <a href="Cast.jsp?edit=<%=rs1.getString("cast_id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="Cast.jsp?del=<%=rs1.getString("cast_id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
