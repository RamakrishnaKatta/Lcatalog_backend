<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LLL-Vendors</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
    
     <!-- ADD VENDOR MODAL -->
           <div class="modal fade bs-example-modal-lg" id="myModal" >
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b class="headerText">Add Vendor</b></h4>
                     </div>
                     <div class="modal-body">
                        <form role="form" id="data"  method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Id :</label>
                            <input type="text" class="form-control" name="id" id="id">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Name :</label>
                            <input type="text" class="form-control"  name="name" id="name">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Type :</label>
                            <input type="text" class="form-control"  name="type" id="type">
                            </div>
                            </div>
                         </div>
                         
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Code :</label>
                            <input type="text" class="form-control"  name="code" id="code">
                            </div>
                            </div>
                         </div>

                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Logo :</label>
                            <input type="file" class="form-control" name="file" id="file">
                            </div>
                            </div>
                         </div>
                         <input type="submit" class="btn btn-primary float-right" value="Register">
                         </input>
                         </form>
                           
                     </div>
                     <div class="modal-footer">
                       

                     </div>
                  </div>
               </div></div>
    
     <div style="padding:14px !important"></div>
         
        <section class="content">
           
      
           <div class="row">
            <div class="col-md-12">
              <div class="box box-info main_box">
                <div class=" tableSection sectionBgWhite">
                  <h3 class="box-title">Vendors</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add Vendor</button>                 
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
  src="<c:url value="/resources/js/vendors.js" />"></script>
<script type="text/javascript"
  src="<c:url value="/resources/js/utils.js" />"></script>
    
  
  