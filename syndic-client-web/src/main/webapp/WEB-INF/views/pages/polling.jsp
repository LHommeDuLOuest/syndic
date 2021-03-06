<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/tiles/template/includes.jsp" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vote</title>
    <style>
        .table1{
            border : 2px solid black;
        }
        .table1 th{
            margin : 5px;
            padding : 5px;
            border: 2px solid black;
            text-align: center;
            background: #E6EDF5;
            color: #4F76A3;
            font-size: 100% !important;
        }
        .table1 td{
            margin : 5px;
            padding : 5px;
            text-align: center;
            border: 1px solid black;
            background : white;
        }
    </style>

    <link rel="stylesheet"
          href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <!--<link rel="stylesheet" href="/resources/demos/style.css">-->

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
            <h3><fmt:message key="listevent.H3" /></h3>
        </div>
    </div>
    <div id='calendar'></div>

    <div class="form-group row">
        <div class="col-xs-6 col-sm-8 col-md-9 col-lg-10">
            <table class="table1">
                <tr>
                    <th>Question</th><th>Vote</th>
                </tr>

                <c:if test="${polling != null}">
                    <c:forEach var="entry" items="${polling.getQuestions()}">
                        <c:if test="${entry != null}">
                            <tr>
                                <td>${entry.getQuest()}</td>
                                <td><SELECT name="reponse" size="1">
                                    <OPTION>Pour
                                    <OPTION>Contre
                                    <OPTION>Abstention
                                </SELECT>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:if>

            </table>
        </div>
    </div>
</div>

</body>



</html>