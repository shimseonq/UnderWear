<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content_search section" data-dss-logarea="x5b">
		<div class="contents03">
			<div id="header">
				<h3>택배배송 조회</h3>
			</div>
			<div class="contents03_sub">
				<link rel="stylesheet" type="text/css"
					href="https://ssl.pstatic.net/sstatic/keypage/outside/scui/delivery/css/cs_delivery_170313.css">
				<div id="_doorToDoor" class="cs_delivery">
					<div class="sch_box ">
						<div class="selc">
							<select class="_select" title="택배사 선택"
								onChange="tCR(nco_area_2000547+'.select', 1, '88147988_0000001E86A3');">
								<option>택배사를 선택해주세요.</option>
								<option data-code="04" data-name="CJ대한통운">CJ대한통운</option>
								<option data-code="01" data-name="우체국택배">우체국택배</option>
								<option data-code="05" data-name="한진택배">한진택배</option>
								<option data-code="08" data-name="롯데택배">롯데택배</option>
								<option data-code="06" data-name="로젠택배">로젠택배</option>
								<option data-code="54" data-name="홈픽택배">홈픽택배</option>
								<option data-code="39" data-name="드림택배">드림택배</option>
								<option data-code="24" data-name="CVSnet 편의점택배">CVSnet
									편의점택배</option>
								<option data-code="46" data-name="CU 편의점택배">CU 편의점택배</option>
								<option data-code="23" data-name="경동택배">경동택배</option>
								<option data-code="22" data-name="대신택배">대신택배</option>
								<option data-code="11" data-name="일양로지스">일양로지스</option>
								<option data-code="32" data-name="합동택배">합동택배</option>
								<option data-code="18" data-name="건영택배">건영택배</option>
								<option data-code="17" data-name="천일택배">천일택배</option>
								<option data-code="20" data-name="한덱스">한덱스</option>
								<option data-code="16" data-name="한의사랑택배">한의사랑택배</option>
								<option data-code="12" data-name="EMS">EMS</option>
								<option data-code="13" data-name="DHL">DHL</option>
								<option data-code="25" data-name="TNT Express">TNT
									Express</option>
								<option data-code="14" data-name="UPS">UPS</option>
								<option data-code="21" data-name="Fedex">Fedex</option>
								<option data-code="26" data-name="USPS">USPS</option>
								<option data-code="34" data-name="i-Parcel">i-Parcel</option>
								<option data-code="33" data-name="DHL Global Mail">DHL
									Global Mail</option>
								<option data-code="37" data-name="범한판토스">범한판토스</option>
								<option data-code="29" data-name="에어보이익스프레스">에어보이익스프레스</option>
								<option data-code="28" data-name="GSMNtoN">GSMNtoN</option>
								<option data-code="38" data-name="APEX(ECMS Express)">APEX(ECMS
									Express)</option>
								<option data-code="30" data-name="KGL네트웍스">KGL네트웍스</option>
								<option data-code="40" data-name="굿투럭">굿투럭</option>
								<option data-code="45" data-name="호남택배">호남택배</option>
								<option data-code="41" data-name="GSI Express">GSI
									Express</option>
								<option data-code="44" data-name="SLX">SLX</option>
								<option data-code="47" data-name="우리한방택배">우리한방택배</option>
								<option data-code="52" data-name="세방">세방</option>
							</select>
						</div>
						<div class="_inputWrapper inp">
							<input type="text" id="numb" title="운송장번호 입력"
								class="_input in_bx" value=""
								onblur="tCR(nco_area_2000547+'.input', 1, '88147988_0000001E86A3');">
							<span class="_placeholder nm_exam" style="display: block">운송장
								번호를 -없이 입력해주세요. </span> <input type="image" title="조회"
								src="https://ssl.pstatic.net/sstatic/keypage/outside/info/btn_delivery_search.gif"
								class="_submit sc_btn">
						</div>
					</div>
					<div class="_output"></div>
					<div>
						<div class="_infoWrapper rsult_box" style="display: none">
							<p class="lodg">
								<span class="_loading" style="display: none"><img
									src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/delivery/img/ico_loading.gif"
									width="21" height="21" alt="">정보를 불러오는 중입니다.</span> <span
									class="_error" style="display: none"> <span>정보를
										불러올 수 없습니다. 잠시후 다시 시도해 주세요.</span> <span class="rfsh_ico"><img
										src="https://ssl.pstatic.net/sstatic/keypage/outside/scui/delivery/img/ico_re.png"
										width="8" height="11" alt="">
										<a onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&r=1&a='+nco_area_2000547+'.refresh&i='+'88147988_0000001E86A3');"
										href="#">새로고침</a></span>
								</span> <span class="_notFounding" style="display: none"> <span>운송장이
										등록되지 않았거나<br>업체에서 상품 준비중입니다.
								</span>
								</span> <span class="_badCode" style="display: none"> <span>올바르지
										않은 송장번호 입니다.<br>송장번호를 확인해 주세요.
								</span>
								</span> <span class="_loading" style="display: none"> <span
									class="inque"></span>
								</span>
							</p>
						</div>
						<p class="ginfo">본 정보는 스마트택배에서 제공받는 정보로, 실제 배송상황과 다를 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/template" id="_doorToDoorInfoProduction"> {if sUrl != "" || sTelNumber != ""} <span class="_productionInfo inque">{if sUrl != ""}<a nocr onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&r=1&a='+nco_area_2000547+'.homepage&i='+'88147988_0000001E86A3');" href="{= sUrl}" target="_blank">{= sProduction} 홈페이지</a>{/if}{if sTelNumber != ""} {if sUrl != ""}({/if}문의전화 : {= sTelNumber}{if sUrl != ""}){/if}{/if}</span> {/if} </script>
	<script type="text/template" id="_doorToDoorInfoList"> <div class="rsult_box"> <dl class="ste"> <dt class="blind">배송단계</dt> <dd> <ol class="list_state"> <li class="step1 {if level==2}on{/if}">상품인수</li> <li class="step2 {if level==3}on{/if}">상품 이동중</li> <li class="step3 {if level==4}on{/if}">배달지 도착</li> <li class="step4 {if level==5}on{/if}">배달출발</li> <li class="step5 {if level==6}on{/if}">배달완료</li> </ol> </dd> <dt class="blind">현재 내 상품상태</dt> <dd class="blind">{if level==2}상품인수{elseif level==3}상품 이동중{elseif level==4}배달지 도착{elseif level==5}배달출발{elseif level==6}배달완료{/if}</dd> </dl> </div> {if receiverName != "" || receiverAddr != "" || senderName != "" || htProduction.sUrl != "" || htProduction.sTel != ""} <div class="subinfo"> {if receiverName != "" || receiverAddr != "" || senderName != ""} <dl class="usr_info"> {if receiverName != "" || receiverAddr != ""}<dt>받는 분 :</dt><dd> {=receiverName} {if receiverName != "" && receiverAddr != ""}/ {/if}{=receiverAddr} {if (receiverName != "" || receiverAddr != "") && senderName != ""}<span class="bar"></span>{/if}</dd>{/if} {if senderName != ""}<dt>보내는 분 :</dt><dd> {=senderName}</dd>{/if} </dl> {/if} {if htProduction.sUrl != "" || htProduction.sTel != ""} <div class="ofer"> {if htProduction.sUrl != ""}<a nocr onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&r=1&a='+nco_area_2000547+'.homepage&i='+'88147988_0000001E86A3');" href="{=htProduction.sUrl}" target="_blank">{=htProduction.sName} 홈페이지</a>{/if} {if htProduction.sTel != ""} {if htProduction.sUrl != ""}({/if}문의전화 : {=htProduction.sTel}{if htProduction.sUrl != ""}){/if}{/if} </div> {/if} </div> {/if} <div class="artb"> {if trackingDetails.length > 0} <table> <caption>배송처리 현황</caption> <colgroup> <col style="width:146px"> <col style="width:150px"> <col> </colgroup> <thead> <tr> <th scope="col">처리일시</th> <th scope="col">현재위치</th> <th scope="col">배송상태</th> </tr> </thead> <tbody> {for nIndex:htItem in trackingDetails} <tr {if nIndex==0}class="on"{/if}> <td><p>{=htItem.timeString}</p></td> <td><p>{=htItem.where}</p></td> <td><p>{=htItem.kind}</p></td> </tr> {/for} </tbody> </table> {/if} </div> </script>
	<script>
		(function() {
			nhn.common.nco_area_name(nco_area_p130);
			nhn.common
					.load_js(
							"https://ssl.pstatic.net/sstatic/au/pc/doorToDoor/nhn.search.doorToDoor_180612.js",
							function() {
								var aProduction = [
										{
											sName : "CJ대한통운",
											sCode : "04",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-1255",
											sUrl : "https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.cj',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "우체국택배",
											sCode : "01",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-1300",
											sUrl : "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.post',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "한진택배",
											sCode : "05",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-0011",
											sUrl : "http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.hanjin', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "롯데택배",
											sCode : "08",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-2121",
											sUrl : "https://www.lotteglogis.com/home/personal/inquiry/track",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.hd',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "로젠택배",
											sCode : "06",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-9988",
											sUrl : "http://d2d.ilogen.com/d2d/delivery/invoice_tracesearch_quick.jsp?slipno=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.logen', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "홈픽택배",
											sCode : "54",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1800-0987",
											sUrl : "http://tracking.zoommaok.com/zoomma/tracking.php?invoice=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.homepick', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "드림택배",
											sCode : "39",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-0123",
											sUrl : "http://www.idreamlogis.com/delivery/delivery_result.jsp?item_no=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.kg',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "CVSnet 편의점택배",
											sCode : "24",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1577-1287",
											sUrl : "http://www.cvsnet.co.kr/postbox/m_delivery/local/local.jsp?invoice_no=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.cvsnet', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "CU 편의점택배",
											sCode : "46",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1577-1287",
											sUrl : "https://www.cupost.co.kr/postbox/delivery/localResult.cupost?invoice_no=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.CU',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "경동택배",
											sCode : "23",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1899-5368",
											sUrl : "http://kdexp.com/basicNewDelivery.kd?barcode=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.kd',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "대신택배",
											sCode : "22",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "https://www.ds3211.co.kr/freight/internalFreightSearch.ht?billno=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.ds',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "일양로지스",
											sCode : "11",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-0002",
											sUrl : "http://www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.ilyang', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "합동택배",
											sCode : "32",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1899-3392​",
											sUrl : "http://www.hdexp.co.kr/basic_delivery.hd?barcode=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.hdong', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "건영택배",
											sCode : "18",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "http://www.kunyoung.com/goods/goods_01.php?mulno=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.kunyoung', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "천일택배",
											sCode : "17",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "http://www.chunil.co.kr/HTrace/HTrace.jsp?transNo=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.chunil', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "한덱스",
											sCode : "20",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-9040",
											sUrl : "http://www.hanjin.co.kr/Logistics_html",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.handex', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "한의사랑택배",
											sCode : "16",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1600-1055",
											sUrl : "http://www.hanips.com/html/sub03_03_1.html?logicnum=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.hani',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "EMS",
											sCode : "12",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-1300",
											sUrl : "http://service.epost.go.kr/trace.RetrieveEmsTrace.postal?ems_gubun=E&POST_CODE=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.ems',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "DHL",
											sCode : "13",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-0001",
											sUrl : "http://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.dhl',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "TNT Express",
											sCode : "25",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-0588",
											sUrl : "http://www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.tnt',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "UPS",
											sCode : "14",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1588-6886",
											sUrl : "https://wwwapps.ups.com/WebTracking/track?track=yes&loc=ko_kr&trackNums=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.ups',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "Fedex",
											sCode : "21",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "080-023-8000",
											sUrl : "http://www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.fedex', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "USPS",
											sCode : "26",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "https://tools.usps.com/go/TrackConfirmAction?tLabels=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.usps',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "i-Parcel",
											sCode : "34",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "https://tracking.i-parcel.com/Home/Index?trackingnumber=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.iparcel', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "DHL Global Mail",
											sCode : "33",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "http://webtrack.dhlglobalmail.com/?trackingnumber=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.dhlgm', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "범한판토스",
											sCode : "37",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "032-744-1530",
											sUrl : "http://totprd.pantos.com/jsp/gsi/vm/popup/notLoginTrackingListExpressPoPup.jsp?quickType=HBL_NO&quickNo=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.pantos', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "에어보이익스프레스",
											sCode : "29",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "070-8269-9906",
											sUrl : "http://www.airboyexpress.com/Tracking/Tracking.aspx?__EVENTTARGET=ctl00$ContentPlaceHolder1$lbtnSearch&__EVENTARGUMENT=__VIEWSTATE:/wEPDwUKLTU3NTA3MDQxMg9kFgJmD2QWAgIDD2QWAgIED2QWBGYPDxYCHgdWaXNpYmxlaGRkAgYPDxYCHwBnZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFHWN0bDAwJExvZ2luQm94MSRjaGtSZW1lbWJlcklkjCvraDtQ455JitQo4U0BQdPEr7wzy+m2bGEbieoyfXw=&__VIEWSTATEGENERATOR=6F6BB0AF&ctl00$LoginBox1$txbLoginEmail=&ctl00$LoginBox1$txbLoginPassword=&ctl00$ContentPlaceHolder1$txbShipping=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.airboy', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "GSMNtoN",
											sCode : "28",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1599-6862",
											sUrl : "http://www.gsmnton.com/gsm/handler/Tracking-OrderList?searchType=TrackNo&trackNo=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.gsm',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "APEX(ECMS Express)",
											sCode : "38",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1800-8629",
											sUrl : "http://www.apexglobe.com",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.apex',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "KGL네트웍스",
											sCode : "30",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "",
											sUrl : "http://www.hydex.net/ehydex/jsp/home/distribution/tracking/tracingView.jsp?InvNo=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.kgl',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "굿투럭",
											sCode : "40",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1899-9767",
											sUrl : "http://www.goodstoluck.co.kr/#modal",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.good',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "호남택배",
											sCode : "45",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "031-376-6070",
											sUrl : "http://honamlogis.co.kr",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.honam', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "GSI Express",
											sCode : "41",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "070-8680-2430",
											sUrl : "http://www.gsiexpress.com/track_pop.php?track_type=ship_num&query_num=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.GSI Express', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "SLX",
											sCode : "44",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1544-6482",
											sUrl : "http://slx.co.kr/delivery/delivery_number.php?param1=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547 + '.SLX',
														1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "우리한방택배",
											sCode : "47",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1577-5210",
											sUrl : "http://www.realsystem.co.kr/wooritb/search/s_search.asp?f_slipno=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(
														nco_area_2000547
																+ '.woori', 1,
														'88147988_0000001E86A3');
											}
										},
										{
											sName : "세방",
											sCode : "52",
											sInputType : "text",
											nMaxLength : -1,
											sPlaceholderText : "",
											sTel : "1800-8564",
											sUrl : "https://delivery.sebang.com/sdelivery/guest/trace/trace.xhtml?DISPATCH_NOTE_NO=(invoiceNo)",
											aRxCondition : [],
											fnClickLog : function() {
												tCR(nco_area_2000547
														+ '.sebang', 1,
														'88147988_0000001E86A3');
											}
										} ];
								new nhn.search.doorToDoor.Controller(
										{
											elBase : $("_doorToDoor"),
											aProductionList : aProduction,
											htAPI : {
												sURL : "https://m.search.naver.com/p/csearch/ocontent/util/headerjson.nhn",
												htDynamicValue : {
													sCode : "",
													sInvoice : ""
												},
												htParam : {
													callapi : "parceltracking",
													t_code : "{sCode}",
													t_invoice : "{sInvoice}",
													passportKey : "f3cd05aeaf9234a388604f4d673adbfc2f303825"
												}
											}
										});
							}, false, 150);
		}());
	</script>
	<script
		src="https://ssl.pstatic.net/adimg3.search/adpost/js/event_tracker.js"></script>

</body>
</html>