<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<%
String num = request.getParameter("num");
String pro = request.getParameter("pro");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;

String strSQL = "SELECT * FROM plus WHERE p_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));	

strSQL = "DELETE From plus WHERE p_num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));		
pstmt.executeUpdate();


pstmt.close();
//pstmt.close();
conn.close();

response.sendRedirect("listboard.jsp?pro=" + pro);

%>



