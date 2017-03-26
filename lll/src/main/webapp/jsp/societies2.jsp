<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vendors</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
          <!-- ADD SOCIETIES MODAL -->
           <div class="modal fade bs-example-modal-lg" id="registerModal" >
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b class="headerText">Add Vendor</b></h4>
                     </div>
                     <div class="modal-body">
                        
                            <div class="row">  
                            <div class="col-md-4">
                              <div class="form-group">
								  <label>Society Name</label>
								   <input type="email" class="form-control" id="societyName">
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
								   <label>Society Nick Name</label>
								   <input type="email" class="form-control" id="societyNickName">
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
                               <label>Select Locality</label>
								  <select class="form-control" id="residenceType">
								  <option value="101">Community</option>
								  <option value="102">Appartment</option>
								  </select>
						       </div>
                            </div>
                           </div>
                            
                            <div class="row">  
                            <div class="col-md-4">
                              <div class="form-group">
								  <label>Society Url</label>
								   <input type="text" class="form-control" id="societyUrl">
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
								   <label>Society Image Path</label>
								   <input type="text" class="form-control" id="societyImagePath">
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
                               <label>Select Status</label>
								  <select class="form-control" id="societyStatus">
								  <option value="101">Active</option>
								  <option value="102">InActive</option>
								  </select>
						       </div>
                            </div>
                            </div>
                            
                            
                            
                        
                        
                            <div class="row">  
                            <div class="col-md-4">
                              <div class="form-group">
								  <label>Select State</label>
								  <select class="form-control" id="select_state">
								  </select>
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
								  <label>Select City</label>
								  <select class="form-control" id="select_city">
								  </select>
								</div>
                            </div>
                            
                            <div class="col-md-4">
                              <div class="form-group">
                               <label>Select Locality</label>
								  <select class="form-control" id="select_locality">
								  </select>
						       </div>
                            </div>
                            </div>
                            
                            <div class="row">
                            
                            <div class="col-md-4">
                              <div class="form-group">
                               <label for="name">Enter Sub-Locality Name:</label>
                               <select class="form-control" id="sub_locality">
								  </select>
                              </div>
                            </div>
                           
                            <div class="col-md-4">
                              <div class="form-group">
                               <label for="name">Enter Latitude:</label>
                               <input type="text" class="form-control" id="lat">
                              </div>
                            </div>
                             <div class="col-md-4">
                              <div class="form-group">
								  <label>Enter Longitude</label>
								  <input type="text" class="form-control" id="lng">
								</div>
                            </div>
                            </div>
                            
                            <div class="row">
                            <div class="col-md-4">
                              <div class="form-group">
                               <label for="name">Licence Type:</label>
                               <input type="text" class="form-control" id="licenceType">
                              </div>
                            </div>
                             <div class="col-md-4">
                              <div class="form-group">
								  <label>Zip Code</label>
								  <input type="text" class="form-control" id="zipCode">
								</div>
                            </div>
                             <div class="col-md-4">
                              <div class="form-group">
								 </div>
                            </div>
                            </div>
                            
                         </div>
                        
                        
                          
                                
                     </div>
                     <div class="modal-footer">
                        <div type="button" class="btn btn-sm btn-info addSubLocality">Add Sub-Locality</div>
                        <div type="button" class="btn btn-sm btn-info editSubLocality">Edit Sub-Locality</div>
                     </div>
                  </div>
               </div>
               
           <div style="padding:20px !important"></div>     
           
           <div class="row">
                           <div class="col-md-3">
                              <div class="form-group">
								  <select class="form-control" id="state">
								  </select>
								</div>
                            </div>
                            
                            <div class="col-md-3">
                              <div class="form-group">
								  <select class="form-control" id="city">
								  </select>
								</div>
                            </div>
                            
                            <div class="col-md-3">
                              <div class="form-group">
								  <select class="form-control" id="locality">
								  </select>
								</div>
                            </div>
            
            				<div class="col-md-3 ">
                                 <div type="button" class="btn btn-info btn-block" id="subLocalitySearch">Search Sub-Localities</div>
                            </div>
           </div>
           
           <div style="padding:20px !important"></div>
          
           <div class="row">
            <div class="col-md-12">
              <div class="box box-info main_box">
                <div class=" tableSection sectionBgWhite">
                  <h3 class="box-title">Sub-Localities/Societies/Communities</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add Society</button>                   <!--  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div><!-- /.box-header -->
                <div class=" tableSection sectionBgWhite">
                
                    <table id="subLocalitiesTable" class="stripe table table-bordered table-striped" ></table>
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
  src="<c:url value="/resources/js/societies.js" />"></script>
<script type="text/javascript"
  src="<c:url value="/resources/js/utils.js" />"></script>
    
  
  