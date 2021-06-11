<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.io.File, java.util.Scanner"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BullShitMe</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		<h1>文章產生器</h1>
		<form action="<%=request.getContextPath()%>/BullShitController" method="post">

			<div class="form-group">
				<label for="text">輸入簡短摘要/標題:</label> <input type="text"
					class="form-control" id="text" placeholder="雲端應用實務"
					name="text" required>
			</div>
			<button type="submit" class="btn btn-primary">產生</button>

			<p>
			<%
			String output = null;
			String dir = getServletContext().getRealPath("/");
			File outputFile = new File(dir + "BullShitGenerator/output.txt");
			if (outputFile.exists())
			{
				out.println("<br>");
				Scanner sc = new Scanner(outputFile);
				while (sc.hasNextLine())
				{
					out.println(sc.nextLine() + "<br>");
				}
				sc.close();
				out.println("<br><br><br>");
				outputFile.delete();
			}
			%>
			</p>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>