<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품 목록</title>
<script type="text/javascript" async=""
	src="/ind-script/moment.php?convert=F"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script async=""
	src="https://www.googletagmanager.com/gtm.js?id=GTM-NBS7Z7L"></script>
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css"
	media="all" charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="/ind-script/optimizer.php?filename=rZNhbsMwCIUPsPzdOdB2kqk3IJgkNHbwwNa0nr5uqvUAE__QE3x6TwBsWhg-Pg2q6WpYAGuFL9PUqcGFXbsRA7k_Gk7RGY22Ra1MQ36HF2EZ4_yjtoP9zXWpSDtcvzvbL9TcVzkcCDMfCe1VvMmx_BfW5XT3VKcuE6lxGGz0yw3nHEd0zkwtFIk0MifRI47Ym5KWmrnF2Zx7a4Eek2DWNW4vWRJbGG5s2OOiYuMqtAf6O9-d3WcMzLxxOc_lDg&amp;type=css&amp;k=5b3213facdfd876bd1824839ecdf29abfda8ad19&amp;t=1622572940">
<!-- jQUERY 3.4.1 -->
<script type="text/javascript" src="/admin/js/jquery-3.4.1.min.js"
	charset="utf-8"></script>
<script type="text/javascript" src="/admin/js/smarthelper-ui.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.icoShop {
	display: none
}
</style>
<!--초기화버튼-->
<script type="text/javascript">
        $(document).ready(function() {
    
            $("#eSearchFormInit").click(function() {
                $("#script_reset").each(function() {
                    this.reset();
                });
            });
            
            $(".open wPrdOpenDisplay").click(function(){
                
            });
        });
        
    </script>
<!-- 체크박스 클릭, 전체클릭, 삭제버튼 -->

