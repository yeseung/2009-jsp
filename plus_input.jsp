<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<%
int num = Integer.parseInt(request.getParameter("num"));
String pro = request.getParameter("pro");
String pro_num = request.getParameter("pro_num");

String p_name = request.getParameter("p_name");  
String p_cont = request.getParameter("p_cont");
String p_pass = request.getParameter("p_pass");
String p_rec = request.getParameter("p_rec");

if(p_name == ""){
%>
<script language='javascript'>
alert('작성자를 입력하세요.');
history.back();
</script>
<%
}else if(p_cont == ""){
%>
<script language='javascript'>
alert('글내용을 입력하세요.');
history.back();
</script>
<%
}else if(p_pass == ""){
%>
<script language='javascript'>
alert('비밀번호를 입력하세요.');
history.back();
</script>
<%
}else{


Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");

Statement stmt = conn.createStatement();

PreparedStatement pstmt1 = null;

try {

//
String strSQL = "SELECT Max(p_del) FROM plus where p_num = " + num;
//

pstmt1 = conn.prepareStatement(strSQL);
ResultSet rs = pstmt1.executeQuery();
int del = 1;

if (!rs.wasNull()){
	rs.next();
	del = rs.getInt(1) + 1;	
}

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + ".";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

strSQL ="INSERT INTO plus (p_num, p_name, p_cont, p_date, p_del, p_pass, p_rec)";
strSQL = strSQL +  "VALUES('" + num + "', '" + p_name + "',";
strSQL = strSQL +  "'" + p_cont + "', '" + indate + "', '" + del + "', '" + p_pass + "', '" + p_rec + "')";
stmt.executeUpdate(strSQL);

//response.sendRedirect("write_output.jsp?pro=" + pro + "&pro_num=" + pro_num + "&num=" + num);
response.sendRedirect("listboard.jsp?pro=" + pro);
//response.sendRedirect("s.jsp?num=" + num);
//response.sendRedirect("write_output.jsp?num=" + num);

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
pstmt1.close();
stmt.close();
conn.close();
}

}//else

%>
