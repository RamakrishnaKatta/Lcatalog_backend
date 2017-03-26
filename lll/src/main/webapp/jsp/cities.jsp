<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>States</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
          <!-- ADD STATE MODAL -->
           <div class="modal fade bs-example-modal-lg" id="registerModal">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b>Create City</b></h4>
                     </div>
                     <div class="modal-body">
                        
                            <div class="row">  
                            <div class="col-md-6">
                              <div class="form-group">
								  <label>Select State</label>
								  <select class="form-control" id="select_state">
								  </select>
								</div>
                            </div>
                            
                            <div class="col-md-6">
                              <div class="form-group">
                               <label for="name">Enter City Name:</label>
                               <input type="text" class="form-control" id="select_city">
                              </div>
                            </div>
                            </div>
                         </div>
                                
                     </div>
                     <div class="modal-footer">
                        <div type="button" class="btn btn-sm btn-info addCity">Add City</div>
                     </div>
                  </div>
               </div>
               
           <div style="padding:20px !important"></div>     
           
           <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
								  
								  <select class="form-control" id="state">
								  </select>
								</div>
                            </div>
            
            				<div class="col-md-6">
            				 
                                 <div type="button" class="btn btn-info btn-block citySearch">Search Cities</div>
                                 
                            </div>
           </div>
           
           <div style="padding:20px !important"></div>
          
           <div class="row">
            <div class="col-md-12">
              <div class="box box-info main_box">
                <div class=" tableSection sectionBgWhite">
                  <h3 class="box-title">Cities</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add City</button>                   <!--  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div><!-- /.box-header -->
                <div class=" tableSection sectionBgWhite">
                
                    <table id="citiesTable" class="stripe table table-bordered table-striped" ></table>
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
  src="<c:url value="/resources/js/utils.js" />"></script>

<script type="text/javascript"
  src="<c:url value="/resources/js/cities_mgt.js" />"></script>

    
  
  