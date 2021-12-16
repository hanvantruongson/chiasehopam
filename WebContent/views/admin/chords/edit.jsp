<%@page import="models.Chords"%>
<%@page import="constants.GlobalConstant"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>

<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa hợp âm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                        	<%
                        		String name = request.getParameter("name");
                        		String picture = request.getParameter("picture");
                        	
								if(request.getParameter("msg")!=null){
									int msg = Integer.parseInt(request.getParameter("msg"));
									switch(msg){
										case 0: out.print("<p style='color: red; background: yellow'>Có lỗi trong quá trình xử lý!</p>");
										break;
										case 1: out.print("<p style='color: red; background: yellow'>Vui lòng nhập tên bài hát!</p>");
										break;
										case 2: out.print("<p style='color: red; background: yellow'>Vui lòng nhập ca sĩ!</p>");
										break;
										case 3: out.print("<p style='color: red; background: yellow'>Vui lòng nhập chi tiết bài hát!</p>");
										break;
									}
								}
							%>
							<%
	                             if(request.getAttribute("itemChords") != null){
	                             	Chords itemChords = (Chords) request.getAttribute("itemChords");
	                             	name = itemChords.getName();
	                             	picture = itemChords.getPicture();
	                             }
                             %>
                            <div class="col-md-12">
                                <form role="form" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên hợp âm</label>
                                        <input type="text" id="name" value="<%=name %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                        <%if(!"".equals(picture)){ %>
                                        <img width="200px" height="200px" src="<%=GlobalConstant.URL_PICTURE %>/<%=picture %>" alt="Không có hình ảnh" />
                                        <%} %>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                    <input type="button" value="Hủy" class="btn btn-danger btn-md" onclick="history.back()"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("chords").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>