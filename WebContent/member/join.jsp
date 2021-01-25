<%@page import="java.net.URLDecoder"%>
<%@ page  contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JSP AJAX 실시간 회원제 채팅 서비스</title>
	<script type="text/javascript">
		function registerCheckFunction(){
			var userID = $('#userID').val();
			$.ajax({
				type:'POST',
				url:'../member/userRegisterCheck',
				data:{userID: userID},//파라미터 변수
				success:function(result){
					if(result==1){
						$('#checkMessage').html('사용할 수 있는 아이디입니다.');
						$('#checkType').attr('class', 'modal-content panel-success');
					} else{
						$('#checkMessage').html('사용할 수 없는 아이디입니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}
					$('#checkModal').modal("show");
				}
			});
		}
		function passwordCheckFunction(){
			var userPassword1=$('#userPassword1').val();
			var userPassword2=$('#userPassword2').val();
			if(userPassword1!=userPassword2){
				$('#passwordCheckMessage').html('비밀번호가 맞지 않습니다.');
			}else{
				$('#passwordCheckMessage').html('');
			}
		}
	</script>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID!=null){
			session.setAttribute("messageType", "오류메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어 있는 상태입니다.");
			response.sendRedirect("../member/index.jsp");
			return;
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
			</button>
			<a class="navbar-brand href="../member/index.jsp">실시간 회원제 채팅 서비스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="../member/index.jsp">메인</a></li>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown" class="active">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="buton" aria-haspopup="true"
							aria-expanded="false">Quotation<span class="caret"></span>
						</a>	
						<ul class="dropdown-menu">
							<li><a href="../quote/boardViewFcl.jsp">Request FCL List</a></li>
							<li><a href="../quote/boardViewLcl.jsp">Request LCL List</a></li>
							<li><a href="../quote/boardViewAero.jsp">Request AERO List</a></li>
						</ul>	
					</li>	
				</ul> 
				<li><a href="../chat/find.jsp">친구찾기</a></li>
				<li><a href="../chat/box.jsp">메시지함<span id="unread" class="label label-info"></span></a></li>
			</ul>
			<%
				if(userID ==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span>
					</a>	
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">로그인</a></li>
						<li class="active"><a href="../member/join.jsp">회원가입</a></li>
					</ul>	
				</li>	
			</ul>
			<%}else{%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
				</li>
			</ul>
			<%}%>
		</div>
	</nav>
	<div class="container">
		<form method="post" action="../member/userRegister">
			<table class="table table-bordered table-hover" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원등록양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userID" name="userID" maxlength="20" placeholder="입력하세요"></td>
						<td style="width:110px;"><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button>
					</tr>
					<tr>
						<td style="width:110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword1" name="userPassword1" type="password" maxlength="20" placeholder="입력하세요"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword2" name="userPassword2" type="password" maxlength="20" placeholder="재입력하세요"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" id="userName" name="userName" type="text" maxlength="20" placeholder="입력하세요"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>나이</h5></td>
						<td colspan="2"><input class="form-control" id="userAge" name="userAge" type="number" maxlength="20" placeholder="입력하세요"></td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>성별</h5></td>
						<td colspan="2">
							<div class="form-group" style="text-align:center; margin:0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="f" checked>f
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="m">m
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width:110px;"><h5>이메일</h5></td>
						<td colspan="2"><input o class="form-control" id="userEmail" name="userEmail" type="email" maxlength="20" placeholder="입력하세요"></td>
					</tr>
					<tr>
						<td style="text-align:left;" colspan="3"><h5 style="color:red;" id="passwordCheckMessage"></h5><input class="btn btn-primary pull-right" type="submit" value="등록"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<%
		String messageContent = null;
		if(session.getAttribute("messageContent")!=null){
			messageContent=(String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType")!=null){
			messageType=(String)session.getAttribute("messageType");
		}
		if(messageContent !=null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
		  <div class="modal-dialog vertical-align-center">
			<div class="modal-content" <%if(messageType.equals("오류메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						<sapn aria-hidden="true">&times</sapn>
						<span class="sr-only">Close</span>	
					</button>
					<h4 class="modal-title">
						<%=messageType%>
					</h4>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		   </div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%	
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
		  <div class="modal-dialog vertical-align-center">
			<div id="checkType" class="modal-content panel-info">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						<sapn aria-hidden="true">&times</sapn>
						<span class="sr-only">Close</span>	
					</button>
					<h4 class="modal-title">
						확인메시지
					</h4>
					<div id="checkMessage" class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		   </div>
		</div>
	</div>
</body>
</html>