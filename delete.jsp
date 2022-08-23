<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<%
String pro = request.getParameter("pro"); 
String pro_num = request.getParameter("pro_num");
String num = request.getParameter("num");
String numnum = request.getParameter("numnum");

// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT * FROM board WHERE pro = ? and pro_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(pro));
pstmt.setInt(2, Integer.parseInt(pro_num));

rs = pstmt.executeQuery();
rs.next();

strSQL = "DELETE From board WHERE pro = ? and pro_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(pro));
pstmt.setInt(2, Integer.parseInt(pro_num));
pstmt.executeUpdate();

strSQL = "UPDATE board SET pro_num = pro_num - 1 WHERE pro = ? and pro_num > ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(pro));
pstmt.setInt(2, Integer.parseInt(pro_num));
pstmt.executeUpdate();

strSQL = "UPDATE board SET numnum = numnum - 1 WHERE numnum > ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(numnum));
pstmt.executeUpdate();
	
	
response.sendRedirect("delete_plus.jsp?num=" + num + "&pro=" + pro);	
//response.sendRedirect("listboard.jsp?pro=" + pro);

rs.close();
pstmt.close();
conn.close();
%>


