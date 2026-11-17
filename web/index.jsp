<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Forward tới HomeServlet để nạp đầy đủ dữ liệu từ Database & DAO
    response.sendRedirect(request.getContextPath() + "/home");
%>
