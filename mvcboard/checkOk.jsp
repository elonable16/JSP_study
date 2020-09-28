<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script >
		var b_type = "${param.b_type}";
		if (b_type == "update"){
			window.opener.location.href = "BoardServlet?cmd=board_update_form&b_num="+${param.b_num};
		}else if(b_type == "delete"){
			window.opener.location.href = "BoardServlet?cmd=board_delete&b_num="+${param.b_num};
		}
		window.close();
	</script>
</body>
</html>