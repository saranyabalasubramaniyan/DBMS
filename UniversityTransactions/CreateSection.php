<html>
<head>
<style>
h1 {text-align: center;}
</style>
</head>
<body>
<h1>UNIVERSITY DATABASE</h1>

<h2>Create a Section</h2>

<h3>Note: Please ensure Course Number is already available at the Course table.</h3>
<form action="CreateSectionPhp.php" method="post">
	<p>Section Identifier: <input type="text" name="Section_identifier" size="1" maxlength="11" /> </p>
	<p>Semester: <input type="text" name="Semester" size="2" maxlength="6" /></p>
	<p>Year: <input type="text" name="Year" size="2" maxlength="2" /></p>
	<p>Instructor: <input type="text" name="Instructor" size="20" maxlength="45" /></p>
	<p>Course Number: <input type="text" name="Course_number" size="1" maxlength="10" /></p>
	<p><input type="submit" name="submit" value="Submit" /></p>	
	<li><a href='Index.html'>Back to Main Page</a></li>
</form>
</body>
</html>
