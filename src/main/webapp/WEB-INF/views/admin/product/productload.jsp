<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상품 불러오기 페이지</title>
    <script type="text/javascript" async="" src="/ind-script/moment.php?convert=F"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NBS7Z7L"></script>
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/mode/easiest/common.css" media="all"
        charset="utf-8">
    <link rel="stylesheet" type="text/css"
        href="/ind-script/optimizer.php?filename=rZNhbsMwCIUPsPzdOdB2kqk3IJgkNHbwwNa0nr5uqvUAE__QE3x6TwBsWhg-Pg2q6WpYAGuFL9PUqcGFXbsRA7k_Gk7RGY22Ra1MQ36HF2EZ4_yjtoP9zXWpSDtcvzvbL9TcVzkcCDMfCe1VvMmx_BfW5XT3VKcuE6lxGGz0yw3nHEd0zkwtFIk0MifRI47Ym5KWmrnF2Zx7a4Eek2DWNW4vWRJbGG5s2OOiYuMqtAf6O9-d3WcMzLxxOc_lDg&amp;type=css&amp;k=5b3213facdfd876bd1824839ecdf29abfda8ad19&amp;t=1622572940">
  <!-- jQUERY 3.4.1 -->
  <script type="text/javascript" src="/admin/js/jquery-3.4.1.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="/admin/js/smarthelper-ui.js" charset="utf-8"></script>
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
                        <h1>상품 불러오기</h1>
                   
                    </div> 
                </div>

                <form action="" method="GET" name="form"
                    id="script_reset">

                    <div class="optionArea" id="QA_list1">
                        <div class="mOption">
                            <table border="1" summary="">
                                <caption>상품 검색</caption>
                                <colgroup>
                                    <col style="width:154px;">
                                    <col style="width:auto;">
                                    <col style="width:154px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">검색분류</th>
                                        <td colspan="3">
                                            <ul class="mForm typeVer" id="eSearchFormGeneral">
                                                <li>
                                                    <select class="fSelect eSearch" name="eField[]">
                                                        <option value="product_name">상품명</option>
                                                        <option value="product_no">상품번호</option>
                                                        <option value="ma_product_code">자체 상품코드</option>
                                                    </select>
                                                    <input type="text" class="fText eSearchText" style="width:500px;"
                                                        value="" name="eValue[]">
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">상품분류</th>
                                        <td colspan="3">
                                            <input type="text" class="fText eSearchText" style="width:500px;"
                                            value="" name="categorys[]">
                                          
                                               
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> 진열상태</th>
                                        <td>
                                            <label class="gLabel eSelected"><input type="radio"
                                                    class="fChk eDisplayStatus" name="display" value="A"
                                                    checked="&quot;checked&quot;"> 전체</label>
                                            <label class="gLabel"><input type="radio" class="fChk eDisplayStatus"
                                                    name="display" value="T"> 진열함</label>
                                            <label class="gLabel"><input type="radio" class="fChk eDisplayStatus"
                                                    name="display" value="F"> 진열안함</label>
                                        </td>
                                        <th scope="row"> 판매상태</th>
                                        <td>
                                            <label class="gLabel eSelected"><input type="radio"
                                                    class="fChk eDisplayStatus" name="selling" value="A"
                                                    checked="&quot;checked&quot;"> 전체</label>
                                            <label class="gLabel"><input type="radio" class="fChk eDisplayStatus"
                                                    name="selling" value="T"> 판매함</label>
                                            <label class="gLabel"><input type="radio" class="fChk eDisplayStatus"
                                                    name="selling" value="F"> 판매안함</label>
                                        </td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                        <div class="mButton gCenter">
                            <a href="#none" class="btnSearch"><span>검색</span></a>
                            <a href="#none" class="btnSearch reset" id="eSearchFormInit"><span>초기화</span></a>
                        </div>
                    </div>

                    <div class="section" id="QA_list2">
                        <div class="mTitle" style="display: none;">
                            <h2>상품 목록</h2>
                            <div class="cTip" code="PR.SM.PL.60"></div>
                        </div>
                        <div class="mState">
                            <div class="gLeft">
                                <p class="total">[총 <strong>#</strong>개]</p>
                            </div>
                            <div class="gRight">
                                <select class="fSelect nob-sel" name="orderby">
                                    <option value="regist_d">등록일 역순</option>
                                    <option value="regist_a">등록일 순</option>
                                    <option value="empty2" disabled="disabled">---------------</option>
                                    <option value="name_d">상품명 역순</option>
                                    <option value="name_a">상품명 순</option>
                                    <option value="empty3" disabled="disabled">---------------</option>
                                    <option value="price_d">판매가 역순</option>
                                    <option value="price_a">판매가 순</option>
                                </select>
                                <select class="fSelect" name="limit">
                                    <option value="10">10개씩보기</option>
                                    <option value="20" selected="selected">20개씩보기</option>
                                    <option value="30">30개씩보기</option>
                                    <option value="50">50개씩보기</option>
                                    <option value="100">100개씩보기</option>
                                </select>
                            </div>
                        </div>
                        <div class="mCtrl typeHeader setting">
                            <!-- [Allinone mode] 유틸 버튼(진열함/판매함/복사/삭제/분류수정 등등) -->

                     
                            <div class="gLeft">
                                <span class="txtLess">
                                    <blank></blank>
                                </span>
                                <a href="#none" class="btnNormal _manage_delete">삭제
                                    <!--삭제 -->
                                </a>
                                <a href="#layerCopy" class="btnNormal _manage_copy">상품복사
                                    <!-- 상품복사-->
                                </a>
                                <span class="bar"></span>
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
                                <a href="newproduct" class="btnCtrl">상품등록</a>

                              
                                </a>
                            </div>

                        
                           
                        </div>
                        <div class="mBoard typeList gScroll gCell">
                            <!--
        항목 추가에따른 th, td 추가시 col도 같이 추가해주세요.
    -->
                            <table border="1" summary="" class="eChkColor">
                                <caption>상품 목록</caption>
                                <colgroup>
                                    <col class="chk">
                                    <!-- 기본 -->
                                    <col style="width:250px">
                                    <col style="width:200px">
                                    <col style="width:200px">
                                    <col style="width:200px">
                                    <col style="width:195px">
                                    <col style="width:321px">
                                    <col class="date">
                                </colgroup>
                                <thead id="product-list-header">
                                    <tr>
                                        <th scope="col"><input type="checkbox" class="allChk"></th>
                                        <!-- 기본 -->
                                        <th scope="col" column-name="product_name">
                                            상품명 </th>
                                        <th scope="col" column-name="product_price">
                                            판매가 </th>
                                        <th scope="col" column-name="display_status">
                                            진열상태 </th>
                                        <th scope="col" column-name="selling_status">
                                            판매상태 </th>
                                        <th colspan="2" scope="colgroup" column-name="order_address">
                                            상품분류
                                        </th>
                                       
                                        <th scope="col" column-name="ins_date">
                                            상품 등록일 </th>
                                    </tr>
                                </thead>
                                
                                    <tbody class="empty">
                                        <tr>
                                            <td colspan="10">검색된 상품내역이 없습니다.</td>
                                        </tr>
                                    </tbody>
                                          
                                
                            </table>
                        </div>
                        <div class="mCtrl typeFooter">
                            <!-- [Allinone mode] 유틸 버튼(진열함/판매함/복사/삭제/분류수정 등등) -->


                            <!-- [Influencer mode]인플루언서 유틸 버튼 -->
                            <div class="gLeft">
                                <span class="txtLess">
                                    <blank></blank>
                                </span>
                                <a href="#none" class="btnNormal _manage_delete">삭제
                                    <!--삭제 -->
                                </a>
                                <a href="#layerCopy" class="btnNormal _manage_copy">상품복사
                                    <!-- 상품복사-->
                                </a>
                                <span class="bar"></span>
                                <div class="mOpen eClick" bindstatus="true">
                                 
                                    <div id="displayOpen2" class="open wPrdOpenDisplay">
                                        <div class="wrap">
                                          
                                        </div>
                                    </div>
                                </div>
                                <div class="mOpen eClick" bindstatus="true">
                                   
                                    <div id="productOpen2" class="open wPrdOpenProduct">
                                        <div class="wrap">
                                            <ul class="default">
                                              
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                              
                              
                               
                            </div>
                            <div class="gRight">
                                <a href="/disp/admin/shop1/Mode/ProductRegister" class="btnCtrl">상품등록</a>
                               
                               
                            </div>


                        </div>
                        <div class="mPaginate">
                            <ol>
                                <li><strong title="현재페이지">1</strong></li>
                            </ol>
                        </div>
                    </div>
                    <div class="mButton gCenter">
                        <a href="#none" class="btnSearch"><span>선택</span></a>
                      
                         <input type="button" class="btnSearch reset" value="창닫기" onClick="window.close()">
                     		
                      
                    
                    </div>
                </form>
               
            </div><!-- //content -->

           

     
            <!-- 참고 : 복사 -->
            <form id="layerCopyForm">
                <div id="layerCopy" class="mLayer gMedium">

                    <h2>상품 복사</h2>
                    <div class="wrap">
                        <div class="mBoard gMedium">
                            <table border="1" summary="">
                                <caption>상품 복사</caption>
                                <tbody>
                                    <tr>
                                        <th scope="row">상품복사 설정</th>
                                        <td>
                                            <ul class="mForm typeVer">
                                                <li><label class="gLabel"><input type="radio"
                                                            class="fChk eProductCopyUseConfig" name="product_copy_use"
                                                            value="F"> 원본상품과 <strong>동일하게 복사</strong></label></li>
                                                <li><label class="gLabel"><input type="radio"
                                                            class="fChk eProductCopyUseConfig" name="product_copy_use"
                                                            value="T"> 복사상품 <strong class="txtEm">진열/판매상태</strong>
                                                        <strong>재설정 후 복사</strong></label></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="mTitle eProductCopySellingArea" style="display:none;">
                            <h3>진열/판매상태 재설정</h3>
                        </div>
                        <div class="mBoard gMedium eProductCopySellingArea" style="display:none;">
                            <table border="1" summary="">
                                <caption>진열/판매상태 재설정</caption>
                                <tbody>
                                    <tr>
                                        <th scope="row">진열상태</th>
                                        <td id="eProductCopyLayerDisplayArea">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">판매상태</th>
                                        <td id="eProductCopyLayerSellingArea">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="mTitle">
                            <h3>상품명 표시설정</h3>
                        </div>
                        <div class="mBox typeBorder">
                            <label><input type="checkbox" class="fChk" name="product_copy_memo" value="T"> 복사 상품 상품명에 복사
                                문구 표시</label>
                        </div>
                    </div>
                    <div class="footer">
                        <a href="#none" class="btnCtrl"><span>복사</span></a>
                        <a href="#none" class="btnNormal eClose"><span>취소</span></a>
                    </div>
                    <button type="button" class="btnClose eClose">닫기</button>
                </div><!-- //참고 -->
            </form>

           

            <!-- 참고 : 상품분류 수정 -->
            <div id="layerProductCategory" class="mLayer gLarge">
                <h2>상품분류 수정</h2>
                <div class="wrap">
                  


        </div>
    </div>
    <script type="text/javascript"
        id="">function getCookie(d) { var a, b = document.cookie.split(";"); for (a = 0; a < b.length; a++) { var c = b[a].substr(0, b[a].indexOf("\x3d")); var e = b[a].substr(b[a].indexOf("\x3d") + 1); c = c.replace(/^\s+|\s+$/g, ""); c == d && dataLayer.push({ event: "modeEvent", modeValue: unescape(e) }) } } getCookie("is_mode");</script>

    <script type="text/javascript" src="//suynthe.cafe24.com/admin/js/jslb_ajax.js" charset="utf-8"></script>
    <script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&amp;domain=admin&amp;v=2112171282"
        charset="utf-8"></script>
    <script type="text/javascript" src="//img.echosting.cafe24.com/js/ec/mode/influencer_suio.min.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="//img.echosting.cafe24.com/js/ec/mode/influencer_ui.js"
        charset="utf-8"></script>

        
        <script> 
        function newTabClick() { 
            window.open(); 
        }

        function closeTabClick() { 
            window.close(); 
            } </script>

       
           
</body>

</html>