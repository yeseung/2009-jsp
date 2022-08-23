<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<title>### HAYESEUNG.com ver7.0 ###</title>




<%
String pro = request.getParameter("pro");
%>


<FORM Name='Write' Action='write_input.jsp' Method='post'>
<input type='hidden' name='pro' value='<%=pro%>' class='input'>
  <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td class="ssss">이름&nbsp;</td>
      <td><input type="text" size="70" name="name" class='input'></td>
    </tr>
    <tr>
      <td class="ssss">비번&nbsp;</td>
      <td><input type="text" size="70" name="pass" class='input'></td>
    </tr>
    <tr>
      <td class="ssss">제목&nbsp;</td>
      <td><input type="text" size="70" name="title" class='input'></td>
    </tr>
    <tr>
      <td class="ssss">map&nbsp;</td>
      <td class="ssss"><input type="text" size="59" name="map" class='input'>&nbsp;&nbsp;<a href="map/1.jsp" target="_blank" class="q12345">(지도등록)</a></td>
    </tr>
    <tr>
      <td class="ssss">내용1&nbsp;</td>
      <td><textarea cols="71" rows="4" name="cont1" class='input'></textarea></td>
    </tr>
    <tr>
      <td class="ssss">내용2&nbsp;</td>
      <td><textarea cols="71" rows="4" name="cont2" class='input'></textarea></td>
    </tr>
       
    <tr>
      <td>&nbsp;</td>
      <td></td>
    </tr>
    <tr>
      <td colspan="2" align='center'><input type="submit" name="button" value="Submit"  class='input'></td>
    </tr>
  </table>



</FORM>




