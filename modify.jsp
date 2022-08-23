<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<title>### HAYESEUNG.com ver7.0 ###</title>





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




%>
                   

<FORM Name='Modify' Action='modify_output.jsp' Method='POST'>
<input type='hidden' name='pro' value='<%=pro%>' class='input'>
<input type='hidden' name='pro_num' value='<%=pro_num%>' class='input'>
  <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td class="ssss">제목&nbsp;</td>
      <td><input type="text" size="70" name="title" class='input' value="<%=title%>"></td>
    </tr>
    <tr>
      <td class="ssss">내용1&nbsp;</td>
      <td><textarea cols="70" rows="4" name="cont1" class='input'><%=cont1%></textarea></td>
    </tr>
    <tr>
      <td class="ssss">내용2&nbsp;</td>
      <td><textarea cols="70" rows="4" name="cont2" class='input'><%=cont2%></textarea></td>
    </tr>
    <tr>
      <td class="ssss">이름&nbsp;</td>
      <td><input type="text" size="70" name="name" class='input' value="<%=name%>"></td>
    </tr>
    <tr>
      <td class="ssss">지도&nbsp;</td>
      <td><input type="text" size="70" name="map" class='input' value="<%=map%>"></td>
    </tr>
    <tr>
      <td class="ssss">비번&nbsp;</td>
      <td><input type="text" size="70" name="pass" class='input'></td>
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
                 
<%
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

