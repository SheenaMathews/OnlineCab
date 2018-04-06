<!DOCTYPE HTML>

<%
     String UId=session.getAttribute("UId").toString();
      String Tid=request.getParameter("id");
          
    
    
    %>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Online Cab.</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
	
	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
            <form>	
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
                                    <div id="gtco-logo"><a href="Homepage.jsp">Online Cab <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
                                            <li><a href="taxi Search.jsp">Taxi Search</a></li>
                                            <li><a href="TravellingHistory.jsp">Travelling History</a></li>
						
                                            <li class="active"><a href="feedback.jsp">Feed Back</a></li>
						<li><a href="contact.html">Contact</a></li>
						<li class="btn-cta"><a href="#"><span>Get started</span></a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/img_6.jpg);margin-top:0px;">
		
            <div style="margin-top: 200px;margin-left: 30px;">	  
                
        <table>
              <tr>
    <%
      ResultSet rsa=obj.selectData("select * from tbl_booking tb,tbl_taxireg tx, tbl_taxiimages ti where tb.userId='"+UId+"' and tb.AcceOrRej='accept' and tb.TaxiId=tx.TaxiId and ti.TaxiId=tb.TaxiId order by tb.Date desc");
      while(rsa.next())
      {
          %>
        
              <td>
                  <img style="width: 100%;height: 100%" src="../Taxi/TaxiImages/<%=rsa.getString("Imagename")%>">
              <br>Owner :<%= rsa.getString("Name") %>
              
              <br>Vehicle No<%=rsa.getString("VechicleNo")+" Contact No: "+rsa.getString("ContactNo") %>
              <br> Destination<%=rsa.getString("destination")+" Date :"+rsa.getString("Date") %>
              <a href="TaxiFeedBack.jsp?id=<%=rsa.getString("TaxiId")%>">Give Your FeedBack </a>
              </td>
              
              
              
       
          
          <%
          
      }
    ResultSet rs= obj.selectData(" select count(*) from tbl_booking tb,tbl_taxireg tx, tbl_taxiimages ti where tb.userId='"+UId+"' and tb.AcceOrRej='accept' and tb.TaxiId=tx.TaxiId and ti.TaxiId=tb.TaxiId order by tb.Date desc");
    while(rs.next())
    {
        if(rs.getString("count(*)").equals("0"))
        {
            %>
            
              <label>There Is No Travelling History!</label> 
            <%
        }
    }
      %>
         </tr> 
        </table>
        
            </div>		</div>
						
					</div>
                                               
				
	</header>
	
	
        </form>
	     <script src="jquery.min.js" type="text/javascript"></script>
   
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

