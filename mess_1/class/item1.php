<?php
class Item {	
   
    private $itemTable = 'items';
	private $categoryTable = 'category';		
	private $conn;
	
	public function __construct($db){
        $this->conn = $db;
    }	    
	
	public function listItems(){			
		
		$sqlQuery = "
			SELECT item.id, item.name AS item_name, item.price, item.category_id, item.status, category.name AS category_name
			FROM ".$this->itemTable." item 
			LEFT JOIN ".$this->categoryTable." category ON item.category_id = category.id ";
						
		if(!empty($_POST["order"])){
			$sqlQuery .= ' ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		} else {
			$sqlQuery .= ' ORDER BY item.id ASC ';
		}
		
		if($_POST["length"] != -1){
			$sqlQuery .= ' LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		
		$stmt = $this->conn->prepare($sqlQuery);
		$stmt->execute();
		$result = $stmt->get_result();	
		
		$stmtTotal = $this->conn->prepare($sqlQuery);
		$stmtTotal->execute();
		$allResult = $stmtTotal->get_result();
		$allRecords = $allResult->num_rows;
		
		$displayRecords = $result->num_rows;
		$records = array();	
	
		while ($items = $result->fetch_assoc()) { 				
			$rows = array();			
			$rows[] = $items['id'];			
			$rows[] = $items['item_name'];
			$rows[] = "Rs. ".$items['price'];
			$rows[] = $items['category_name'];
			$rows[] = $items['status'];
			$records[] = $rows;
		}
		
		$output = array(
			"draw"	=>	intval($_POST["draw"]),			
			"iTotalRecords"	=> 	$displayRecords,
			"iTotalDisplayRecords"	=>  $allRecords,
			"data"	=> 	$records
		);
		
		echo json_encode($output);
	}
	
	
	
	function getItemCategory(){		
		$stmt = $this->conn->prepare("
		SELECT id, name 
		FROM ".$this->categoryTable);				
		$stmt->execute();			
		$result = $stmt->get_result();		
		return $result;	
	}
	
}
?>