<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%

String num = request.getParameter("num"); 
Connection conn = null;
Statement stmt = null;
try {
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
  conn.setAutoCommit(false);

  stmt = conn.createStatement();
  
  String sql = "SELECT * FROM plus WHERE p_num = " + num + " ORDER BY num DESC";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){

	String p_name = rs.getString("p_name");
	String p_cont = rs.getString("p_cont");
	String p_date = rs.getString("p_date");
	String p_del = rs.getString("p_del");
	String p_rec = rs.getString("p_rec");
	
%> 
  <tr>
    <td width="103" height="10" align="center" class="plus_name"><%=p_name%></td>
    <td class="plus_cont"><%=p_cont%></td>
    <td width="100" align="right" class="plus_date"><%=p_date%></td>
    <td width="1"><a href="#" onClick="MM_openBrWindow('plus_delete_pass.jsp?num=<%=num%>&p_del=<%=p_del%>','','scrollbars=yes,width=300,height=100')"><img src="images/m_4.gif"></a></td>
    <td><%=p_rec%></td>
  </tr>
<%
	}
	rs.close();
	stmt.close();
	conn.close();
}catch(SQLException ex){ }
%>   
</table>
<br>
