<%@page import="constants.GlobalConstant"%>
<%@page import="java.util.List"%>
<%@page import="util.StringUtil"%>
<%@page import="models.Song"%>
<%@page import="daos.SongDao"%>
<%@page import="models.Category"%>
<%@page import="daos.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="searchform">
	<%
		String songName = (String) request.getAttribute("songName");
	%>
  <form id="formsearch" name="formsearch" method="get" action="<%=request.getContextPath()%>/search">
    <span>
    <input name="name" class="editbox_search" id="editbox_search" maxlength="80" placeholder="Tìm kiếm bài hát" value="<%if(songName!=null) out.print(songName); %>" type="text" />
    </span>
    <input src="<%=GlobalConstant.URL_PUBLIC%>/images/search.jpg" class="button_search" type="image" />
  </form>
</div>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star">Danh mục bài hát</h2>
  <div class="clr"></div>
  <ul class="sb_menu">
  <%
  CatDao catDao = new CatDao();
  List<Category> listCat = catDao.getItems();
  if(listCat.size()>0){
	  for(Category objCat: listCat){
		  String urlSlug = request.getContextPath() + "/danh-muc/"+ StringUtil.makeSlug(objCat.getName()) +"-"+objCat.getId();
  %>
    <li><a id="<%=objCat.getId()%>" href="<%=urlSlug%>"><%=objCat.getName() %></a></li>
    <%
  }}
    %>
  </ul>
</div>
