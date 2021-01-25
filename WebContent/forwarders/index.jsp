<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
	%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JSP AJAX 실시간 회원제 채팅 서비스</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function getUnread(){
			$.ajax({
				type:"POST",
				url:"../chatting/chatUnreadt",
				data:{
					userID:encodeURIComponent('<%=userID%>'),
				},
				success : function(result){
					if(result>=1){
						showUnread(result);
					}else{
						showUnread('');//결과값 출력 안함
					}
				}
			});
			
		}
		function getInfiniteUnread(){
			setInterval(function(){
				getUnread();
			},4000);//4초마다 한번씩
		}
		function showUnread(result){
			$('#unread').html(result);
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
			</button>
			<a class="navbar-brand" href="../member/index.jsp">실시간 회원제 채팅 서비스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="../member/index.jsp">메인</a></li>
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
						data-toggle="dropdown" role="buton" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span>
					</a>	
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">로그인</a></li>
						<li><a href="../member/join.jsp">회원가입</a></li>
					</ul>	
				</li>	
			</ul>
			<%
				}else{ 
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="../member/update.jsp">회원정보수정</a></li>
						<li><a href="../member/profileUpdate.jsp">프로필수정</a></li>
						<li><a href="../member/logoutAction.jsp">로그아웃</a></li>
					</ul>	
				</li>	
			</ul>
			<%
				 }
			%>
		</div>
	</nav>
	
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
	<%
		if(userID!=null){
	%>
		<script type="text/javascript">
			$(document).ready(function(){
				getInfiniteUnread();
			});
		</script>
	<%
		}
	%>
</body>
</html>