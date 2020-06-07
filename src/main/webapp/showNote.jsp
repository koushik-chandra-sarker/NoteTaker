<%@ page import="org.hibernate.Session" %>
<%@ page import="FactoryProvider.FactoryProvider" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.Note" %>
<%@ page import="org.hibernate.Transaction" %><%--
  Created by IntelliJ IDEA.
  User: koush
  Date: 5/3/2020
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Note Taker: Show Note</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
<header id="header">
    <div class="container-fluid">
        <%@include file="navbar.jsp" %>
    </div>
</header>

<section class="row mx-0 container-fluid" style="background-color: #ff5733">
    <div class="col-12">

        <%
            try {
                Session session1 = FactoryProvider.getFactory().openSession();
                Transaction t = session1.beginTransaction();
                Query q = session1.createQuery("from Note");
                List<Note> list = q.list();
                for (Note note : list) {
        %>

        <div class="card p-2 my-4" style="width: 100%; background-color: #c70039">
            <div class="card-body">
                <div class="container text-center img-fluid">
                    <img style="width: 75px" src="img/Do-Note-Icon.png">
                </div>

                <h5 class="card-title"><%=note.getTitle()%>
                </h5>
                <%--                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>--%>
                <p class="card-text" ><%=note.getContent()%>
                </p>
                <div class="container text-center">
                    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn update_btn">Update</a>
                   <a href="deleteServlet?note_id=<%=note.getId()%>" class="btn delete_btn">Delete</a>
                </div>
            </div>
        </div>

        <%
                }
                t.commit();
                session1.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>


    </div>
</section>

</body>
</html>
