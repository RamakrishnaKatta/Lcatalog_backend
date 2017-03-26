<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Super Admin Management</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
          <!-- ADD SUPER-ADMIN MODAL -->
           <div class="modal fade bs-example-modal-lg" id="registerModal">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b>Create SuperAdmin</b></h4>
                     </div>
                    <div class="modal-body">
                         
                           <div class="row"> 
                           <!--  <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Id:</label>
                               <input type="text" class="form-control" id="id">
                              </div>
                            </div> -->
                           <!--  <div class="col-md-12">
                              <div class="form-group">
                               <label for="name">Login-Id:</label>
                               <input type="text" class="form-control" id="loginId">
                              </div>
                            </div> -->
                          </div>
                            <div class="row">  
                            <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">First Name:</label>
                               <input type="text" class="form-control" id="firstName">
                              </div>
                            </div>

                             <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Last Name:</label>
                               <input type="text" class="form-control" id="lastName">
                              </div>
                            </div>
                            </div>
                           <div class="row">
                            <!--  <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Password:</label>
                               <input type="password" class="form-control" id="password">
                              </div>
                            </div>
                            
                            <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Re-Enter Password:</label>
                               <input type="password" class="form-control" id="re-enter-password">
                              </div>
                            </div>	 -->
                           
                             <!-- <div class="col-md-12">
                              <div class="form-group">
                               <label for="name">Roles:</label>
                               <input type="text" class="form-control" id="roles">
                              </div>
                            </div> -->
                            
                            <div class="col-md-12">
                              <div class="form-group">
                               <label for="name">Roles:</label><br>
                               <select class="form-control" required="" id="multiVal"  data-msg="Select Roles" multiple="multiple" name="roleId">
        
                               </select>
                              </div>
                            </div> 
                            
                            
                            
                            
                            </div>
                           
                           
                     </div>
                          
                         
                     </div>
                     <div class="modal-footer">
                        <div type="button" class="btn btn-sm btn-info add">Register</div>
                     </div>
                  </div>
               </div>
           
       
        
        
        
           <div class="row">
            <div class="col-md-12">
              <div class="box box-info main_box">
                <div class=" tableSection sectionBgWhite">
                  <h3 class="box-title">Super Admin User's</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add Super Admin</button>                   <!--  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div><!-- /.box-header -->
                <div class=" tableSection sectionBgWhite">
                
                    <table id="superAdminTable" class="stripe table table-bordered table-striped" ></table>
                </div>
                  
                </div><!-- /.box-body -->
               
              </div>
            </div>
        </section>
        </div>
    </div>
    
     <!-- Loader -->
    <div class="fader">
       <div class="loader"></div>
    </div>
</body>
</html>
<script type="text/javascript"
  src="<c:url value="/resources/js/utils.js" />"></script>
<script type="text/javascript"
  src="<c:url value="/resources/js/superadmin_mgt.js" />"></script>