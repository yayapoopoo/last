<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">
<title>답인사</title>
<!-- favicon -->
<link rel="shortcut icon" href="user/images/00.logo.png">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link
	href="https://cdn.materialdesignicons.com/2.3.54/css/materialdesignicons.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css" href="../css/00_common.css" />
<link rel="stylesheet" type="text/css" href="../css/04_order.css" />
</head>



<body class="app" data-target="#main-navbar" data-spy="scroll">

	<!----------------- header ----------------->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<!-- 기타 -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>

	<script type="text/javascript">
		function call()
		{
		 if(document.getElementById("opointUse").value && document.getElementById("point").value  && document.getElementById("totalBuy").value ){
		  document.getElementById('m_point').value =parseInt(document.getElementById('point').value) - parseInt(document.getElementById('opointUse').value) ;
		  document.getElementById('oi_totalprice').value =parseInt(document.getElementById('totalBuy').value) - parseInt(document.getElementById('opointUse').value)
		  document.getElementById('pointUse').value = parseInt(document.getElementById('opointUse').value) + 'KRW';
		  document.getElementById('totalBuy2').value =parseInt(document.getElementById('totalBuy1').value) - parseInt(document.getElementById('opointUse').value) + 'KRW';
		 
		 }
		}
</script>



	<div class="container row">
		<div class="col-md-10 offset-md-1">
			<table class="table table-responsive">
			<h3>주문정보 확인</h3>	
				<tr bgcolor="#efefef" align="center">
					<td width="10%">상품번호</td>
					<td width="25%">상품명</td>
					<td width="30%">판매가</td>
					<td width="10%">수 량</td>
					<td width="25%">합계금액</td>
				</tr>
				<!-- --------------------- -->
				<c:set var="totalBuy" value="0" /> <!-- 총 주문가격 -->
				<c:set var="totalBuyPoint" value="0" /><!-- 총 주문 누적포인트 -->
				
				<c:forEach var="oList" items="${omap.oList}">
					<c:if test="${id == oList.prod_id}">
						<c:set var="oi_totalprice" value="${oList.retail_price * omap.p_num1}" />
						<c:set var="totalBuyPoint" value="${(oList.retail_price * 1/100) * omap.p_num1}" />
						<c:set var="oi_amount" value="${omap.p_num1}" /> <!-- 구매수량 -->
						<c:set var="totalmillige" value="${(totalBuyPoint) * omap.p_num1 + omap.m_point}" /> <!-- 멤버마일리지에 반영할 자료 -->
						<tr>
							<td  style="padding: 30px">${oList.prod_id}</td>
							<td align="center" style="padding: 30px">${oList.prod_name}<br>
							</td>
							<td align="right"  style="padding: 20px">
							<fmt:formatNumber value="${oList.retail_price}" pattern="#,###" />KRW
							<br>
							[ <fmt:formatNumber value="${(oList.retail_price * 1/100)}" pattern="#,###" /> ]POINT
							</td>
							<td align="center" style="padding: 30px"><fmt:formatNumber value="${omap.p_num1}"
									pattern="#,###" />EA</td>
							<td align="right" style="padding: 20px">
							<b>
							<fmt:formatNumber value="${oi_totalprice}" pattern="#,###" />KRW<br/>
							</b>
							<b> [ <fmt:formatNumber value="${totalBuyPoint}" pattern="#,###" /> ]POINT </b>
							</td>
						</tr>
					</c:if>
				</c:forEach>
				<!-- ----------------------- -->
				<tr>
					<c:forEach var="oList" items="${omap.oList}">
						<c:if test="${id == oList.prod_id}">
							<td colspan="1" style="padding: 20px 50px">
							배송비<br/>
							<h4>${oList.shipping_fee}KRW</h4>
							</td>
							<td colspan="2" style="padding: 20px 50px">
							부가결제<br/>
							<h4>
							<input type="text" id="pointUse" style="text-align : center; width: 100px; border: none;" />
							</h4>
							</td>
							<td colspan="3" align="right" style="padding: 20px 50px">주문총금액
								<h4 id="total">
								<fmt:formatNumber value="${oi_totalprice + oList.shipping_fee}" pattern="###,###" />KRW
								</h4>
								<br>
								<h2 class="texttotalprice">
									총 결제금액<br>
									<input type="hidden" name="totalBuy1" id="totalBuy1" value="${oi_totalprice + oList.shipping_fee}" />
									<input style="text-align : center; width: 200px; border: none;" 
									type="text" name="totalBuy2" id="totalBuy2" value="<fmt:formatNumber value="${totalBuy1}" pattern="###,###" />" />
									
								</h2>
							</td>		
						</c:if>
					</c:forEach>
				</tr>
				<!-- --------------------- -->
			</table>
			<br />

			<!-- form 시작=================== -->
			<form name="order" action="/../user/pay" method="get">
			
			
				<!-- ----------------------------------------------------- -->
				<c:forEach var="oList" items="${omap.oList}">
					<c:if test="${id == oList.prod_id}">
						<input type="hidden" name="totalBuy" id="totalBuy" value="${oi_totalprice + oList.shipping_fee}" />
						<input type="hidden" name="oi_totalprice" id="oi_totalprice" value="${oi_totalprice + oList.shipping_fee}" />
						<input type="hidden" name="ototalPoint" id="ototalPoint" value="<fmt:formatNumber value="${totalBuyPoint}" pattern="####" />" />
						<input type="hidden" name="odeliverPrice" value="${oList.shipping_fee}">
						<input type="hidden" name='point' id='point'  value="<fmt:formatNumber value="${totalmillige}" pattern="####" />"/>
						<input type="hidden" name="m_point" id="m_point" value="<fmt:formatNumber value="${totalmillige}" pattern="####" />"/>
						<input type="hidden" name="oi_amount" value="${oi_amount}" >
						<input type="hidden" name="oi_num" value="<fmt:formatDate value="<%=new java.util.Date()%>" pattern="ss" />" >
						<input type="hidden" name="m_id" value="${omap.mList.m_id}">
						<input type="hidden" name="prod_id" value="${oList.prod_id}">
						<input type="hidden" name="o_code" value="O<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss" />" >
						<!-- hidden /  주문총액과 총 포인트를 전송-------------------- -->
						

						<!-- 마일리지 사용 부가결제금액 -->
						<div id="pointInfo" style="margin-top: 20px;">
							<table class="table table-bordered">
								<!-- 적립금 -->
								<tbody>
									<tr>
										<th width="150px" ><h5>사용가능 적립금</h5></th>
										<td style="padding-left: 10px;">
											<p>
												<input name="opointUse" id="opointUse" type="text"
													class="text-right" value="0" size="10"
													oninput="chkPoint(this,'${omap.mList.m_point}')"> 원
													(사용가능 적립금 : <span style="color: red; font-weight: bold">${omap.mList.m_point}원</span>)
												<input type="button" class="btn btn-a" value="사용하기"  onclick='call()'>
											</p>
											<ul class="info">
												<li>최대 사용금액은 제한이 없습니다.</li>
												<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며<br>[결제하기]
													버튼을 누르면 주문이 완료됩니다.
												</li>
												<li>적립금 사용 시 배송비는 적립금으로 사용 할 수 없습니다.</li>
												<li>적립금 사용 시 해당 상품에 대한 적립금은 적립되지 않습니다.</li>
											</ul>
										</td>
									</tr>
								</tbody>
								
								<!-- 쿠폰 -->

							</table>
						</div>
						  <!-- 배송정보-->                        
                        <table class="table table-bordered" >
                        	<tr>
								<th colspan="2">
								<h5>
								주문자 정보
								</h5>
								</th>
							</tr>
                            <tr>
                                <!-- 이름 -->
                                <td><h5>이름</h5></td>
                                <td class="text-left">
                                <input type="text" size="15" value="${omap.mList.m_name}" name="recipient"></td>
                            </tr>                   
                            <tr>
                                <!-- 전화 번호 -->
                                <td><h5>전화번호</h5></td>
								 <td class="text-left"><input type="text" maxlength="11" size="15"
                                    value="${omap.mList.m_phone}" name="num"></td>
                            </tr>
                            <tr>
                                <!-- 주소 -->
                                <td><h5>주소</h5></td>
								<td class="text-left"><input type="text" size="6" value="${omap.mList.m_postal}" name="post">
                                <br>
                                <input type="text" size="40" value="${omap.mList.m_address}" name="address"> <span class="grid">기본주소</span>
                                <br>
                                <input type="text" size="40" value="${omap.mList.m_addr}" name="addr"> <span class="grid">나머지주소</span></td>
                            </tr>
                            <tbody class="email">
                                <!-- 이메일 -->
                                <tr>
                                    <td><h5>Email</h5></td>
                                    <td class="text-left">
                                    <input type="text" value="${fresult}" name="email">@
                                    <input type="text" name="email2" id="email-auto" value="${eresult}"></td>
                                </tr>
                            </tbody>
                            </table>
                      
						<table class="table table-bordered" >
							<tr>
								<th colspan="2">
								<h5>배송지 선택
								<input type="radio" name="same" onclick="javascript:AutoInput(document.order)">회원정보와 동일
								<input type="radio" class="input-text" name="address" id="ch2" onclick="clearInput()"> 새로운 배송지
								</h5>
								</th>
							</tr>
							
							<tr>
								<td><h5>이름</h5></td>
								 <td class="text-left">
								 <input class="input-text" type="text" size="15" name="o_recipient"></td>
							</tr>
							<tr>
								<td><h5>전화번호</h5></td>
								 <td class="text-left">
								 <input class="input-text" type="text" maxlength="11" size="15" name="o_num"></td>
							</tr>
							<tr>
								<td><h5>주소</h5></td>
								<td class="text-left">
								<input class="input-text" id="sample6_postcode" type="text" size="6" name="o_post">
								<a href="#none" id="btn_search_rzipcode">
								<input type="button" value="검  색" class="btn btn-warning" onclick="sample6_execDaumPostcode()"/>
                                    </a> <br>
                                <input class="input-text" id="sample6_address" type="text" size="40" name="o_address"> <span class="grid">기본주소</span> <br>
                                <input class="input-text" id="sample6_address2" type="text" size="40" name="o_add">
                                <span class="grid">나머지주소</span> <span class="grid ">(선택입력가능)</span>
                                </td>
							</tr>


							 <tbody class="email">
                                <!-- 이메일 -->
                                <tr>
                                <td><h5>Email</h5></td>
                                    <td class="text-left">
                                    <input class="input-text" type="text" name="o_email">@
                                    <input class="input-text" type="text" name="o_email2" id="o_email2">
                                    <select name="email-sel" id="email-sel">
                                            <option value="" selected="selected">- 이메일 선택 -</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="nate.com">nate.com</option>
                                            <option value="hotmail.com">hotmail.com</option>
                                            <option value="yahoo.com">yahoo.com</option>
                                            <option value="empas.com">empas.com</option>
                                            <option value="korea.com">korea.com</option>
                                            <option value="dreamwiz.com">dreamwiz.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="etc">직접입력</option>
                                    </select>
                                        <p>
                                            이메일을 통해 주문처리과정을 보내드립니다.<br>이메일 주소란에는 반드시 수신가능한 이메일주소를
                                            입력해주세요.
                                        </p></td>
                                </tr>
                            </tbody>

							<tr>
								<td><h5>배송시 요청사항</h5></td>
								<td class="text-left">
								<input class="input-text" type="text" name="o_msg"></td>
							</tr>
							
							


							<!-- 결제수단 -->
							<tr>
								<td><h5>결제방법</h5></td>
								<td class="text-left"><input type="radio" name="p_pay"
									checked value="0" onclick="showSelect(this.value)">무통장입금
									<input type="radio" name="p_pay" value="1"
									onclick="showSelect(this.value)">카드 결제 <input
									type="radio" name="p_pay" value="2"
									onclick="showSelect(this.value)">가상계좌 <span id="c1">
										<select name="p_bank" id="bank">
											<option value="1">국민</option>
											<option value="2">우리</option>
											<option value="3">신한</option>
									</select>
								</span> <span id="c2" style="display: none"> <select name="p_bank"
										id="card">
											<option value="1">국민카드</option>
											<option value="2">우리카드</option>
											<option value="3">신한카드</option>
									</select>
								</span> <span id="Payment1">

										<div id="ideposit">
											입금자명<input type="text" size="15"><br>계좌번호 ㈜답인사
											한별 카카오뱅크 3333-03-7503011<br>실제입금자명과 다를경우 확인이 지연될 수 있습니다
										</div>

										<div id="icard" style="display: none">
											최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에
											따라 결제 금액 제한이 있을 수 있습니다.
										</div>
										<div id="ivirtual-account" style="display: none">
											소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.<br>
											<label> <input type="radio" name="Cash-receipt">현금영수증 신청</label>
											<label> <input type="radio" name="Cash-receipt">신청안함</label>
										</div>
										
								</span></td>
							</tr>

    <tr>
								<td colspan="2">
								<input type="checkbox" name="p_save" value='1' id="p_save"/>&nbsp;결제 정보를 저장합니다
							</tr>



							<tr>
								<td colspan="2">
								<input type="submit" value="주문결제"
									class="btn btn-a" /></td>
							</tr>

						</table>
						
					</c:if>
				</c:forEach>
			</form>
			<!-- ============================ -->
			
			
			
			
			<script type="text/javascript">
	$(function(){
		$('#card').prop("disabled", true);
		$('#bank').prop("disabled", false);
	});
	
	function chkPoint(input, mileage){
		var tmpPoint = parseInt(input.value);
		if(tmpPoint>mileage){
			alert("사용 가능한 적립금액 보다 많습니다.");
			input.value="0";
			return;
		}
	}

	function showSelect(pay){
		//alert(pay);
		
		if(pay=='0'){//무통장 입금
			$('#c1').show();
			$('#c2').hide();
			$('#ideposit').show();
			$('#icard').hide();
			$('#ivirtual-account').hide();
			$('#bank').prop("disabled", false);//은행이 서버로 넘어가도록
			$('#card').prop("disabled", true);
		}else if(pay=='1'){
			//카드결제
			$('#c1').hide();
			$('#c2').show();
			$('#icard').show();
			$('#ideposit').hide();
			$('#ivirtual-account').hide();
			$('#card').prop("disabled", false);//카드가 서버로 넘어가도록
			$('#bank').prop("disabled", true);
		}else if(pay=='2'){
			//가상결제
			$('#c1').show();
			$('#c2').hide();
			$('#ivirtual-account').show();
			$('#icard').hide();
			$('#ideposit').hide();
			$('#bank').prop("disabled", false);//은행이 서버로 넘어가도록
			$('#card').prop("disabled", true);
		}
		
	}

				function AutoInput(f) {
					f.o_recipient.value = f.recipient.value;

					f.o_num.value = f.num.value;
					f.o_post.value = f.post.value;
					f.o_address.value = f.address.value;
					f.o_add.value = f.add.value
					f.o_email.value = f.email.value;
					f.o_email2.value = f.email2.value;
				}

				function clearInput() {
					/* 텍스트박스 지우는 부분 */
					var el = document.getElementsByClassName('input-text');
					for (var i = 0; i < el.length; i++) {
						el[i].value = '';
					}
				}
				
                $(document).ready(function(){
                    $("#email-sel").change(function(){
                      console.log($(this).val());
                      $("#o_email2").val($(this).val());
                    });
                  });
                  
                  


			</script>
			
		</div>
	</div>









	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>


	<!-- javascript -->
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="../js/05_jquery.min.js"></script>
	<script type="text/javascript" src="../js/00_common.js"></script>
	<script type="text/javascript" src="../js/order.js"></script>
	<script type="text/javascript" src="../js/01_bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/02_isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="../js/03_jquery.hoverdir.js"></script>
	<script type="text/javascript" src="../js/04_jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="../js/06_jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="../js/07_modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="../js/08_template.js"></script>
	<script type="text/javascript" src="../js/09_unslider-min.js"></script>


</body>

</html>




