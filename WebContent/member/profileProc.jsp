<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="fmgr" class="member.ProfileMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		boolean result = false;
		String msg = "Error";
		if(flag.equals("insert")){
			result = fmgr.insertProfile(request);
			if(result) msg = "Completed";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "index.jsp";
</script>