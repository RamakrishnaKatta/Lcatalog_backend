<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Super Admin</title>
</head>
<body>
     <%@ include file="header.jsp" %>
     <%@ include file="side-menu.jsp" %>
    <div class="content-wrapper" >
        <section class="content">
          <div class="row" style="margin:0px !important;"> 
                  <div class="box  panel box box-warning accessPermission" style="box-shadow: 0px 2px 10px #868282;">
                      <div class="box-header" data-widget="collapse-header">
                          <h3 class="box-title">Add Super Admin Role</h3>
                          <div class="box-tools pull-right">
                              <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                          </div>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                         <form id="create_role_form" name="create_role_form">
                         
                         <div class="row">
                          <div class="col-md-6">
                          <div class="form-group">
                              <h5 class="box-title">*Add Super Admin Role Id : </h5>
                              <input type="text" class="form-control" id="role_id" required data-msg="Please Enter Role Id">
                            </div>
                            </div>
                          <div class="col-md-6">
                          <div class="form-group">
                              <h5 class="box-title">*Add Super Admin Role Name : </h5>
                              <input type="text" class="form-control" id="role_name" required data-msg="Please Enter Role Name">
                            </div>
                            </div>
                           </div> 
                            <div class="form-group float-right" style="margin-right: 14px;">
                                 <input type="submit" class="btn btn-info" id="deleteSubmit" value="Add"  />
                            </div>
                        </form>
                      </div><!-- /.box-body -->
              </div><!-- /.box -->
          </div>
          <div class="row">
            
              <div class="col-md-12">
                <div class="height10"></div>
                <div class=" tableSection sectionBgWhite">
                   <div class="height20"></div>
                   <table id="rolesTable" class="stripe table table-bordered table-striped" style="width:100%">
                   </table>
                </div>
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
  src="<c:url value="/resources/js/superadmin_roles.js" />"></script>