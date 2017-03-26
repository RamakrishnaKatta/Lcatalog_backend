<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta
         content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
         name='viewport'>
      <title>Header</title>
      <link
         href="<c:url value='/resources/theme/bootstrap/css/bootstrap.min.css' />"
         rel="stylesheet" type="text/css" />
       
      <link href="
      <c:url value="/resources/theme/css/AdminLTE.min.css" />
      "
      rel="stylesheet" type="text/css" />
      <link
      href="
      <c:url value="/resources/theme/css/skins/skin-blue.css" />
      "
      rel="stylesheet" type="text/css" />
      <link
      href="
      <c:url value="/resources/theme/css/font-awesome.min.css" />
      "
      rel="stylesheet" type="text/css" />
      <link
      href="
      <c:url value="/resources/theme/plugins/fullcalendar/fullcalendar.min.css" />
      "
      rel="stylesheet" type="text/css" />
      <link type="text/css" rel="stylesheet"
      href="
      <c:url value="/resources/css/common.css" />
      " />
      <link
      href="
      <c:url value="/resources/theme/plugins/datatables/datatables.css" />
      "
      rel="stylesheet" type="text/css" />
      <script type="text/javascript"
      src="
      <c:url value="/resources/js/jquery-2.1.1.min.js" />
      "></script>
    
     
      <script type="text/javascript"
      src="
      <c:url value="/resources/theme/bootstrap/js/bootstrap.min.js" />
      "></script>
      
    
      <script type="text/javascript"
      src="
      <c:url value="/resources/theme/js/app.js" />
      "></script>
     
      <script type="text/javascript"
      src="
      <c:url value="/resources/theme/plugins/datatables/datatables.js" />
      "></script>
      <!--  <script type="text/javascript"
      src="
      <c:url value="/resources/theme/plugins/fullcalendar/lib/moment.min.js" />
      "></script> -->
      <script type="text/javascript"
      src="
      <c:url value="/resources/theme/plugins/fullcalendar/lib/moment.min.js" />
      "></script>
      <script type="text/javascript"
      src="
      <c:url value="/resources/theme/plugins/fullcalendar/fullcalendar.min.js" />
      "></script>
      <!-- DateTime Picker -->
      <script type="text/javascript"
      src="
      <c:url value="/resources/js/jquery.datetimepicker.js" />
      "></script>
        <link
         href="<c:url value="/resources/css/jquery.datetimepicker.css" />"
         rel="stylesheet" type="text/css" /> 
      </head>
   <body class="sidebar-mini skin-blue" style="position:relative;">
      <c:set var="host" value="${pageContext.request.contextPath}"></c:set>
      <header class="main-header">
         <a href="/bind/dashboard" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">
            <b>LLL</b>
            </span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">
            <b>Lucid Lean Labs</b>
            </span>
         </a>
         <!-- Header Navbar: style can be found in header.less -->
         <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
               role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </a>
            <div class="navbar-custom-menu">
               <ul class="nav navbar-nav">
                 <li class="dropdown user user-menu">
                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
              <img src="<c:url value="/resources/role.png" />"
               class="user-image" alt="User Image" /> 
               <span class="hidden-xs" id="agent-emailId-txt">Admin</span>
               </a>
               <ul class="dropdown-menu">
             <li class="user-header">
               <img src="<c:url value="/resources/role.png" />"
                class="img-circle" alt="User Image"> 
                <p id="agent-role-txt"><sec:authentication property="principal.username"/>
                <sec:authentication property="principal.authorities"/>
                </p>
               </li>
             <!-- Menu Body -->
             <li class="user-body">
               <div class="row">
                  <div class="col-xs-4 text-center">
                   <a href="#"></a>
                 </div>
                 <div class="col-xs-4 text-center">
                   <a href="#"></a>
                 </div> 
               </div>
               </li>
            <!-- Menu Footer-->
             <li class="user-footer">
               <div class="pull-left">
                 <input type="submit" value="Profile" />
               </div>
               <div class="pull-right">
            
                    <c:url var="logoutUrl"  value="/logout"/>
					<form action="${logoutUrl}" method="post">
					<input type="submit" value="Log out" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				    </div>
              </li>
               </ul>
               </li> 
            <!-- Control Sidebar Toggle Button -->
            <!-- <li>
               <a href="#" data-toggle="control-sidebar">
                 <i class="fa fa-gears"></i>
               </a>
               </li>-->
               </ul> 
            </div>
         </nav>
      </header>
   </body>
</html>
<script type="text/javascript">
  Date.prototype.customFormat = function(formatString) {
    var YYYY, YY, MMMM, MMM, MM, M, DDDD, DDD, DD, D, hhhh, hhh, hh, h, mm, m, ss, s, ampm, AMPM, dMod, th;
    YY = ((YYYY = this.getFullYear()) + "").slice(-2);
    MM = (M = this.getMonth() + 1) < 10 ? ('0' + M) : M;
    MMM = (MMMM = [ "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November",
      "December" ][M - 1]).substring(0, 3);
    DD = (D = this.getDate()) < 10 ? ('0' + D) : D;
    DDD = (DDDD = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
      "Friday", "Saturday" ][this.getDay()]).substring(0, 3);
    th = (D >= 10 && D <= 20) ? 'th' : ((dMod = D % 10) == 1) ? 'st'
    : (dMod == 2) ? 'nd' : (dMod == 3) ? 'rd' : 'th';
    formatString = formatString.replace("#YYYY#", YYYY).replace("#YY#", YY)
    .replace("#MMMM#", MMMM).replace("#MMM#", MMM).replace("#MM#",
      MM).replace("#M#", M).replace("#DDDD#", DDDD).replace(
      "#DDD#", DDD).replace("#DD#", DD).replace("#D#", D)
      .replace("#th#", th);
      h = (hhh = this.getHours());
      if (h == 0)
       h = 24;
     if (h > 12)
       h -= 12;
     hh = h < 10 ? ('0' + h) : h;
     hhhh = hhh < 10 ? ('0' + hhh) : hhh;
     AMPM = (ampm = hhh < 12 ? 'am' : 'pm').toUpperCase();
     mm = (m = this.getMinutes()) < 10 ? ('0' + m) : m;
     ss = (s = this.getSeconds()) < 10 ? ('0' + s) : s;
     return formatString.replace("#hhhh#", hhhh).replace("#hhh#", hhh)
     .replace("#hh#", hh).replace("#h#", h).replace("#mm#", mm)
     .replace("#m#", m).replace("#ss#", ss).replace("#s#", s)
     .replace("#ampm#", ampm).replace("#AMPM#", AMPM);
   };
 </script>
<script type="text/javascript">
  /*  $(function(){
    var action = window.location.pathname;
   
     // If there's no action, highlight the first menu item
     if (action == "") {
       $('ul.nav li:first').addClass('active');
     } else {
         // Highlight current menu
         $('.sidebar-menu li a[href="' + action + '"]').parent().addClass('active');
   
         // Highlight parent menu item
         $('.sidebar-menu li a[href="' + action + '"]').parents('li').addClass('active');
       }
   
     }) */
  
</script>