<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.io.File, java.util.Scanner"
	pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>BullShitMe</title>
		<link rel="stylesheet" href="../bootstrap.min.css" />
		<link rel="icon" href="../images/bullshit.png" type="image/x-icon">
	</head>

	<body>
		<nav class="navbar navbar-inverse">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="../index.html">eLibrary</a>
				</div>
			</div>
		</nav>
		<div class="container">
			<h1>文章產生器</h1>
			<form action="<%=request.getContextPath()%>/BullShitController" method="post" onsubmit='disableButton()'>

				<div class="form-group">
					<label for="text">輸入簡短摘要/標題:</label>
					<input type="text" class="form-control" id="text" placeholder="雲端應用實務" name="text" required>
					<input type="checkbox" name="isHighQuality">
					<label for="text">高品質模式</label>
				</div>
				<button id="submit" type="submit" class="btn btn-primary">產生</button>

				<p>
					<% String output=null; String dir=getServletContext().getRealPath("/"); File outputFile=new File(dir
						+ "BullShitGenerator/output.txt" ); if (outputFile.exists()) { out.println("<br>");
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

			<script>
				function disableButton() {
					var btn = document.getElementById('submit');
					btn.disabled = true;
					btn.innerText = '產生中...'
				}
			</script>
		</div>
	</body>

	</html>