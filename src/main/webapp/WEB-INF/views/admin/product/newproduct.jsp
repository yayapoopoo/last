<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

<style>
.css-textarea {

    margin-bottom: 10px;
}
.bsbs {
	width: 80px; 
  height: 30px;
  text-align: center;
  font-size: 10px;
}

</style>
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" async="" src="/ind-script/moment.php?convert=F"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NBS7Z7L"></script>
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css" media="all"
        charset="utf-8">
    <link rel="stylesheet" type="text/css"
        href="/ind-script/optimizer.php?filename=rZNhbsMwCIUPsPzdOdB2kqk3IJgkNHbwwNa0nr5uqvUAE__QE3x6TwBsWhg-Pg2q6WpYAGuFL9PUqcGFXbsRA7k_Gk7RGY22Ra1MQ36HF2EZ4_yjtoP9zXWpSDtcvzvbL9TcVzkcCDMfCe1VvMmx_BfW5XT3VKcuE6lxGGz0yw3nHEd0zkwtFIk0MifRI47Ym5KWmrnF2Zx7a4Eek2DWNW4vWRJbGG5s2OOiYuMqtAf6O9-d3WcMzLxxOc_lDg&amp;type=css&amp;k=5b3213facdfd876bd1824839ecdf29abfda8ad19&amp;t=1622572940">
 
		<script type="text/javascript" src="dist/js/check.js"></script>
		<script type="text/javascript" src=""></script>
	
	

		<title>상품 등록</title>

	</head>

	<body>


		<div class="jumbotron" style="padding: 10px 10px;">
			<form name="NewProduct" action="setnewproduct" class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="container" style="margin-left: 0%;">

					<!--Content Header (Page header)-->
					<section class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="headingArea" style="margin: 0 0 10px;
								padding-top: 0; padding-left: 20px;" >
									<div class="mTitle">
										<h1>상품 등록</h1>
									
									</div> 
								</div>
								<div class="col-sm-6">
							
								</div>
							</div>
						</div>
					</section>
					<!-- Main content -->
				</div>


				<div class="container" style="margin-left: 0%;">
					<section class="content">

						<div class="container-fluid">


							<div class="con-12">
								<div id="accordion">
									<div class="card">
										<div class="card-header" id="headingOne">
											<h5 class="mb-0">
												<button class="btn btn-link " data-toggle="collapse"
													data-target="#collapseOne" aria-expanded="true"
													aria-controls="collapseOne" type="button">
													<h3>상품 등록</h3>
												</button>
											</h5>
										</div>

										<div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
											data-parent="#accordion">
											<div class="card-body">
												<div class="card-body" style="display: block;">
													<!-- card body-->

													<div class="row">
														<label class="col-sm-2">상품명</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" id="prod_name" name="prod_name" class="form-control">
														</div>
													</div>

													<div class="row">
														<label class="col-sm-2">소비자가</label>
														<div class="com-sm-3 css-textarea" >
															<input type="text" id="retail_price" name="retail_price" class="form-control">
														</div>
														<h3 class="font-weight-light">원</h3>
										
													</div>
													<div class="row">
														<label class="col-sm-2">과세율</label>
														<div class="com-sm-3 css-textarea" >
															<input type="text" name="taxrates" id="taxrates" class="form-control">
														</div>
														<h3>%</h3>
													</div>
													<div class="row">
														<label class="col-sm-2">분류</label>
														<div class="com-sm-3 css-textarea" >
															<input type="text" name="prod_categry" id="prod_categry" class="form-control">
														</div>
													</div>

													<div class="row">
														<label class="col-sm-2">자체 상품 코드</label>
														<div class="com-sm-3 css-textarea" >
															<input type="text" id="admin_prod_code" name="admin_prod_code" class="form-control">
															
														</div>
														<input type="button"
																class="btn btn-dark btn-sm bsbs Check" value="중복확인" onclick="icheck()">
														
													</div>

													<div class="row">
														<label class="col-sm-2">상품 요약설명</label>
														<div class="com-sm-5 css-textarea" >
															<textarea name="prod_summary_ex" id="prod_summary_ex" cols="30" rows="2"
																class="form-control"></textarea>
														</div>
													</div>
													<div class="row">
														<label class="col-sm-2">상품 간략설명</label>
														<div class="com-sm-5 css-textarea">
															<textarea name="prod_briefly_ex" id="prod_briefly_ex" cols="50" rows="3"
																class="form-control"></textarea>
														</div>
													</div>
													<div class="row">
														<label class="col-sm-2">상품 상세설명</label>
														<div class="com-sm-5 css-textarea">
															<textarea name="prod_detail_ex" id="prod_detail_ex" cols="500" rows="10"
																class="form-control"></textarea>
														</div>
													</div>

													<div class="row filebox">
														<label class="col-sm-2">상품 이미지</label>
														<div class="com-sm-5 css-textarea">
														
														</div>
														
														<div>
															<input type="file" name="files" id="file" class="upload-name" multiple>
															
				<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
				<input type="hidden" id="filecheck"
					value="0" name="fileCheck">
			</div>
														</div>
														
													</div>

												</div>

											</div>
										</div>
									</div>
								</div>
								<hr style="color:#999999;border-style:dotted">

								<div id="accordion">
									<div class="card">
										<div class="card-header" id="headingTwo">
											<h5 class="mb-0">
												<button class="btn btn-link collapsed " data-toggle="collapse"
													data-target="#collapseTwo" aria-expanded="false"
													aria-controls="collapseTwo" type="button">
													<h3>쇼핑몰 진열 설정</h3>
												</button>
											</h5>
										</div>
										<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
											data-parent="#accordion">
											<div class="card-body">
												<div class="card-body" style="display: block;">
													<!-- card body-->

													<div class="row">
														<label class="col-sm-2">진열 상태</label>
														<div class="com-sm-5">
															<input type="radio" name="sale_dp" value="진열함"> 진열함
															<input type="radio" name="sale_dp" value="진열안함">
															진열안함
														</div>
													</div>
													<div class="row">
														<label class="col-sm-2">판매 상태</label>
														<div class="com-sm-5">
															<input type="radio" name="buy_rightoff" value="판매함"> 판매함
															<input type="radio" name="buy_rightoff" value="판매안함">
															판매안함
														</div>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
								<hr style="color:#999999;border-style:dotted">
								<div id="accordion">
									<div class="card">
										<div class="card-header" id="headingThree">
											<h5 class="mb-0">
												<button class="btn btn-link collapsed" data-toggle="collapse"
													data-target="#collapseThree" aria-expanded="false"
													aria-controls="collapseThree" type="button">
													<h3>판매 정보</h3>
												</button>
											</h5>
										</div>
										<div id="collapseThree" class="collapse" aria-labelledby="headingThree"
											data-parent="#accordion">
											<div class="card-body">
												<div class="card-body" style="display: block;">
													<!-- card body-->

													<div class="row">
														<label class="col-sm-2">공급가</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="price" id="price" class="form-control">
														</div>
														<h3 class="font-weight-light">원</h3>
													</div>
													<div class="row">
														<label class="col-sm-2">특별회원가</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="special_member_price" id="special_member_price" class="form-control">
														</div>
														<h3 class="font-weight-light">원</h3>
													</div>
													<div class="row">
														<label class="col-sm-2">배송비</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="shipping_fee" id="shipping_fee" class="form-control">
														</div>
														<h3 class="font-weight-light">원</h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr style="color:#999999;border-style:dotted">
								<div id="accordion">
									<div class="card">
										<div class="card-header" id="headingTwo">
											<h5 class="mb-0">
												<button class="btn btn-link collapsed" data-toggle="collapse"
													data-target="#collapseFoue" aria-expanded="false"
													aria-controls="collapseFoue" type="button">
													<h3>제작 정보</h3>
												</button>
											</h5>
										</div>
										<div id="collapseFoue" class="collapse" aria-labelledby="headingFoue"
											data-parent="#accordion">
											<div class="card-body">
												<div class="card-body" style="display: block;">
													<!-- card body-->

													<div class="row">
														<label class="col-sm-2">상품소재</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="prod_meterial" id="prod_meterial" class="form-control">
														</div>
													</div>

													<div class="row">
														<label class="col-sm-2">공급사</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" id="supplier" name="supplier" class="form-control">
														</div>
													</div>
													<div class="row">
														<label class="col-sm-2">제조사</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="making_company" id="making_company" class="form-control">
														</div>
													</div>

													<div class="row">
														<label class="col-sm-2">제조일자</label>
														<div class="com-sm-3 css-textarea">
															<input type="date" name="making_date" id="making_date" value="" min="" max="">
														</div>
													</div>
													<div class=" row">
														<label class="col-sm-2">원산지</label>
														<div class="com-sm-3 css-textarea">
															<input type="text" name="making_contry" id="making_contry" class="form-control">
														</div>
													</div>
												</div>

											</div>
					</section>
					<div class="row">
						<div class="col"></div>
						<div class="btn-group btn-group-lg col-8" role="group" aria-label="Basic example">
							<button type="submit" class="btn btn-primary" value="상품등록"
								onclick="CheckAddProduct()">상품등록</button>
								<!--  <button type="button" class="btn btn-primary" 
							onClick="window.open('preview','미리보기페이지','width=900, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
							미리보기</button>
							<button type="button" class="btn btn-primary" 
							onClick="window.open('productload','상품불러오기페이지','width=900, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
							상품 불러오기</button>-->
							
						</div>
					</div>
			</form>
		</div>






	</body>

<script type="text/javascript">
//업로드할 파일을 선택하면 'upload-name' 요소에
//파일 이름을 출력하고, 'fileCheck' 요소의 value를
//1로 변경
$("#file").on("change", function(){
	//파일 입력창에서 선택한 파일 목록 가져오기
	var files = $("#file")[0].files;
	console.log(files);
	
	var fileName = "";
	
	if(files.length > 1){//하나 이상의 파일 선택 시
		fileName = files[0].name + " 외 " 
			+ (files.length - 1) + "개";
	}
	else if(files.length == 1){
		fileName = files[0].name; 
	}
	
	$(".upload-name").val(fileName);
	
	//fileCheck 부분 변경
	if(fileName == ""){//파일 취소 시.
		$("#filecheck").val(0);
		$(".upload-name").val("파일선택");
	}
	else {//파일 선택 시.
		$("#filecheck").val(1);
	}
});
</script>
	</html>