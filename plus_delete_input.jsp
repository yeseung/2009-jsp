<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num"); 
String p_pass = request.getParameter("p_pass");
String p_del = request.getParameter("p_del");


// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT p_pass FROM plus WHERE p_num = ? and p_del = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.setInt(2, Integer.parseInt(p_del));
rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("p_pass").trim();
if (p_pass.equals(goodpass)){
	strSQL = "DELETE From plus WHERE p_num = ? and p_del = ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.setInt(2, Integer.parseInt(p_del));
	pstmt.executeUpdate();
	
	strSQL = "UPDATE plus SET p_del = p_del - 1 WHERE p_num = ? and p_del > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.setInt(2, Integer.parseInt(p_del));
	pstmt.executeUpdate();
    
    response.sendRedirect("time.jsp");
}else{
	response.sendRedirect("time1.jsp");
}

rs.close();
pstmt.close();
conn.close();


%>
