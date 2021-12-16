<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  	@SuppressWarnings("unchecked")
  	List<Song> listSongs = (List<Song>) request.getAttribute("listSongs");
	  	if(listSongs != null && listSongs.size() > 0){
  		int i = 0;
  		for(Song objSong : listSongs){
  			i++;
  			String urlSlug = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getName()) + "-" + objSong.getId() + ".html";
  %>
    <div class="article">
      <p class="infopost"><a href="<%=urlSlug%>" title="<%=objSong.getName() %>"><%=objSong.getName() %> </a> <span><%=objSong.getDescription() %></span>  <br></p>
      <div class="clr"></div>
      
      <div class="clr"></div>
    </div>
    <%
  		}} else {
    %>
    <div class="article">
    	Không có bài hát nào!
    </div>
    <%} %>
    <%
	    int numberOfPages = (Integer) request.getAttribute("numberOfPages");
		int currentPage = (Integer) request.getAttribute("currentPage");
		if(listSongs != null && listSongs.size() > 0 && numberOfPages > 1){
    %>
    <p class="pages"><small>Trang <%=currentPage %> của <%=numberOfPages %></small>
    <a href="<%=request.getContextPath()%>/home?page=<%=currentPage-1%>" style="<%if(currentPage==1) out.print("display: none");%>">&laquo;</a>
    <%
	    for(int i = 1; i <= numberOfPages; i++){
	    	if(currentPage == i){
    %>
    <span><%=i %></span>
    <%} else { %>
    <a href="<%=request.getContextPath()%>/home?page=<%=i%>"><%=i %></a>
    <%}} %>
    <a href="<%=request.getContextPath()%>/home?page=<%=currentPage+1%>" style="<%if(currentPage==numberOfPages) out.print("display: none");%>">&raquo;</a></p>
  <%} %>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<script>
    document.getElementById("index").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>