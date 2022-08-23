<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<title>### HAYESEUNG.com ver7.0 ###</title>
<%
String pro = request.getParameter("pro");


// mysql 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
Statement stmt = conn.createStatement();
ResultSet rs = null;

String listSql="SELECT * FROM board WHERE pro = " + pro + " ORDER BY pro_num DESC";
String pageCountQuery = "select count(1) from board WHERE pro = " + pro;

int view_rows = 0;
String proa = "10";
if(pro.equals(proa)){
	view_rows =1;
}else{
	view_rows =3;
}

int total_pages =1;
int tpage=1;

String url = "listboard.jsp?pro=" + pro + "&tpage=";

if (!"ok".equals(request.getParameter("fullview")) && request.getParameter("tpage") != null) //전체보기
   tpage = Integer.parseInt(request.getParameter("tpage"));

if (!"ok".equals(request.getParameter("fullview")))
   listSql += " limit "+((tpage-1)*view_rows)+","+view_rows;
   

%>	

<%	
	    rs = stmt.executeQuery(listSql);
			
		int numz=1;

		if (!"ok".equals(request.getParameter("fullview")))
       	numz = ((tpage-1)*view_rows)+1;
				
		while(rs.next()){
		
		int pro_num = rs.getInt("pro_num");
		String title = rs.getString("title");
		String cont1 = rs.getString("cont1");
		String cont2 = rs.getString("cont2");
		String name = rs.getString("name");
		String map = rs.getString("map");
		String wdate = rs.getString("wdate");
		int wread = rs.getInt("wread");
		//String pro = rs.getString("pro");
		String num = rs.getString("num");
		String numnum = rs.getString("numnum");

%>

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
    <td width="50" valign="bottom" align="right"><a href="write_output.jsp?pro=<%=pro%>&pro_num=<%=pro_num%>">&gt;</a></td>
  </tr>
</table>

<!-- rgb -->
<table width="730" border="0" cellspacing="0" cellpadding="0"  align="center" >
  <tr>
    <td bgcolor="#5E5E5E"><img src="images/bin.gif" width="1" height="1"></td>
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

<br>
<br>
<br>
<%
		numz++;
		}
%>	 
<!-- 12345 -->
<table width="730" border="0" cellspacing="0" cellpadding="0" align="center" >
	<tr>
   	  <td></td>
	</tr>
	<tr>
	  <td align="center" class="ssss"><%@ include file="pageCount.jsp"%></td>
	</tr>
</table>

 <a href="write.jsp?pro=<%=pro%>" class="new_comment">새글쓰기</a>

<% 
rs.close();
stmt.close();
conn.close();
%>





