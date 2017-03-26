<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Location Management</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
          <!-- ADD LOCATION MODAL -->
           <div class="modal fade bs-example-modal-lg" id="registerModal">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b>Create Location</b></h4>
                     </div>
                    <div class="modal-body">
                         
                           
                            <div class="row">  
                            <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">N:</label>
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
                           <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Phone Number:</label>
                               <input type="text" class="form-control" id="phone">
                              </div>
                            </div> 
                           <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Email-Id:</label>
                               <input type="text" class="form-control" id="emailId">
                              </div>
                            </div> 
                          </div>
                            
                           <div class="row">
                             <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Gender:</label>
                               <input type="text" class="form-control" id="gender">
                              </div>
                            </div>
                            
                            <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Blood Group:</label>
                               <input type="text" class="form-control" id="bloodGroup">
                              </div>
                            </div>
                            
                             <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Society Master:</label>
                               <input type="text" class="form-control" id="societyMaster">
                              </div>
                            </div>
                             <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Roles:</label>
                               <input type="text" class="form-control" id="roles">
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
                  <h3 class="box-title">Society User's</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add Society User</button>                   <!--  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div><!-- /.box-header -->
                <div class=" tableSection sectionBgWhite">
                
                    <table id="societyUsersTable" class="stripe table table-bordered table-striped" ></table>
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
  src="<c:url value="/resources/js/usr_mgt.js" />"></script>