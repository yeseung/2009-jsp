<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:include page="a_top.jsp" flush="false"/>

<%
String pro = request.getParameter("pro");
String pro_num = request.getParameter("pro_num");



// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM board WHERE pro = ? and pro_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(pro));
pstmt.setInt(2, Integer.parseInt(pro_num));
rs = pstmt.executeQuery();
rs.next();

String title = rs.getString("title");
String cont1 = rs.getString("cont1");
String cont2 = rs.getString("cont2");
String name = rs.getString("name");
String map = rs.getString("map");
String wdate = rs.getString("wdate");
int wread = rs.getInt("wread");
int numnum = rs.getInt("numnum");
String num = rs.getString("num");
%>
<!-- title -->
<title>### HAYESEUNG.com ver7.0 ### <%=title%></title>


<!--- numnum, title, wdate, pro -->
<table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="50" valign="top" class="num" align="right"><%=pro_num%>.</td>
    <td width="5"></td>
    <td>
    
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="title"><%=title%></td>
  </tr>
  <tr>
    <td class="wdate"><%=wdate%> | <jsp:include page="pro2.jsp"><jsp:param name="pro" value="<%=pro%>" /></jsp:include></td>
  </tr>
</table>
    
    </td>
    <td width="50" valign="bottom" align="right"></td>
  </tr>
</table>

<!-- rgb -->
<table width="730" border="0" cellspacing="0" cellpadding="0"  align="center" >
  <tr>
    <td bgcolor="#5E5E5E"></td>
  </tr>
</table>

<!-- copy -->
<table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td align="right"></td>
    <td width="26" align="right"></td>
  </tr>
</table>

<!-- cont -->
<table width="730" border="0" cellspacing="0" cellpadding="0"  align="center" >
  <tr>
    <td>
<%=title%><br>
<%=cont1%><br>
<%=cont2%><br>
<%=name%><br>
<%=map%><br>
    </td>
  </tr>
</table>   
    
<!-- plus write -->
<table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
	<td><%@ include file="plus_2.jsp" %></td>
  </tr>
</table>

<!-- plus list -->
<table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
	<td><jsp:include page="plus_1.jsp" flush="false"><jsp:param name="num" value="<%=num%>"/></jsp:include></td>
  </tr>
</table>

    
<!-- admin -->
    <a href="modify.jsp?pro=<%=pro%>&pro_num=<%=pro_num%>" class="new_comment">수정하기</a> |   
    <a href="delete.jsp?pro=<%=pro%>&pro_num=<%=pro_num%>&num=<%=num%>&numnum=<%=numnum%>" class="new_comment">삭제하기</a> | 
    <a href="write.jsp?pro=<%=pro%>" class="new_comment">새글쓰기</a> |
    <a href="listboard.jsp?pro=<%=pro%>" class="new_comment">목록보기</a>



<%
strSQL = "UPDATE board SET wread=wread+1 WHERE pro = ? and pro_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(pro));
pstmt.setInt(2, Integer.parseInt(pro_num));
pstmt.executeUpdate();

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	conn.close();
}
%>


<jsp:include page="a_bottom.jsp" flush="false"/>


