<%@page import="uk.ac.edukapp.renderer.WidgetRenderer"%>
<%@page import="uk.ac.edukapp.model.Widgetprofile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.wookie.connector.framework.*,
	uk.ac.edukapp.util.*,
	uk.ac.edukapp.model.Useraccount,java.util.*,
	javax.persistence.*,
	javax.persistence.EntityManager,
	javax.persistence.EntityManagerFactory,
	org.apache.commons.logging.Log,
	org.apache.commons.logging.LogFactory"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/layout.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css" />
<link rel="stylesheet" href="css/main.css" type="text/css" />
<link rel="stylesheet" href="css/index.css" type="text/css" />
<link rel="stylesheet" href="css/footer.css" type="text/css" />
<title>EDUKApp</title>
</head>
<body>

	<%
	  //--------------------------------
	  // deduce whether user is logged in
	  //--------------------------------
	  EntityManagerFactory emf = (EntityManagerFactory) getServletContext()
	      .getAttribute("emf");
	  boolean isAuthenticated = JspUtils.isAuthenticated(session, request, emf);
	  if (isAuthenticated) {
	%>
	<%@ include file="static/logged-in-as-box.jsp"%>
	<%
	  } else {
	%>
	<%@ include file="static/login-box.jsp"%>
	<%
	  }
	%>

	<%@ include file="static/header.html"%>
	<div id="page-wrapper">
		<div id="main-content-wrapper">
			<%@ include file="static/sidebar.jsp"%>

			<div id="main">
				<div id="first-row-boxes">
					<div id="intro-text">
						<h2>Edukapp</h2>
						<p>EDUkation UK wide App store</p>
						<div id="intro-text-container">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Nunc ac lacus dui, sit amet placerat
							enim. Integer euismod pulvinar velit id porta. Fusce varius nisl
							sit amet velit molestie nec commodo sem malesuada. Morbi orci mi,
							consequat ac bibendum non, porttitor eget nisl. Donec
							sollicitudin metus sit amet nibh sagittis dictum. Praesent
							porttitor bibendum quam a auctor. Proin blandit dictum faucibus.
							Sed purus urna, cursus quis blandit eget, consequat vitae nisl.
							Mauris id molestie nulla. In feugiat, odio in porta volutpat,
							ante magna ultricies diam, at iaculis est mauris congue mauris.
							Mauris eget turpis nec turpis tempor congue ac eget ligula.
							Phasellus ultricies interdum enim, tempor luctus augue posuere
							eget.</div>
					</div>
					<div id="intro-screencast">screencast</div>
					<div class="clear"></div>
				</div>
				<div id="widget-slider">
					<div id="widget-slider-left-btn">
						&lt;
						<div class="clear"></div>
					</div>
					<div id="widget-slider-container">
						<%
						  List<Widgetprofile> featuredWidgets = null;

						  EntityManager em = emf.createEntityManager();
						  Query q = em.createQuery("SELECT u " + "FROM Widgetprofile u "
						      + "WHERE u.featured=1");

						  Widgetprofile wid = null;

						  featuredWidgets = (List<Widgetprofile>) q.getResultList();
						  if (featuredWidgets != null) {
						    WidgetRenderer renderer = WidgetRenderer.getInstance();
						    for (Widgetprofile f : featuredWidgets) {
						      String html = renderer.render(f.getWidId()); 
						      if (html!=null) {
						        out.print(html);
						      }else {
						        out.print("html is null");
						      }
						    }						    
						  } else {
						    out.print("no featured widgets");
						  }
						%>

						<div class="widget-box">
							widget a
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget b
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget c
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget d
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget e
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget g
							<div class="clear"></div>
						</div>
						<div class="widget-box">
							widget h
							<div class="clear"></div>
						</div>

						<div class="clear"></div>
						<div id="widget-slider-control-buttons">o o o o</div>
					</div>

					<div id="widget-slider-right-btn">
						&gt;
						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end of page-wrapper -->

	<%@ include file="static/footer.html"%>


</body>
</html>