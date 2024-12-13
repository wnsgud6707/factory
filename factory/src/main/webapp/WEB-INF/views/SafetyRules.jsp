<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>수칙 테이블</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
	font-weight: bold;
}

tr:hover {
	background-color: #f1f1f1;
}

caption {
	margin: 10px 0;
	font-size: 1.2em;
	font-weight: bold;
}
</style>
</head>
<body>
	<h2>수칙 테이블</h2>
	<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>수칙 제목</th>
				<th>수칙 분류</th>
				<th>수칙 등록일자</th>
			</tr>
		</thead>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.srIdx}</td>
				<!-- 순번 -->
				<td><a href="javascript:void(0);"
					onclick="openPdf('${item.safetyPath}');">${item.srTitle}</a></td>

				<%-- javascript:void(0);는 클릭할 때 페이지가 새로고침되지 않도록 하는 역할을 한다..
					 openPdf('${item.safetyPath}')는 item.safetyPath에 저장된 파일 경로를 openPdf 함수에 전달하고
 					 해당 경로에 있는 PDF 파일을 새 탭에서 열도록 한다. --%>

				<!-- 수칙 제목 -->
				<td>${item.srDesc}</td>
				<!-- 수칙 분류 -->
				<td><fmt:formatDate value="${item.createdAt}"
						pattern="yyyy-MM-dd HH:mm" /></td>
				<!-- 등록일 -->
			</tr>
		</c:forEach>
	</table>
	<script src="/js/SafetyRules.js"></script>
</body>
</html>