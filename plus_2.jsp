<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<FORM Name="Plus" Action="plus_input.jsp" Method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="pro" value="<%=pro %>">
<input type="hidden" name="pro_num" value="<%=pro_num %>">
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td align="center">
<input name="p_name" type="text" size="14" maxlength="10" class="input">
<input name="p_cont" type="text" size="89" maxlength="70" class="input">
<input name="p_pass" type="password" size="10" maxlength="10" class="input">
<input name="p_rec" type="radio" value="1" checked="checked"/>
<input name="p_rec" type="radio" value="2" />
<input name="p_rec" type="radio" value="3" />
<input name="p_rec" type="radio" value="4" />
<input name="p_rec" type="radio" value="5" />
<input type="submit" name="button" value="Comment" class="input">
    </td>
  </tr>
</table>
</FORM>
