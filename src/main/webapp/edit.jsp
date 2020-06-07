<%@ page import="org.hibernate.Session" %>
<%@ page import="FactoryProvider.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="Bean.Note" %><%--
  Created by IntelliJ IDEA.
  User: koush
  Date: 5/3/2020
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Note Taker: Edit</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<header id="header">
    <div class="container-fluid">
        <%@include file="navbar.jsp" %>
    </div>

    <%
        try {
            int noteId = Integer.parseInt(request.getParameter("note_id"));
            Session session1 = FactoryProvider.getFactory().openSession();
            Note note = session1.get(Note.class, noteId);


    %>

    <div class="contact-clean">
        <form id="form" action="updateServlet" method="get">
            <h2 class="text-center">Edit Note</h2>

             <input value="<%=note.getId()%>" type="hidden" name="noteId">
            <div class="form-group"><input class="form-control" type="text" name="title" placeholder="Note title"
                                           required value="<%=note.getTitle()%>"></div>
            <div class="form-group"><textarea class="form-control" name="content" placeholder="Note Content" rows="14"
                                              required ><%=note.getContent()%></textarea></div>
            <div class="form-group text-center"><input class="btn btn-primary" type="submit" value="Submit"> </input>
            </div>
        </form>
    </div>

    <%
    session1.close();
    }catch (Exception e){
    e.printStackTrace();
    }
    %>

</header>


</body>
</html>
