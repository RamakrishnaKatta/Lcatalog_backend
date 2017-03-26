<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LLL-Users</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
        <!-- ADD MODAL -->
           <div class="modal fade bs-example-modal-lg" id="myModal" >
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b class="headerText">Add User</b></h4>
                     </div>
                     <div class="modal-body">
                        
                        <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Name :</label>
                            <input type="text" class="form-control" id="name">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Role :</label>
                            <select class="form-control" id="sel1">
							<option>Role</option>
							<option>Admin</option>
							</select>
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Type :</label>
                            <input type="text" class="form-control" id="type">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Phone Number :</label>
                            <input type="text" class="form-control" id="phNo">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Vendor :</label>
                            <select class="form-control" id="sel1">
							<option>Shopper Stop</option>
							<option>Home Stop</option>
							</select>
                            </div>
                            </div>
                         </div>
                          <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Other details :</label>
                            <input type="text" class="form-control" id="otherDetails">
                            </div>
                            </div>
                         </div>
                             
                     </div>
                     <div class="modal-footer">
                        <div type="button" class="btn btn-sm btn-info add">Add</div>
                        <div type="button" class="btn btn-sm btn-info edit">Edit</div>
                     </div>
                  </div>
               </div></div>
        
          
               
           <div style="padding:7px !important"></div>     
           
         <div class="row" style="margin:0px !important;"> 
                  <div class="box  panel box box-info accessPermission" style="box-shadow: 0px 2px 10px #868282;">
                      <div class="box-header" data-widget="collapse-header">
                          <h2 class="box-title"><b>Users Search Filter</b></h2>
                          <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                          </div>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                         <form id="create_role_form" name="create_role_form">
                         
                           <div class="row">
                              <div class="col-md-6">
                              <div class="form-group">
                              <h5 class="box-title">Vendor</h5>
							  <select class="form-control" id="sel1">
							  <option>Shopper Stop</option>
							  <option>Home Stop</option>
							  </select>
							  </div>
                              </div>
                             
                              <div class="col-md-6">
                              <div class="form-group">
                              <h5 class="box-title">Role</h5>
							  <select class="form-control" id="sel1">
							  <option>USER</option>
							  <option>ADMIN</option>
							  </select>
							  </div>
                              </div>
                              
                              <!-- <div class="col-md-4">
                              <div class="form-group">
                              <h5 class="box-title"></h5>
                              <input type="text" class="form-control" id="role_name" required data-msg="Please Enter Location">
                              </div>
                              </div> -->
                             
                           </div> 
                            <div class="form-group float-right" style="margin-right: 14px;">
                            <input type="submit" class="btn btn-info" id="deleteSubmit" value="Search"/>
                            </div>
                        </form>
                      </div><!-- /.box-body -->
              </div><!-- /.box -->
          </div>
           
           <div style="padding:7px !important"></div>
          
           <div class="row">
            <div class="col-md-12">
              <div class="box box-info main_box">
                <div class=" tableSection sectionBgWhite">
                  <h3 class="box-title">Users</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add User</button>                 
                        <!--  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div><!-- /.box-header -->
                <div class=" tableSection sectionBgWhite">
                
                    <table id="myTable" class="stripe table table-bordered table-striped" ></table>
                </div>
                  
                </div><!-- /.box-body -->
               
              </div>
            </div>
        </section>
        </div>
    
    
     <!-- Loader -->
    <div class="fader">
       <div class="loader"></div>
    </div>
</body>
</html>

<script type="text/javascript"
  src="<c:url value="/resources/js/users.js" />"></script>
<script type="text/javascript"
  src="<c:url value="/resources/js/utils.js" />"></script>
    
  
  