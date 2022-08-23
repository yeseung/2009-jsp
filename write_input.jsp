<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<%

String pro = request.getParameter("pro");  
String title = request.getParameter("title");
String map = request.getParameter("map");
String cont1 = request.getParameter("cont1");
String cont2 = request.getParameter("cont2");
String name = request.getParameter("name");
String pass = request.getParameter("pass");

// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

// 날짜
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

Statement stmt = conn.createStatement();
PreparedStatement pstmt = null, pstmt1 = null;

String strSQL = "SELECT Max(numnum) FROM board";
pstmt = conn.prepareStatement(strSQL);
ResultSet rs = pstmt.executeQuery();
int numnum = 1;
if (!rs.wasNull()){
	rs.next();
	numnum = rs.getInt(1) + 1;	
}

strSQL = "SELECT Max(pro_num) FROM board WHERE pro = " + pro;
pstmt = conn.prepareStatement(strSQL);
rs = pstmt.executeQuery();
int pro_num = 1;
if (!rs.wasNull()){
	rs.next();
	pro_num = rs.getInt(1) + 1;	
}

int wread = 0;

strSQL ="INSERT INTO board(pro, pro_num, numnum, wread, wdate, title, cont1, cont2, map, name, pass) VALUES('" + Integer.parseInt(pro) + "', '" + pro_num + "','" + numnum + "','" + wread + "','" + indate + "','" + title + "','" + cont1 + "','" + cont2 + "','" + map + "', '" + name + "', '" + pass + "')";

stmt.executeUpdate(strSQL);

response.sendRedirect("listboard.jsp?pro=" + pro);

rs.close();
pstmt.close();             	
conn.close();
%>


