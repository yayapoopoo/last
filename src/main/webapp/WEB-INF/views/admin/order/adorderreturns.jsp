<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>반품</title>
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css"
	media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/calendars/duetds/css/themes/ec-date-picker.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#eBtnInit").click(function() {
			$("#script_reset").each(function() {
				this.reset();
			});
		});

	});
</script>
</head>
<body>

	<form name="frm" id="script_reset" action="adorderreturns"
		method='get'>
		<!-- content -->
		<div id="content">
			<!-- 참고 : Frame 구분 시 컨텐츠 시작 -->
			<div class="headingArea">
				<div class="mTitle">
					<h1>반품</h1>
					<span class="cManual eSmartMode" code="OD.OW.RM"></span>
				</div>
			</div>

			<div class="optionArea " id="QA_deposit1">

				<div class="mOption">
					<table border="1" summary="">
						<caption>주문 검색</caption>
						<colgroup>
							<col style="width: 170px;" />
							<col style="width: 600px;" />
							<col style="width: 170px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>

							<tr>
								<th scope="row">검색어
									<div class="cTip" code="OR.SM.AO.40"></div>
								</th>
								<td colspan="3">
									<div id="mainSearch">
										<div>
											<select class="fSelect" name="searchOption"
												style="width: 163px;">
												<option value="choice">-검색항목선택-</option>
												<option value="ocode" selected>주문번호</option>
												<option value="ord_item_code">품목별 주문번호</option>
												<option value="invoice_no">운송장번호</option>
												<option value="line1">-----------------</option>
												<option value="o_name">주문자명</option>
												<option value="member_id">주문자 아이디</option>
												<option value="member_email">회원 이메일</option>
												<option value="o_email">주문서 이메일</option>
												<option value="o_phone2">주문자 휴대전화</option>
												<option value="o_phone1">주문자 일반전화</option>
											</select> <input type="text" class="fText sBaseSearchBox"
												name="keyword" id="sBaseSearchBox" style="width: 400px;" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">상품
									<div class="cTip" code="OR.SM.AO.50"></div>
								</th>
								<td colspan="3"><select class="fSelect"
									id="eProductSearchType" name="searchOption2"
									style="width: 110px;">
										<option value="prodname" selected="selected">상품명</option>
										<option value="product_code">상품코드</option>
										<option value="item_code">품목코드</option>
										<option value="product_tag">상품태그</option>
										<option value="manufacturer_name">제조사</option>
										<option value="supplier_name">공급사</option>
								</select> <input type="text" id="eOrderProductText" name="keyword2"
									class="fText" style="width: 490px;" value="" /></td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="mButton gCenter">
					<input type="submit" id="search_button" class="btnSearch"
						value="검색" /> <a href="#none" id="eBtnInit"
						class="btnSearch reset"><span>초기화</span></a>
					<div id="ordProgress" class="mLoading">
						<p>처리중입니다. 잠시만 기다려 주세요.</p>
						<img
							src="//img.echosting.cafe24.com/ec/mode/influencer/common/ico_loading.gif"
							alt="" />
					</div>
				</div>

				<input type="hidden" name="main_search" id="main_search" value="">
			</div>

			<!--No delete -->
			<div id="ordOption1" class="mLayer gMedium"></div>
			<div id="ordOption2" class="mLayer gMedium"></div>
			<div id="ordOption3" class="mLayer gMedium"></div>
			<div id="layerOrderPath" class="mLayer gSmall"
				style="opacity: 1; top: 590px; left: 532px; margin-left: 0px; display: none;">
			</div>
			<div id="layerCompany" class="mLayer gSmall"
				style="display: none; opacity: 1;"></div>
			<div id="layerMethod" class="mLayer gSmall"
				style="display: none; opacity: 1;"></div>
			<!--No delete -->

			<div class="section" id="QA_returnReturn2">
				<div class="mState typeHeader">
					<div class="gLeft">
						<p class="total">
							[검색결과 <strong>${map.count}</strong>건]
						</p>
					</div>
				</div>
				<div class="mCtrl typeHeader">
					<div class="gLeft">
						<button class="btnCtrl" type="button"
							id="eReturnCompleteBtn"><span>수거완료</span></button>
					</div>
				</div>
				<div class="mCtrl typeSetting setting">
					<div class="gLeft"></div>
				</div>

				<div class="mBoard typeOrder gScroll gCellSingle typeList" style="text-align: center;">
					<table id="searchResultList" border="1" summary=""
						class="eChkBody tablesorter">
						<caption>반품 관리 목록</caption>
						<thead>
							<tr>
								<th scope="col" style="width: 24px"><input type="checkbox"
									id="allChk" /></th>
								<th scope="col" style="width: 50px; display: none;">No</th>
								<th scope="col" style="width: 70px;">반품신청일<br>(반품접수일)
								</th>
								<th scope="col" style="width: 140px;">품목별 주문번호/<br />취소번호
								</th>
								<th scope="col" style="width: 95px;">주문자
									<div class="cTip eSmartMode" code="OD.OW.RM.150"></div>
								</th>
								<th scope="col" style="width: 220px;">상품명/옵션</th>
								<th scope="col" class="w40" style="">수량</th>
								<th scope="col" style="width: 85px;">운송장정보</th>
								<th scope="col" style="width: 100px;">반품처리</th>
								<th scope="col" style="width: 40px;">메모</th>
							</tr>
						</thead>
							<c:choose>
								<c:when test="${map.count != 0}">
								<c:forEach items="${map.ortList}" var="ortList">
									<tbody>
										<tr>
											<td scope="col" style="width: 24px"><input
												type="checkbox" id="allChk" /></td>
											<td scope="col" style="width: 50px; display: none;">No</td>
											<td scope="col" style="width: 70px;">${ortList.acceptdate}
											</td>
											<td scope="col" style="width: 140px;">${ortList.ocode}</td>
											<td scope="col" style="width: 95px;">${ortList.mid}
												<div class="cTip eSmartMode" code="OD.OW.RM.150"></div>
											</td>
											<td scope="col" style="width: 220px;">${ortList.prodname}</td>
											<td scope="col" class="w40" style="">${ortList.oiamount}</td>
											<td scope="col" style="width: 85px;">${ortList.shipnum}</td>
											<c:choose>
												<c:when test="${ortList.procstatus == 2}">
													<td scope="col" style="width: 100px;">처리전</td>
												</c:when>
												<c:when test="${ortList.procstatus == 6}">
													<td scope="col" style="width: 100px;">처리완료</td>
												</c:when>
											</c:choose>
											<td scope="col" style="width: 40px;">${ortList.memocontent}</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
								<c:otherwise>
									<tbody class="empty">
										<tr>
											<td colspan="8">검색된 주문내역이 없습니다.</td>
										</tr>
									</tbody>
								</c:otherwise>
							</c:choose>
					</table>
				</div>
				<div class="mCtrl typeFooter">
					<div class="gLeft">
						<button class="btnCtrl" type="button"
							id="eReturnCompleteBtn"><span>수거완료</span></button>
					</div>
				</div>
				<div class="mPaginate">1</div>
			</div>

		</div>
		<!-- //content -->

	</form>

</body>
<script src="js/button.js"></script>
</html>