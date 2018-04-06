<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%
 
    if(request.getParameter("btn_submit")!=null)
    {
          Random rand = new Random();
                                         int n = rand.nextInt(90000) + 10000;
                                         String UId="User"+n;
                                         
     Boolean  bb=obj.executeCommand("insert into tbl_user (userId,name,Address,contactno,location,Upassword)  "
             + "VALUES('"+UId+"','"+request.getParameter("txt_name")+"','"+request.getParameter("txt_add")+"','"+request.getParameter("txtContactno")+"','"+request.getParameter("locationsel")+"'"
             + ",'"+request.getParameter("txtpassword")+"')");
    
       if(bb)
       {
           session.setAttribute("UId",UId);
           response.sendRedirect("Homepage.jsp");
       }
    }
    
    %>

<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Ilahia Exam Cell</title>
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
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="index.html">Online Cab <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover"  role="banner" style="background-image: url(images/11aa4b40a7e0f41c480a5b8527d83d7c.jpg);height:1200px; ">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					

					<div class="row row-mt-15em">
                                            <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp" style="width: 50%">
							<span class="intro-text-small">Online Cab.</span>
							<h1>Were Are You Go,<br> We are There.</h1>	
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight " style="width: 50%">
							<div class="form-wrap">
								<div class="tab">
									<ul class="tab-menu">
										<li class="active gtco-first" style="width: 100%;"><a href="#" data-tab="signup">Register</a></li>
					
									</ul>
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<form action="#">
												<div class="row form-group">
													<div class="col-md-12">
                                                                                                            <span><label for="username">Username </label>
                                                                                                                <input type="text" class="form-control" id="username" style="width: 80%"  name="txt_name"></span>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">Location Living</label>
                                                                                                                <select name="locationsel" class="form-control" id="password" style="width: 80%">
                            <option>--select--</option>
                            <option value="1">Kochi</option>
                              <option value="2">Perumbavoor</option>
                                <option value="3">Kothamangalam</option>
                                  <option value="4">Muvattupuzha</option>
                        </select>
														
													</div>
												</div>
                                                                                            <div class="row form-group">
													<div class="col-md-12">
														<label for="password">Address :</label>
                                                                                                                <textarea  class="form-control" id="password" style="width: 80%" name="txt_add"></textarea>
													</div>
												</div>
                                                                                            <div class="row form-group">
													<div class="col-md-12">
														<label for="password">Contact No</label>
                                                                                                                <input type="text" name="txtContactno" class="form-control" id="password" style="width: 80%">
													</div>
												</div>
                                                                                            <div class="row form-group">
													<div class="col-md-12">
														<label for="password">Password</label>
														<input type="password" class="form-control" name="txtpassword" id="password" style="width: 80%">
													</div>
												</div>
                                                                                            <div class="row form-group">
													<div class="col-md-12">
														<label for="password">Re Enter Password</label>
                                                                                                                <input type="text" class="form-control" id="password" name="txt_OwnerName" style="width: 80%">
													</div>
												</div>
												<div class="row form-group">
													
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" name="btn_submit" class="btn btn-primary" value="Save">
													</div>
												</div>
											</form>	
										</div>

										
	
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

