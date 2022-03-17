<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>배솧 관리(입금전)</title>
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

	<!-- content -->
	<div id="content">
		<form name="frm" id="script_reset" method="get" action="adpaymentlist">

			<!-- 참고 : Frame 구분 시 컨텐츠 시작 -->
			<div class="headingArea">
				<div class="mTitle">
					<h1>입금전</h1>
					<span class="cManual eSmartMode" code="OD.OF.DB"></span>
				</div>
				<div class="mBreadcrumb"></div>
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

			<div class="section" id="QA_deposit2">
				<div class="mTitle" style="display: none;">
					<h2>
						검색 결과
						<div class="cTip" code="OR.SM.DB.110"></div>
					</h2>
				</div>

				<div id="tabNumber" class="tabCont" style="display: block;">
					<div class="mState typeHeader">
						<div class="gLeft">
							<p class="total">
								[검색결과 <strong>${map.count}</strong>건]
							</p>
							<div class="cTip eSmartMode" code="OD.OF.DB.80"></div>
						</div>

					</div>
					<div class="mCtrl typeHeader">
						<div class="gLeft">
							<button type="button" id="ePaymentOkBtn" class="btnCtrl"><span>입금확인</span></button>
							<button type="button" id="ePaymentCancelBtn" class="btnCtrl"><span>주문취소</span></button>
						</div>
					</div>

					<div class="mBoard typeOrder gScroll gCellSingle typeList" style="text-align: center;">
						<table id="searchResultList" border="1" summary="" class="eChkTr">
							<caption>입금전 관리 목록</caption>
							<thead>
								<tr>
									<th scope="col" style="width: 30px;"><input
										type="checkbox" id="allChk" /></th>
									<th scope="col" style="width: 50px; display: none;">No</th>
									<th scope="col" style="width: 80px;">주문일</th>
									<th scope="col" style="width: 150px;">주문번호</th>
									<th scope="col" style="width: 180px;">상품명</th>
									<th scope="col" style="width: 85px;">주문자
										<div class="cTip eSmartMode" code="OD.OF.DB.140" />
									</th>
									<th scope="col" style="width: 110px;">총 상품구매금액</th>
									<th scope="col" style="width: 70px;">입금자</th>
									<th scope="col" style="width: 90px;">입금액</th>
									<th scope="col" style="width: 80px;">입금은행</th>
									<th scope="col" style="width: 75px;">처리여부</th>
									<th scope="col" style="width: 75px;">추가입금</th>
									<th scope="col" style="width: 45px;">메모</th>
								</tr>
							</thead>
								<c:choose>
									<c:when test="${map.count != 0}">
									<c:forEach items="${map.pList}" var="pList">
										<tbody>
											<tr>
												<td scope="col" style="width: 30px;"><input
													type="checkbox" id="allChk" /></td>
												<td scope="col" style="width: 50px; display: none;">No</td>
												<td scope="col" style="width: 80px;">${pList.odate}</td>
												<td scope="col" style="width: 150px;">${pList.ocode}</td>
												<td scope="col" style="width: 180px;">${pList.prodname}</td>
												<td scope="col" style="width: 85px;">${pList.mid}
													<div class="cTip eSmartMode" code="OD.OF.DB.140" />
												</td>
												<td scope="col" style="width: 110px;">${pList.oitotalprice}</td>
												<td scope="col" style="width: 70px;">-</td>
												<td scope="col" style="width: 90px;">-</td>
												<c:choose>
													<c:when test="${pList.pbank == 0}">
														<td scope="col" style="width: 80px;">카드결제</td>
													</c:when>
													<c:when test="${pList.pbank == 1}">
														<td scope="col" style="width: 80px;">농협</td>
													</c:when>
													<c:when test="${pList.pbank == 2}">
														<td scope="col" style="width: 80px;">신한</td>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${pList.pstatus == 0}">
														<td scope="col" style="width: 75px;">입금전</td>
													</c:when>
													<c:when test="${pList.pstatus == 1}">
														<td scope="col" style="width: 75px;">입금확인</td>
													</c:when>
												</c:choose>
												<td scope="col" style="width: 75px;">-</td>
												<td scope="col" style="width: 45px;">${pList.memocontent}</td>
											</tr>
										</tbody>
									</c:forEach>
								</c:when>
									<c:otherwise>
										<tbody class="empty">
											<tr>
												<td colspan="12">검색된 주문내역이 없습니다.</td>
											</tr>
										</tbody>
									</c:otherwise>
								</c:choose>
						</table>
					</div>
					<div class="mCtrl typeFooter">
						<div class="gLeft">
							<button type="button" id="ePaymentOkBtn" class="btnCtrl"><span>입금확인</span></button>
							<button type="button" id="ePaymentCancelBtn" class="btnCtrl"><span>주문취소</span></button>
						</div>
					</div>
					<div class="mPaginate"></div>
				</div>
			</div>
		</form>
	</div>
</body>
<script src="js/button.js"></script>
</html>
