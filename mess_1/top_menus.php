<h3><?php if($_SESSION["userid"]) { echo "Logged in: ".ucfirst($_SESSION["name"]); } ?> | <a href="logout.php">Logout</a> </h3><br>
<p><strong>Welcome <?php echo ucfirst($_SESSION["role"]); ?></strong></p>	
<ul class="nav nav-tabs">	
	<?php if($_SESSION["role"] == 'admin') { ?>	    
		<li id="category"><a href="category.php">Category</a></li>
		<li id="tables"><a href="tables.php">Table</a></li>
		<li id="tax"><a href="tax.php">Tax</a></li>
		<li id="items"><a href="items.php">Items</a></li>			
		<li id="order"><a href="order.php">Order</a></li>				
	<?php } ?>	
	<?php if($_SESSION["role"] == 'user') { ?>		
		<li id="category"><a href="category1.php">Category</a></li>
		<li id="items"><a href="items1.php">Items</a></li>	
	<?php } ?>
	<?php if($_SESSION["role"] == 'cashier') { ?>
		<li id="category"><a href="category.php">Category</a></li>
		<li id="items"><a href="items.php">Items</a></li>
		<li id="order"><a href="order.php">Order</a></li>
		<li id="billing"><a href="billing.php">Billing</a></li>	
	<?php } ?>
</ul>