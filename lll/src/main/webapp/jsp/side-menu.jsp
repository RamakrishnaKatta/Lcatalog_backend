<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<aside class="main-sidebar">


  <section class="sidebar" style="height: auto;">
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
    <br>
      <li class="treeview">
        <a href="${host}/dashboard">
          <i class="glyphicon glyphicon-equalizer"></i>
          <span>Statistics</span>
        </a>
      </li>
       
       <li class="treeview">
        <a href="#">
          <i class="glyphicon glyphicon-king"></i>
          <span>Vendor Management</span>
        </a>
        
       
         <ul class="treeview-menu">
            <li>
              <a href="${host}/vendors">
                <i class="glyphicon glyphicon-record"></i>
                Vendors
              </a>
            </li>
        </ul> 
       
      </li>
      
      <li class="treeview">
        <a href="#">
          <i class="glyphicon glyphicon-user"></i>
          <span>User Management</span>
        </a>
        
       
         <ul class="treeview-menu">
            <li>
              <a href="${host}/users">
                <i class="glyphicon glyphicon-record"></i>
                Users
              </a>
            </li>
        </ul> 
       
      </li>     
      
      <li class="treeview">
        <a href="#">
          <i class="glyphicon glyphicon-text-color"></i>
          <span>Article Management</span>
        </a>
         <ul class="treeview-menu">
            <li>
              <a href="${host}/articles">
                <i class="glyphicon glyphicon-record"></i>
                Articles
              </a>
            </li>
        </ul> 
      </li>
      
      <li class="treeview">
        <a href="#">
          <i class="glyphicon glyphicon-question-sign"></i>
          <span>About Us</span>
        </a>
      </li>
     
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>


