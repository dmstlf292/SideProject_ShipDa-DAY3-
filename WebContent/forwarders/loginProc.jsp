<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="forwarders.ForwardersMemberMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String password = request.getParameter("password");
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  
	  boolean result = mMgr.loginMember(id, password);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  }
%>
<script>
	alert("<%=msg%>");
	location.href = "../quote/boardFclView.jsp";
</script>