<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 게시판 삭제 </TITLE>

<link  rel="stylesheet" href="s.css" type="text/css" />

<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>



</HEAD>

<BODY>

<%
String num = request.getParameter("num");
String p_del = request.getParameter("p_del");
%>
<br><br>
<Form Action='plus_delete_input.jsp' Method='post'>                 
<input type='hidden' name='num' value='<%=num%>'>
<input type='hidden' name='p_del' value='<%=p_del%>'>
<TABLE border='0' width='211' align='center'>
	<TR>
		<TD width="54" align='center' class="ssss">PASS</TD>
		<TD width="120"><input type='password' name='p_pass' size=20 maxlength=20  class='input'></TD>
		<TD width="112"><input type='submit' value='확인'  class='input'>	 	</TD>
   	</TR>
</TABLE>                                
</FORM>

</BODY>
</HTML>