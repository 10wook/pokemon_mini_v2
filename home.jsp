<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .App {
	  text-align: center;
	  font-size: 20px;
	}
	
    label, input, button {
    margin: 10px;
    padding: 5px;
    }

	footer {
	    bottom: 0;
	    position: absolute;
	    width: 90%;
	    height: 40px;
	}
 </style>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"  rel="stylesheet" >
</head>
<body>
      <div class="App">
	    <!-- header 보여주기 -->
	 	<jsp:include page="include/header.jsp" />
	 
	    <!-- content 보여주기 -->
	 	<jsp:include page="include/home.jsp" />
	   </div> 
</body>
</html>

