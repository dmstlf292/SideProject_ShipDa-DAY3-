<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="fcl" class="quote.FclMgr"/>
<jsp:useBean id="fclbean" class="quote.FclBean"/>
<jsp:setProperty property="*" name="fclbean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		boolean result = fcl.insertFcl(fclbean);
		
		
		
		String msg="��Ͻ���";
		String url = "boardFclWrite.jsp";
		if(result){
			msg="��ϼ���";
			url="boardFclView.jsp";
		}
		
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>