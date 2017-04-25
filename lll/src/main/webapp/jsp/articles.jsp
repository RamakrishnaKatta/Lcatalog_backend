<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LLL-Articles</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
        
      <!-- ADD ARTICLE MODAL -->
           <div class="modal fade bs-example-modal-lg" id="myModal" >
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><b class="headerText">Add Article</b></h4>
                     </div>
                     <div class="modal-body">
                        <form role="form" id="data"  method="post" enctype="multipart/form-data">
                     
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
                            <label for="name">Title :</label>
                            <input type="text" class="form-control"  name="title" id="title">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Category :</label>
                            <input type="text" class="form-control"  name="category" id="category">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Sub Category :</label>
                            <input type="text" class="form-control"  name="sub_category" id="sub_category">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Description :</label>
                            <input type="text" class="form-control"  name="description" id="description">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Dimensions :</label>
                            <input type="text" class="form-control" placeholder="Please enter the dimension with comma separated value of width,lenght,heigth as 20,30,40 respectively Eg:20,40,30"  name="dimensions" id="dimensions">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Discount :</label>
                            <input type="text" class="form-control"  name="discount" id="discount">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Price :</label>
                            <input type="text" class="form-control"  name="price" id="price">
                            </div>
                            </div>
                         </div>
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Quantity :</label>
                            <input type="text" class="form-control"  name="quantity" id="quantity">
                            </div>
                            </div>
                         </div>
                         
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">VendorId :</label>
                            <select type="number" class="form-control" name="vendorId" id="vendorId"></select>
<!--                             <input type="number" class="form-control" placeholder="Please enter the correct vendorId Eg:100000" name="vendorId" id="vendorId">
 -->                            </div>
                            </div>
                         </div>
                         
                         <div class="row">
                            <div class="col-md-12">
                            <div class="form-group">
                            <label for="name">Uploaded User Id :</label>
                            <input type="number" class="form-control"  readonly="true"  name="uploadedUserId" id="uploadedUserId">
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
                         <input type="submit" class="btn btn-primary float-right" value="Add Article">
                         </input>
                         </form>
                           
                     </div>
                     <div class="modal-footer">
                       
                    </div>
                  </div>
               </div></div>
        
          
               
           <div style="padding:7px !important"></div>     
           
         <div class="row" style="margin:0px !important;"> 
                  <div class="box  panel box box-info accessPermission" style="box-shadow: 0px 2px 10px #868282;">
                      <div class="box-header" data-widget="collapse-header">
                          <h2 class="box-title"><b>Article Search Filter</b></h2>
                          <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                          </div>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                         <form id="create_role_form" name="create_role_form">
                         
                           <div class="row">
                              <div class="col-md-4">
                              <div class="form-group">
                              <h5 class="box-title">Name</h5>
                              <input type="text" class="form-control" id="role_id" required data-msg="Please Enter Name">
                              </div>
                              </div>
                             
                              <div class="col-md-4">
                              <div class="form-group">
                              <h5 class="box-title">Type</h5>
                              <input type="text" class="form-control" id="role_name" required data-msg="Please Select Type">
                              </div>
                              </div>
                              
                              <div class="col-md-4">
                              <div class="form-group">
                              <h5 class="box-title">Location</h5>
                              <input type="text" class="form-control" id="role_name" required data-msg="Please Enter Location">
                              </div>
                              </div>
                             
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
                  <h3 class="box-title">Articles</h3>
                  <div class="box-tools pull-right" style="margin-top: -40px; !important">
                      <button class="btn btn-info showModal">Add Article</button>                 
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
  src="<c:url value="/resources/js/article.js" />"></script>
<script type="text/javascript"
  src="<c:url value="/resources/js/utils.js" />"></script>
    
  
  