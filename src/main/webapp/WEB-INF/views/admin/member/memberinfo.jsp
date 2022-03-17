<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>하객 관리</title>
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css"
	media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/themes/ec-date-picker.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>


<body>
	<div class="mTitle">
		<h2>상세 정보</h2>
	</div>
	<div id="container">
		<div class="mBoard">
			<table border="1">
				<caption>상세 정보</caption>
				<colgroup>
					<col style="width: 150px">
					<col style="width: auto">
					<col style="width: 100px">

				</colgroup>
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td colspan="3">${mList.m_id}</td>
					</tr>
					<tr>
						<th scope="row">회원 등급</th>
						<td colspan="3">${mList.m_grade}</td>
					</tr>
					<tr>
						<th scope="row">이름</th>
						<td colspan="3">${mList.m_name}</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td colspan="3">${mList.m_address}</td>
					</tr>
					<tr>
						<th scope="row">휴대번호</th>
						<td colspan="3">${mList.m_phone}</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td colspan="3">${mList.m_email}</td>
					</tr>
					<tr>
						<th scope="row">적립금</th>
						<td colspan="3">${mList.m_point}</td>
					</tr>
					<tr>
						<th scope="row">가입일</th>
						<td colspan="3"></td>

					</tr>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>