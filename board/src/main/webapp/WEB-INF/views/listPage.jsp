<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


<html>
<head>
<meta charset="UTF-8">
    <!-- include libraries(jQuery, bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<meta charset="UTF-8">
<title>글목록+페이징+검색</title>
<style type="text/css">

#pageNav{
position:absolute;
left:25%;
top:500px;
transform:translate(-50%,-50%);

}

#search{
position:absolute;
left:10%;
top:500px;
transform:translate(-50%,-50%);

}


#addContent{
position:absolute;
left:16.3%;
top:550px;
transform:translate(-50%,-50%);

}



th{
text-align : center;

}

#no, #writer{
text-align : center;
}




</style>

<script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listPage"
   	 + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>

</head>
<body>



<table class="table table-hover" >
  <thead>
    <tr class="table-active" id="contentTable">
 	 <th scope="col">작성번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
 
  <c:forEach items= "${contentList}" var="contentList" varStatus="status" >
    <tr>
    
    <c:set var="page" value="${criteria.page}"/>
    <c:set var="num05" value="${pageMaker.totalCount}"/>
      <td id="no">${num05-((page-1)*10)-status.index}</td>
      <!--  <td onclick="location='getContent?no=${contentList.no}'" style="cursor:pointer;">${contentList.title}</td>--> 
      <td id="title" onclick="location='getContent?no=${contentList.no}'" style="cursor:pointer;"><c:out value="${contentList.title}"/></td>
      <td id="writer"><c:out value="${contentList.writer}"></c:out></td>
  <!--     <td id="writeDate"><fmt:formatDate value="${contentList.writeDate}" pattern="yyyy-MM-dd"/></td> -->
      <!-- <td id="writeDate"><c:out value="${contentList.writeDate}"/></td> -->
      <td><fmt:formatDate value="${contentList.writeDate}" pattern="yyyy-MM-dd"/></td>
    <!-- 작성일 안불러와짐 수정할것 -->
    </tr>
    </c:forEach>
  </tbody>
</table>


 <div class="search" id="search">
 	<select name="searchType">
 	<!-- <option value="n"<c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>-----</option> -->
 		<option value="t"<c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
 		<option value="w"<c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
 	</select>
 	<input type="text" name="keyword" id="keywordInput" value="${searchCriteria.keyword}"/>
 	 <button class="btn btn-primary" id="searchBtn">검색</button>

 
 </div>

<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div id="pageNav" class="col-md-offset-3">
  <ul class="pagination">
  <c:if test="${pageMaker.prev}">
    <li class="page-item disabled">
      <a class="page-link" href="listPage?page=1" style="cursor:pointer;">첫페이지</a>
      <a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.startPage-1)}" style="cursor:pointer;">&laquo;</a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
      <a class="page-link" href="listPage${pageMaker.makeSearch(idx)}">${idx}</a>
    </li>
    </c:forEach>
    
    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
    <li class="page-item">
      <a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
      <a class="page-link" href="listPage?page=${pageMaker.lastPage}">끝페이지</a>
    </li>
    </c:if>
  </ul>
</div>



<button id="addContent" class="btn btn-primary" onclick="location.href='/addContent'" >글작성</button>


</body>
</html>