<?php
$servername = "localhost";
$username = "root";
$password = "mcis";
$dbname = "University";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$Section_identifier=$_POST["Section_identifier"];
$Semester=$_POST["Semester"];
$Year=$_POST["Year"];
$Instructor=$_POST["Instructor"];
$Course_number=$_POST["Course_number"];
$sql = "INSERT INTO section (Section_identifier, Semester, Year, Instructor, Course_number)
VALUES ($Section_identifier, '$Semester', $Year,'$Instructor','$Course_number')";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
echo "<li><a href='Index.html'>Back to Main Page</a></li>";
mysqli_close($conn);
?>

