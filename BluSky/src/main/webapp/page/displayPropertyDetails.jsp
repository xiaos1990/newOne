<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.12.2.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#bta").click(function () {
                $("#unit").stop(true, false).animate({"left": 0}, 500);
            });
            $("#btb").click(function () {
                $("#unit").stop(true, false).animate({"left": -300}, 500);
            })
        });
    </script>
    <style type="text/css">
        * { padding: 0; margin: 0;}
        #box {width: 300px; height: 150px; margin-bottom: 50px; position: relative; overflow: hidden; }
        #unit { width: 600px; position: absolute; }
        #unit div {float: left; width: 300px; height: 150px;}
        #bga {background-color: #F30;}
        #bgb {background-color: #F90;}
        #bta, #btb { float: left; width: 50px; padding-right: 50px; color: #FFF; cursor: pointer;}
    </style>
</head>
<body>
<div style="width:800px; height:300px; padding-top:100px; background-color:#999; margin:0 auto;">
    <div id="box">
        <div id="unit">
        	<c:forEach var="file" items="${propertyBean.files }" >
            <div id="bga"><img src="${file.address }" /></div>
            </c:forEach>
        </div>
    </div>
    <div id="bta">左</div>
    <div id="btb">右</div>
</div>
</body>
</html>