<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="lcl" class="quote.LclMgr"/>
<jsp:useBean id="lclbean" class="quote.LclBean"/>
<jsp:setProperty property="*" name="lclbean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		boolean result = lcl.insertLcl(lclbean);
		
		
		
		String msg="등록실패";
		String url = "boardLclWrite.jsp";
		if(result){
			msg="등록성공";
			url="boardLclView.jsp";
		}
		
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>