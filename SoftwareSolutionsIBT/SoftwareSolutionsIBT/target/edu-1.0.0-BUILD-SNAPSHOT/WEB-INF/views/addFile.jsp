<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>${webappRoot}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>${webappRoot}//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <title>Add File</title>
</head>
<body>
<div class="page-header text-center">
    <h1>Add File</h1>
</div>
<div class="container">
    <div class="row span12 well well-lg">
        <ul class="nav nav-tabs well well-lg">
            <li><a href="home">Home</a></li>
            <sec:authorize access="hasRole('admin')">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Add <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="addSystem">Add New System</a></li>
                    <li><a href="addRelease">Add Release</a></li>
                    <li><a href="addReport">Add Report</a></li>
                    <li><a href="addRevision">Add Revision</a></li>
                    <li><a href="addChanges">Add Target Change</a></li>
                    <li><a href="addFile">Add Target File</a></li>
                </ul>
            </li>
            </sec:authorize>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    View <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="showSystems">View Systems</a></li>
                    <li><a href="showReleases">View Releases</a></li>
                    <li><a href="showReports">View Reports</a></li>
                    <li><a href="showRevisions">View Revisions</a></li>
                    <li><a href="showTargetChanges">View Target Changes</a></li>
                    <li><a href="showTargetFile">View Target Files</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="row span12 well well-lg">
        <form:form modelAttribute="Targetfile" action="showTargetFile" method="POST">
            <table class="table well well-lg">

                <tr>
                    <td><label >System Name</label></td>
                    <td><select name="systemid" required="required" type="text">
                        <option value="">-- Select system</option>
                        <c:forEach var="s" items="${systems}">
                            <option value="${s.id}">${s.name}</option>
                        </c:forEach>
                    </select> <a href="/edu/addSystem">Add new system</a></td>
                </tr>
                <tr>
                    <td><label>Release Name</label></td>
                    <td><select name="releaseid" required="required" type="text">
                        <option value="">-- Select release</option>
                        <c:forEach var="r" items="${releases}">
                            <option value="${r.id}">${r.system.name} - ${r.name}</option>
                        </c:forEach>
                    </select> <a href="/edu/addRelease">Add new system release</a></td>
                <tr>
                <tr>
                    <td><label >Report Id</label></td>
                    <td><select name="reportid" required="required" type="text">
                        <option value="">-- Select Report </option>
                        <c:forEach var="s" items="${reports}">
                            <option value="${s.id}">${s.title}</option>
                        </c:forEach>
                    </select> <a href="/edu/addReport">Add new Report</a></td>
                </tr>
                <tr>
                    <td><label >Revision Name</label></td>
                    <td><select name="id" required="required" type="text">
                        <option value="">-- Select revision</option>
                        <c:forEach var="s" items="${revisions}">
                            <option value="${s.id}">${s.name}</option>
                        </c:forEach>
                    </select> <a href="/edu/addRevision">Add new Revision</a></td>
                </tr>
                <tr>
                    <td><form:label path="path">File Path</form:label></td>
                    <td><form:textarea path="path" required = "required" type = "text"/>
                </tr>
                <%--<tr>--%>
                    <%--<td><form:label path="change">Change Type</form:label></td>--%>
                    <%--<td><form:select path="change" required="required">--%>
                        <%--<form:option value="">-- Select Type</form:option>--%>
                        <%--<form:option value="modified">Modified</form:option>--%>
                        <%--<form:option value="change">Change</form:option>--%>
                    <%--</form:select>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            </table>
            <input type="submit" class="btn btn-primary" value="Submit"/>
        </form:form>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>${webappRoot}/resources/js/jquery-2.0.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>${webappRoot}/resources/js/bootstrap.min.js"></script>
</body>
</html>