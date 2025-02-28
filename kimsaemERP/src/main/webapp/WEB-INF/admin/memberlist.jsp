<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	$("#all").on("click",function(){
		if($('input:checkbox[id="all"]').is(":checked")==true){ //속성을 표현할 때 [id="all"]처럼 사용
			$('input:checkbox[name="member"]').each(function() {
			    //현재 작업 중인 체크박스의 체크값을 true  
				this.checked = true; //checked 처리 
			 });

		}else{
			$('input:checkbox[name="member"]').each(function() {
			    //현재 작업 중인 체크박스의 체크값을 true  
				this.checked = false; //checked 처리 
			 });
		}
	})
	$("#passmodify").on("click",function(){
		paramdata=""
		$('input:checkbox[name="member"]').each(function() {
			if(this.checked){
				//alert($(this).closest("td").next().children('input:text[name="id"]').val())
				paramdata=paramdata+"id="+
					$(this).closest("td").next().children('input:text[name="id"]').val()+"&"
			}
		})
		//alert(paramdata);
		location.href="/kimsaemERP/admin/passmodify.do?"
							+paramdata.substr(0, paramdata.length-1)
	})

})
</script>

</head>
<body>
	<h3>회원목록</h3>
	<div style="padding-top: 30px">
	<form action="/kimsaemERP/board/search.do">
		<select name="tag">
			<option value="deptno">부서</option>
			<option value="name">성명</option>
			<option value="group">그룹</option>
			<option value="startday">입사일</option>
		</select> <input type="text" name="search" /> <input type="submit" value="검색">
		<input type="button" value="비밀번호변경" id="passmodify">
		
	</form>
	<br/>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" id="all"/></th>
					<th>아이디</th>
					<th>성명</th>
					<th>부서코드</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberlist}">
					<tr>
						<td><input type="checkbox" name="member" id="chk${member.id}"/></td>
						<td><input type="text" value="${member.id}" name="id" disabled="disabled"/></td>
						<td><a
							href="/kimsaemERP/board/user/read.do?board_no=${member.name}&state=READ">${member.name}</a></td>
						<%-- <td><a
							href="/kimsaemERP/board/${board.category}/${board.board_no }?state=READ">${board.title}</a></td> --%>
						<td>${member.deptno}</td>
						<td>${member.startday}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
</body>
</html>