</head>
<body class="">

	<hr class="layout">
	<div id="container" class="">
		<!--  class="snbHidden" -->


		<hr class="layout">

		<!-- Content Start -->
		<div id="content">
			<div class="headingArea">
				<div class="mTitle">
					<h1>상품 목록</h1>

				</div>
			</div>

			<form action="" method="GET" name="form" id="script_reset">

				<div class="optionArea" id="QA_list1">
					<div class="mOption">
						<table border="1" summary="">
							<caption>상품 검색</caption>
							<colgroup>
								<col style="width: 154px;">
								<col style="width: auto;">
								<col style="width: 154px;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색분류</th>
									<td colspan="3">
										<ul class="mForm typeVer" id="eSearchFormGeneral">
											<li><select class="fSelect eSearch"
												name="plsearchOption">
													<option value="prodname">상품명</option>
													<option value="prodid">상품번호</option>
													<option value="adminprodcode">자체 상품코드</option>
											</select> <input type="text" class="fText eSearchText"
												style="width: 500px;" value="" name="plkeyword"></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">상품분류</th>

									<td colspan="3"><select class="fSelect"
										id="eProductSearchType" name="plsearchOption2"
										style="width: 110px;">
											<option value="prodcategry" selected="selected">분류명</option>
									</select> <input type="text" class="fText eSearchText"
										style="width: 500px;" value="" name="plkeyword2"></td>
								</tr>
								<tr>
									<th scope="row">진열상태</th>
									<td><label class="gLabel eSelected"><input
											type="radio" class="fChk eDisplayStatus" name="display"
											value="A" checked="&quot;checked&quot;"> 전체</label> <label
										class="gLabel"><input type="radio"
											class="fChk eDisplayStatus" name="display" value="T">
											진열함</label> <label class="gLabel"><input type="radio"
											class="fChk eDisplayStatus" name="display" value="F">
											진열안함</label></td>
									<th scope="row">판매상태</th>
									<td><label class="gLabel eSelected"><input
											type="radio" class="fChk eDisplayStatus" name="selling"
											value="A" checked="&quot;checked&quot;"> 전체</label> <label
										class="gLabel"><input type="radio"
											class="fChk eDisplayStatus" name="selling" value="T">
											판매함</label> <label class="gLabel"><input type="radio"
											class="fChk eDisplayStatus" name="selling" value="F">
											판매안함</label></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="mButton gCenter">
						<input type="submit" id="search_button" class="btnSearch"
							value="검색" /> <a href="#none" class="btnSearch reset"
							id="eSearchFormInit"><span>초기화</span></a>
					</div>
				</div>

				<div class="section" id="QA_list2">
					<div class="mTitle" style="display: none;">
						<h2>상품 목록</h2>
						<div class="cTip" code="PR.SM.PL.60"></div>
					</div>
					<div class="mState">
						<div class="gLeft">
							<p class="total">
								[총 <strong>${map.count}</strong>개]
								
							</p>
						</div>
						<div class="gRight">
							<!--  <select class="fSelect nob-sel" name="orderby">
								<option value="regist_d">등록일 역순</option>
								<option value="regist_a">등록일 순</option>
								<option value="empty2" disabled="disabled">---------------</option>
								<option value="name_d">상품명 역순</option>
								<option value="name_a">상품명 순</option>
								<option value="empty3" disabled="disabled">---------------</option>
								<option value="price_d">판매가 역순</option>
								<option value="price_a">판매가 순</option>
							</select> <select class="fSelect" name="limit">
								<option value="10">10개씩보기</option>
								<option value="20" selected="selected">20개씩보기</option>
								<option value="30">30개씩보기</option>
								<option value="50">50개씩보기</option>
								<option value="100">100개씩보기</option>-->
							</select>
						</div>
					</div>
					<div class="mCtrl typeHeader setting">
						<!-- [Allinone mode] 유틸 버튼(진열함/판매함/복사/삭제/분류수정 등등) -->


						<div class="gLeft">
							<span class="txtLess"> <blank></blank>
							</span>
							<button type="button" id="deleteValue"
								class="btnNormal _manage_delete" onclick="pdeleteValue();">
								<span>삭제</span>
							</button>

							<!--삭제 -->
							<!--  </a> <a href="#layerCopy" class="btnNormal _manage_copy">상품복사 <!-- 상품복사-->-->
							</a> <span class="bar"></span>
							<div class="mOpen eClick" bindstatus="true">

								<div id="displayOpen1" class="open wPrdOpenDisplay">
									<div class="wrap">
										<ul class="default">

										</ul>
									</div>
								</div>
							</div>
							<div class="mOpen eClick" bindstatus="true">

								<div id="productOpen1" class="open wPrdOpenProduct">
									<div class="wrap">
										<ul class="default">

										</ul>
									</div>
								</div>
							</div>



						</div>
						<div class="gRight">
							<a href="newproduct" class="btnCtrl">상품등록</a> </a>
						</div>



					</div>
					<div id="shipedReadyList"
						class="mBoard typeOrder gScroll gCellSingle typeList"
						style="text-align: center;">
						<!--
        항목 추가에따른 th, td 추가시 col도 같이 추가해주세요.
    -->
						<table border="1" summary="" class="thead">
							<caption>상품 목록</caption>

							<thead id="product-list-header">
								<tr>
									<th scope="col" class="w35"><input type="checkbox"
										class="chkall" onclick="allCheck(this);"></th>
									<!-- 기본 -->
									<th scope="col" style="width: 200px">상품명</th>
									<th scope="col" style="width: 100px">상품코드</th>
									<th scope="col" style="width: 150px">판매가</th>
									<th scope="col" style="width: 180px">진열상태</th>
									<th scope="col" style="width: 180px">판매상태</th>
									<th scope="col" style="width: 405px">상품분류</th>

									<th scope="col" style="width: 165px">상품 등록일</th>
								</tr>
							</thead>
							<c:forEach items="${map.plList}" var="plList">
								<c:choose>
									<c:when test="${plList != null}">
										<tbody>
											<tr>
												<td scope="col" class="w35"><input type="checkbox"
													name="RowCheck" id="RowCheck" value="${plList.pid}" /></td>

												<td scope="col" style="width: 200px;">${plList.prodname}</td>
												<td scope="col" style="width: 100px;">${plList.pid}</td>
												<td scope="col" style="width: 150px;">${plList.retailprice}</td>
												<td scope="col" style="width: 180px;">${plList.saledp}</td>
												<td scope="col" style="width: 180px;">${plList.buyrightoff}</td>
												<td scope="col" style="width: 405px;">${plList.prodcategry}</td>
												<td scope="col" style="width: 165px;">${plList.registrationdate}</td>





											</tr>
										</tbody>
									</c:when>
									<c:otherwise>
										<tbody class="empty">
											<tr>
												<td colspan="10">검색된 상품내역이 없습니다.</td>
											</tr>
										</tbody>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</table>
					</div>
					<div class="mCtrl typeFooter">

						<div class="gLeft">

							<button type="button" id="plCancelBtn"
								class="btnNormal _manage_delete">
								<span>삭제</span>
							</button>




						</div>
						<div class="gRight">
							<a href="newproduct" class="btnCtrl">상품등록</a>


						</div>


					</div>
					<!-- 페이징 -->
					<div class="paging" style="text-align: center; margin-top: 10px;">${paging}</div>
				</div>
			</form>
		</div>
	</div>




</body>

<!-- 전체선택 가능 -->
<script type="text/javascript">

function allCheck(chkall)  {
    const checkboxes 
         = document.getElementsByName("RowCheck");
    console.log("asdasdasdasdasdasd" + checkboxes);
    checkboxes.forEach((checkbox) => {
      checkbox.checked = chkall.checked;
    })
  };
</script>

<!-- 삭제 버튼 -->
<script type="text/javascript">

function pdeleteValue() {
    var url = "/admin/pdelete";
    var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    
    for (var i = 0; i < list.length; i++) {
       if(list[i].checked){
          console.log(valueArr);
          valueArr.push(list[i].value);
       }
    }
    if (valueArr.length == 0) {
       alert("선택된 고객이 없습니다.");
    }
    else{
       var check = confirm("정말 삭제하시겠습니까? 삭제된 고객은 다시 복구할 수 없습니다.");
       	
       $.ajax({
          url : url,
          type : 'post',
          traditional : true,
          data : {
             valueArr : valueArr
          },
          success: function(jdata){
             if(jdata = 1){
                alert("삭제 성공");
                location.replace("productlist")
             }
             else{
                alert("삭제 실패");
             }
          },
       
          error: function(error){
             alert(JSON.stringify(error));
          }
       });
    }
 
 };
</script>

</html>