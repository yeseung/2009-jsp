<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>



<%

if (!"ok".equals(request.getParameter("fullview"))) {
    rs=stmt.executeQuery(pageCountQuery);
    if (rs.next()) {
       if ((rs.getInt(1) % view_rows) == 0)
          total_pages = rs.getInt(1) / view_rows;
       else
          total_pages = (rs.getInt(1) / view_rows) + 1;
    }
    rs.close();
    int start_page = 1;
    int end_page = 10;

    if (tpage < 1)
       tpage = 1;
    if (tpage % 10 == 0) {
       start_page = tpage - 9;
       end_page = tpage;
    } else {
       start_page = tpage - (tpage % 10) + 1;
       end_page = start_page + 9;
    }
    if (end_page > total_pages)
       end_page = total_pages;
    if (start_page > 10) {
%><a href="<%=(url+"1")%>"><img src="images/q_fp.png" /></a><a href="<%=(url+Integer.toString(start_page-1))%>"><img src="images/i_prev.gif"></a><%
    } else if (total_pages > 1 && end_page !=0) {
%><img src="images/q_fp.png" /><img src="images/i_prev.gif" /><%
    }
    for(int i=start_page;i<=end_page;i++) {
      if(i == tpage) {
%>&nbsp;<font color=#f20000>[<%=tpage%>]</font>&nbsp<%
      } else {
%>&nbsp<a href="<%=(url+Integer.toString(i))%>" class="q12345"><%=i%></a>&nbsp<%
      }
    }
    if (total_pages > end_page) {
%><a href="<%=(url+Integer.toString(end_page+1))%>"><img src="images/i_next.gif"></a><a href="<%=(url+Integer.toString(total_pages))%>"><img src="images/q_ep.png" /></a><%
    } else if (total_pages > 1 && end_page !=0) {
%><img src="../q/images/i_next.gif" /><img src="images/q_ep.png" /></a><%
    }
} else {  //if (!"ok".equals
}
%>
