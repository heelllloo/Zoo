<?php require_once("includes/constants.php"); ?>

<?php
	include("includes/header.php");
?>





<?php
	include("includes/footer.php");
?>




<?php
$result = mysqli_query($link, "SELECT * FROM `category`");

$category = mysqli_fetch_assoc($result);

echo $category['name'];

?>




<?php
echo '<form method="post">';
while($row = mysql_fetch_assoc($result)) {
echo $row['url'].'<input type="radio" name="id" value="'.$row['id'].'" />';
}
echo '<input type=submit name=delete value="Удалить выбранную запись" /></form>';
if(isset($_POST['delete'])) {
$id = (int)trim($_POST['id']);
if($id>0) {
$query = sprintf("DELETE FROM `table` Where `id`='%u'",mysql_real_escape_string($id));
mysql_query($query) or die(mysql_error());
}
}


\



	<div id="order_tickets">

									<?php 
									$query =mysqli_query($con, "SELECT * FROM order_tickets");
									echo "<table border='1' align = 'center'>
									<tr>
									<th>Id</th>
									<th>User</th>
									<th>Price</th>
									</tr>";
									$category = array();
									while($row=mysqli_fetch_assoc($query))
									{
										array_push($category, $row['price'] . ".php");
										echo "<tr>";
										echo "<td>" . $row['id'] . "</td>";
										echo "<td>" . $row['user'] . "</td>";
										echo "<td>" . $row['price'] . "</td>";

									}
									echo "</table>";
									?>
								</div>

