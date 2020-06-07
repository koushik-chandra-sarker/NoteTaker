
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Note</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
<header id="header">
    <div class="container-fluid">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="contact-clean">
        <form id="form" action="saveNoteServlet" method="post">
            <h2 class="text-center">Fill your Note deteils</h2>
            <div class="form-group"><input class="form-control" type="text" name="title" placeholder="Note title" required></div>
            <div class="form-group"><textarea class="form-control" name="content" placeholder="Note Content" rows="14" required></textarea></div>
            <div class="form-group text-center"><input class="btn btn-primary" type="submit" value="Submit"> </input></div>
        </form>
    </div>
</header>

</body>
</html>
