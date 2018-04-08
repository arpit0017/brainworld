<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question | Brainworld</title>
<script src="js/jquery-2.1.4.js"></script>
<script>

$(document).ready(function(){
	setInterval(Timer,50);
});
</script>
</head>
<body>
<form name="questionform" method="post" action="InsertQuestions">
<textarea name="question" rows="20" cols="100">

</textarea>
<br>
<input type="text" name="TargetTest" placeholder="Target Test Name">
<br>

<input type="text" name="Option1" placeholder="Option1">
<input type="checkbox" name="isAnswer" value=1>
<br>
<input type="text" name="Option2" placeholder="Option2">
<input type="checkbox" name="isAnswer" value=2>
<br>
<input type="text" name="Option3" placeholder="Option3">
<input type="checkbox" name="isAnswer" value=3>
<br>
<input type="text" name="Option4" placeholder="Option4">
<input type="checkbox" name="isAnswer" value=4>
<br>

<hr>
<input type="submit">

</form>

<div id="Timer" class="container" style="color:#f00;font-size:20px;margin:0 auto;">

</div>
</body>
</html>