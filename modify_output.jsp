<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>


<%
int pro_num  = Integer.parseInt(request.getParameter("pro_num"));
int pro  = Integer.parseInt(request.getParameter("pro"));
String title = request.getParameter("title");
String map = request.getParameter("map");
String cont1 = request.getParameter("cont1");
String cont2 = request.getParameter("cont2");
String name = request.getParameter("name");
String pass = request.getParameter("pass");



// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt = null;

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

pstmt = conn.prepareStatement("UPDATE board SET title=?, cont1=?, cont2=?, map=?, name=?, pass=? WHERE pro=? and pro_num=?");

pstmt.setString(1, title);
pstmt.setString(2, cont1);
pstmt.setString(3, cont2);
pstmt.setString(4, map);
pstmt.setString(5, name);
pstmt.setString(6, pass);
//pstmt.setInt(18, 0);
pstmt.setInt(7, pro);
pstmt.setInt(8, pro_num);
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("listboard.jsp?pro=" + pro);
%>

