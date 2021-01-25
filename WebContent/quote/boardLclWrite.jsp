<%@page import="quote.SUtilMgr"%>
<%@page import="quote.LclBean"%>
<%@page import="forwarders.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="lcl" class="quote.LclMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		/* int width = lbean.getWidth();
		int llength = lbean.getLlength();
		int height = lbean.getHeight();
		int packageCount = lbean.getPackageCount();
		int totalCBM = (width*llength*height)*packageCount; */
		
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������ ���Թ��� ������ Ship-da</title>
	<link rel="stylesheet" href="assets/plugins/css/plugins.css">	
    <link href="assets/css/style.css" rel="stylesheet">
	<link href="assets/css/responsiveness.css" rel="stylesheet"><link id="jssDefault" rel="stylesheet" href="assets/css/skins/default.css">
	</head>
	<body>
		<nav class="navbar navbar-default navbar-mobile navbar-fixed light bootsnav">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="index-2.html">
						<img src="assets/img/logo.png" class="logo logo-display" alt="">
						<img src="assets/img/logo.png" class="logo logo-scrolled" alt="">
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbar-menu">
				
					<ul class="nav navbar-nav navbar-left" data-in="fadeInDown" data-out="fadeOutUp">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle">Home</a>
						</li>
						
						<li class="dropdown megamenu-fw"><a href="#" class="dropdown-toggle" data-toggle="dropdown">�ǽð� ���� ��ȸ</a>
							<ul class="dropdown-menu megamenu-content" role="menu">
								<li>
									<div class="row">
										<div class="col-menu col-md-3">
											<div class="content">
												<ul class="menu-col">
													<li><a href="boardFclWrite.jsp">FCL�����Ƿ�</a></li>
													<li><a href="boardLclWrite.jsp">LCL�����Ƿ�</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</li>
						
						<li class="dropdown megamenu-fw"><a href="#" class="dropdown-toggle" data-toggle="dropdown">�����Ƿ� ����Ʈ</a>
							<ul class="dropdown-menu megamenu-content" role="menu">
								<li>
									<div class="row">
										<div class="col-menu col-md-3">
											<div class="content">
												<ul class="menu-col">
													<li><a href="boardFclView.jsp">FCL�����Ƿ� ����Ʈ</a></li>
													<li><a href="boardLclView.jsp">LCL�����Ƿ� ����Ʈ</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</li>
						<li>
							<a href="../forwarders/pricing.jsp">������ ����ϱ�</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="br-right"><a href="javascript:void(0)"  data-toggle="modal" data-target="#signin"><i class="login-icon ti-user"></i>Login</a></li>
					</ul>
				</div>
			</div>   
		</nav>
		<div class="page-title image-title" style="background-image:url(assets/img/banner.jpg);">
			<div class="container">
				<div class="page-title-wrap">
				<h2>LCL�����Ƿ�</h2>
				<p><a href="#" class="theme-cl">Home</a> | <span>LCL</span></p>
				</div>
			</div>
		</div>
		<section class="gray-bg">
			<div class="container">
				<div class="row">
					<div class="simple-tab-style">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#User" aria-controls="home" role="tab" data-toggle="tab"><i class="ti-user"></i>�ǽð� ������ȸ</a></li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="User">
								
								
								
								
							  <form name="regFrm" method="post" action="boardLclProc.jsp">
								<div class="simple-accordion">
									<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
										
										
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="title1">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#accordion" href="#col1" aria-expanded="true" aria-controls="col1">
														��ۼ��� �� ��������
													</a>
												</h4>
											</div>
											<div id="col1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="title1">
												<div class="panel-body">
													</br>
													<div align="center">
														<h5>LCL : Less than container loaded�� ���ڷ�, ���Ա���� �ϳ��� �����̳ʸ� ���� ���Ա���� �Բ� ����ϴ� ���� �ǹ��մϴ�.</h5>
													</div>
													</br>
													<div class="col-md-12">
														<p>
															<label>��������</label>
															<select class="wide form-control" name="incoterms">
																<option value="CFR">CFR</option>
																<option value="CIF">CIF</option>
																<option value="CIP">CIP</option>
																<option value="CPT">CPT</option>
																<option value="DAP">DAP</option>
																<option value="DDP">DDP</option>
																<option value="EXW">EXW</option>
																<option value="FCA">FCA</option>
																<option value="FOB">FOB</option>
															</select>
														</p>
													</div>
													<div class="col-md-6">
														<p>
															<label>����� ����</label>
															<input type="text" class="form-control" placeholder="enter" name="departure" required>
														</p>
														<p>
															<label>��� port</label>
															<input type="text"  class="form-control" placeholder="enter" name="port" required>
														</p>
														<p>
															<label>����� ���� ���ּ� �Է�</label>
															<input type="text"  class="form-control" placeholder="enter"  name="address">
														</p>
														<p>
															<label>����� ������ �ױ�</label>
															<input type="text"class="form-control" placeholder="enter"  name="transit">
														</p>
													</div>	
													<div class="col-md-6">
														<p>
															<label>������ ����</label>
															<input type="text" class="form-control" placeholder="enter"  name="arrive" required>
														</p>
														<p>
															<label>���� port</label>
															<input type="text"  class="form-control" placeholder="enter" name="aport" required>
														</p>
														<p>
															<label>������ ���� ���ּ� �Է�</label>
															<input type="text"  class="form-control" placeholder="enter"  name="aAddress">
														</p>
														<p>
															<label>������ ������ �ױ�</label>
															<input type="text"class="form-control" placeholder="enter"  name="aTransit">
														</p>
													</div>
												</div>
											</div>
										</div>
										
										
										
										
										
										
										
										
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="title2">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#col2" aria-expanded="false" aria-controls="col2">
														ȭ������ �Է�
													</a>
												</h4>
											</div>
											<div id="col2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="title2">
												<div class="panel-body">
													<div class="col-md-3">
														
														<p>
															<label>���� TYPE</label>
															<select class="wide form-control" name="packingType">
																<option value="Pallets">Pallets</option>
																<option value="Boxes">Boxes</option>
																<option value="Cartons">Cartons</option>
																<option value="Crates">Crates</option>
																<option value="Drums">Drums</option>
																<option value="Bags">Bags</option>
																<option value="Bales">Bales</option>
																<option value="Bundles">Bundles</option>
																<option value="Cans">Cans</option>
																<option value="Carboys">Carboys</option>
																<option value="Carpets">Carpets</option>
																<option value="Cases">Cases</option>
																<option value="Coils">Coils</option>
																<option value="Cylinders">Cylinders</option>
																<option value="Loose">Loose</option>
																<option value="Pails">Pails</option>
																<option value="Reels">Reels</option>
																<option value="FRolls">Rolls</option>
																<option value="Tubes">Tubes</option>
																<option value="Pipes">Pipes</option>
																<option value="Other">Other</option>
															</select>
														</p>
														<p>
															<label>����</label>
															<input type="number" maxlength="255" class="form-control" placeholder="mm�� ���ڸ� �Է��ϼ���"  name="width" required>
														</p>
														<p>
															<label>����</label>
															<input type="number" maxlength="255" class="form-control" placeholder="mm�� ���ڸ� �Է��ϼ���"  name="llength" required>
														</p>
														<p>
															<label>����</label>
															<input type="number" maxlength="255" class="form-control" placeholder="mm�� ���ڸ� �Է��ϼ���"  name="height" required>
														</p>
													</div>
													<div class="col-md-3">
														<p>
															<label>ǰ��</label>
															<input type="text" class="form-control" placeholder="enter"  name="item" required>
														</p>
														<p>
															<label>���Ǵ���</label>
															<select class="wide form-control" name="volumeUnit">
																<option value="MM">MM</option>
															</select>
														</p>
														
													</div>
													<div class="col-md-3">
														<p>
															<label>���蹰</label>
															<select class="wide form-control" name="danger">
																<option value="NO">NO</option>
																<option value="YES">YES</option>
															</select>
														</p>
														<p>
															<label>�߷�</label>
															<input type="number" maxlength="255" class="form-control" placeholder="���ڸ� �Է��ϼ���"  name="volume"  required>
														</p>
														<p>
															<label>�߷�����</label>
															<select class="wide form-control" name="weightUnit">
																<option value="TON">TON</option>
																<option value="KG">KG</option>
															</select>
														</p>
														
													</div>
													<div class="col-md-3">
														<p>
															<label>2�� ����</label>
															<select class="wide form-control" name="stackable">
																<option value="NO">NO</option>
																<option value="YES">YES</option>
															</select>
														</p>
														<p>
															<label>�������</label>
															<input type="number" maxlength="255" class="form-control" placeholder="���ڸ� �Է��ϼ���"  name="packageCount" required>
														</p>
														
													</div>
												</div>
											</div>
										</div>
										
										
										
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="title3">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#col3" aria-expanded="false" aria-controls="col3">
														üũ����Ʈ
													</a>
												</h4>
											</div>
											<div id="col3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="title3">
												<div class="panel-body">
													</br>
													<div>
														<h5> * LSS : ����Ȳ��������� ���������� �߻��ϴ� ����Դϴ�. ��������� �����ڰ� �����մϴ�.</h5>
														<h5> * Ocean Surcharge : �ػ���� ��, ���������� �߻��ϴ� �ػ���� �߰����(BAF,CAF,CRS)�� �ǹ��մϴ�.</h5>
														<h5> * ���� �δ��� : ���� ��, ���� �ױ�/���׿��� �߻��ϴ� ���(THC, WFG ��)�� �ǹ��մϴ�.</h5>
													</div>
													</br>
													
													<div class="col-md-4">
														<p>
															<label>LSS</label>
															<select class="wide form-control" name="lss">
																<option value="Not Included">Not Included</option>
																<option value="Include">Include</option>
															</select>
														</p>
													</div>
													<div class="col-md-4">
														<p>
															<label>Ocean Surcharge</label>
															<select class="wide form-control" name="surcharge">
																<option value="Not Included">Not Included</option>
																<option value="Include">Include</option>
															</select>
														</p>
													</div>
													<div class="col-md-4">
														<p>
															<label>���� �δ���</label>
															<select class="wide form-control" name="extra">
																<option value="Not Included">Not Included</option>
																<option value="Include">Include</option>
															</select>
														</p>
													</div>
													
													</br>
													<div class="col-md-12">
														<h4>�ʿ��� ������ �������ּ���.</h4>
													</div>
													
													</br>
													<div class="col-md-12">
														<p>
															<label>���� �δ���</label>
															<input type="radio" name="client" value="Customs Broker" autocomplete="off" checked>Customs Broker&nbsp;&nbsp;&nbsp;
															<input type="radio" name="client" value="Insurance" autocomplete="off">Insurance
														</p>
													</div>
													
													</br>
													<div class="col-md-12">
														<h5> * �������������� ��� ȭ�� ���� �� �ݾ׿� ������� 1ȸ 30,000��(VAT ����)�� û���˴ϴ�.</h5>
														<h5> * �ػ�/�װ� ��� �߻� �ø� ����Ͽ� �����ϴ� �����Դϴ�. ��������� ����ǰ���� * 110% * 0.03%���� ����˴ϴ�.</h5>
													</div>
												</div>
												
											</div>
										</div>
										
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="title4">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#col4" aria-expanded="false" aria-controls="col4">
														����� CBM
													</a>
												</h4>
											</div>
											<div id="col4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="title4">
												<div class="panel-body">
													<div class="col-md-4">
														<p>
															<label>����� �� CBM</label>
															<input type="number" maxlength="255" class="form-control" name="cbm" value="" >
														</p>
													</div>	
												</div>
											</div>
										</div>
										
									</div>
									 <input type="submit" value="���" class="btn theme-btn"> 
								</div>
								</form>
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- =========== End All Hotel In Grid View =================== -->
			
		<!-- ============== Before Footer ====================== -->
		<section class="before-footer bt-1 bb-1">
			<div class="container-fluid padd-0 full-width">
			
				<div class=" col-md-2 col-sm-2 br-1 mbb-1">
					<div class="data-flex">
						<h4>Contact Us!</h4>
					</div>
				</div>
				
				<div class="col-md-3 col-sm-3 br-1 mbb-1">
					<div class="data-flex text-center">
					53 Boulevard Victor Hugo 44200 Nantes, France
					</div>
				</div>
				
				<div class="col-md-3 col-sm-3 br-1 mbb-1">
					<div class="data-flex text-center">
						<span class="d-block mrg-bot-0">06 52 52 20 30</span>
						<a href="#" class="theme-cl"><strong>hello@gmail.com</strong></a>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-4 padd-0">
					<div class="data-flex padd-0">
						<ul class="social-share">
							<li><a href="#"><i class="fa fa-facebook theme-cl"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus theme-cl"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter theme-cl"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin theme-cl"></i></a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</section>
		<div class="modal fade" id="signin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" id="myModalLabel1">
					<div class="modal-body">
						<div class="text-center"><img src="assets/img/logo.png" class="img-responsive" alt=""></div>
						
						<!-- Nav tabs -->
						<ul class="nav nav-tabs nav-advance theme-bg" role="tablist">
							<li class="nav-item active">
								<a class="nav-link" data-toggle="tab" href="#employer" role="tab">
								<i class="ti-user"></i> Employer</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#candidate" role="tab">
								<i class="ti-user"></i> Candidate</a>
							</li>
						</ul>
						<!-- Nav tabs -->
							
						<!-- Tab panels -->
						<div class="tab-content">
						
							<!-- Employer Panel 1-->
							<div class="tab-pane fade in show active" id="employer" role="tabpanel">
								<form>
									
									<div class="form-group">
										<label>User Name</label>
										<input type="text" class="form-control" placeholder="User Name">
									</div>
									
									<div class="form-group">
										<label>Password</label>
										<input type="password" class="form-control" placeholder="*********">
									</div>
									
									<div class="form-group">
										<span class="custom-checkbox">
											<input type="checkbox" id="4">
											<label for="4"></label>Remember me
										</span>
										<a href="#" title="Forget" class="fl-right">Forgot Password?</a>
									</div>
									<div class="form-group text-center">
										<button type="button" class="btn theme-btn full-width btn-m">LogIn </button>
									</div>
									
								</form>
								
								<div class="log-option"><span>OR</span></div>
								
								<div class="row mrg-bot-20">
									<div class="col-md-6">
										<a href="#" title="" class="fb-log-btn log-btn"><i class="fa fa-facebook"></i>Sign In With Facebook</a>
									</div>
									<div class="col-md-6">
										<a href="#" title="" class="gplus-log-btn log-btn"><i class="fa fa-google-plus"></i>Sign In With Google+</a>
									</div>
								</div>
					
							</div>
							<!--/.Panel 1-->
							
							<!-- Candidate Panel 2-->
							<div class="tab-pane fade" id="candidate" role="tabpanel">
								<form>
									
									<div class="form-group">
										<label>User Name</label>
										<input type="text" class="form-control" placeholder="User Name">
									</div>
									
									<div class="form-group">
										<label>Password</label>
										<input type="password" class="form-control" placeholder="*********">
									</div>
									
									<div class="form-group">
										<span class="custom-checkbox">
											<input type="checkbox" id="4">
											<label for="4"></label>Remember me
										</span>
										<a href="#" title="Forget" class="fl-right">Forgot Password?</a>
									</div>
									<div class="form-group text-center">
										<button type="button" class="btn theme-btn full-width btn-m">LogIn </button>
									</div>
									
								</form>
								
								<div class="log-option"><span>OR</span></div>
								
								<div class="row mrg-bot-20">
									<div class="col-md-6">
										<a href="#" title="" class="fb-log-btn log-btn"><i class="fa fa-facebook"></i>Sign In With Facebook</a>
									</div>
									<div class="col-md-6">
										<a href="#" title="" class="gplus-log-btn log-btn"><i class="fa fa-google-plus"></i>Sign In With Google+</a>
									</div>
								</div>
								
							</div>
							<!--/.Panel 2-->
							
						</div>
						<!-- Tab panels -->
					</div>
				</div>
			</div>
		</div>   
		<!-- End Sign Up Window -->
		
		<!-- Switcher -->
		<button class="w3-button w3-teal w3-xlarge w3-right" onclick="openRightMenu()"><i class="spin theme-cl fa fa-cog" aria-hidden="true"></i></button>
		<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right" style="display:none;right:0;" id="rightMenu">
		  <button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large theme-bg">Close &times;</button>
		   <ul id="styleOptions" title="switch styling">
				<li>
					<a href="javascript: void(0)" class="cl-box cl-default" data-theme="skins/default"></a>
				</li>
				<li>
					<a href="javascript: void(0)" class="cl-box cl-red" data-theme="skins/red"></a>
				</li>
				<li>
					<a href="javascript: void(0)" class="cl-box cl-green" data-theme="skins/green"></a>
				</li>
				<li>
					<a href="javascript: void(0)" class="cl-box cl-blue" data-theme="skins/blue"></a>
				</li>
				<li>
					<a href="javascript: void(0)" class="cl-box cl-pink" data-theme="skins/pink"></a>
				</li>
				<li>
					<a href="javascript: void(0)" class="cl-box cl-purple" data-theme="skins/purple"></a>
				</li>
			</ul>
		</div>
		<!-- /Switcher -->
		 
		<!-- =================== START JAVASCRIPT ================== -->
		<script src="assets/plugins/js/jquery.min.js"></script>
		<script src="assets/plugins/js/bootstrap.min.js"></script>
		<script src="assets/plugins/js/viewportchecker.js"></script>
		<script src="assets/plugins/js/bootsnav.js"></script>
		<script src="assets/plugins/js/slick.min.js"></script>
		<script src="assets/plugins/js/jquery.nice-select.min.js"></script>
		<script src="assets/plugins/js/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/js/jquery.downCount.js"></script>
		<script src="assets/plugins/js/freshslider.1.0.0.js"></script>
		<script src="assets/plugins/js/moment.min.js"></script>
		<script src="assets/plugins/js/daterangepicker.js"></script>
		<script src="assets/plugins/js/wysihtml5-0.3.0.js"></script>
		<script src="assets/plugins/js/bootstrap-wysihtml5.js"></script>
		
		<!-- Dashboard Js -->
		<script src="assets/plugins/js/jquery.slimscroll.min.js"></script>
		<script src="assets/plugins/js/jquery.metisMenu.js"></script>
		<script src="assets/plugins/js/jquery.easing.min.js"></script>
 
		<!-- Custom Js -->
		<script src="assets/js/custom.js"></script>
		
		<script src="assets/js/jQuery.style.switcher.js"></script>
		<script>
			function openRightMenu() {
				document.getElementById("rightMenu").style.display = "block";
			}
			function closeRightMenu() {
				document.getElementById("rightMenu").style.display = "none";
			}
		</script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#styleOptions').styleSwitcher();
			});
		</script>
	
    </body>

</html>