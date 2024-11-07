<?php
require_once ('./mysqli_connect.php');
$sec=$_POST["sec"];

$sql="SELECT Name,Grade FROM student,grade_report WHERE student.Student_number=grade_report.Student_number AND grade_report.Section_identifier=$sec";

$result = mysqli_query($dbc,$sql);

echo "<h1>UNIVERSITY DATABASE</h1>";

echo "Displaying the Names and Grades of students from the Section"; 
echo "<br><br>";

echo "<table border='1'>
<tr>
<th>Name</th>
<th>Grade</th>
</tr>";

while($row = mysqli_fetch_array($result))
{
	echo "<tr>";
	echo "<td>" . $row['Name'] . "</td>";
	echo "<td>" . $row['Grade'] . "</td>";
	echo "</tr>";
}
echo "</table>";
echo "<br><br>";
echo "<li><a href='Index.html'>Back to Main Page</a></li>";

mysqli_close($dbc);
?>