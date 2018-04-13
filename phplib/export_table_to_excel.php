<?php


/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Europe/London');

define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');
define('HOST','localhost');
define('PORT','3306');
define('USER','root');
define('PASS','');
define('DB','vr');
define('CHARSET','utf8');
/** Include PHPExcel */
require_once dirname(__FILE__) . '/PHPExcel/Classes/PHPExcel.php';
require_once __DIR__.'/wokerman___MYSQL/src/Connection.php';

$conc = new \Workerman\MySQL\Connection(HOST,PORT, USER, PASS, DB ,CHARSET);

$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");


$tables = $conc -> query('show table status');
// $tables = array_column($tables, 'Tables_in_'.DB);
$row = -1;
foreach($tables as $v){
	$row += 2;
	$boder[0] = $row;

	$table = $v['Name'];
	$table_comment = $v['Comment'];

	$objPHPExcel->getActiveSheet()->setCellValue('A'.$row,$table.(empty($table_comment)?'':'('.$table_comment.')'));
	
	$objPHPExcel->getActiveSheet()->mergeCells( 'A'.$row.':'.'D'.$row);

	//水平方向上对齐
	$objPHPExcel->getActiveSheet()->getStyle('A'.$row)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

	//垂直方向上两端对齐
	$objPHPExcel->getActiveSheet()->getStyle( 'A'.$row)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); 

	$objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

	$row++;

	//给每个表格添加固定的字段 四列 字段 类型 说明 默认值
	$objPHPExcel->getActiveSheet()->setCellValue('A'.$row,'字段')
                              ->setCellValue('B'.$row, '类型')
                              ->setCellValue('C'.$row, '说明')
                              ->setCellValue('D'.$row, '默认值');
     
    //遍历该表中的字段
	$table_fields = $conc -> query('show full fields FROM '.$table);	
	// var_dump($table_fields);exit;
	foreach($table_fields as $k => $field){
		$row++;
		$is_null = $field['Null'] == 'YES' ? 'null': 'not null' ;
		$is_primary_key = $field['Key'] == 'PRI' ? 'primaryKey': '' ;
		$extra = $field['Extra'];
		$field_type = $field['Type'].' '.$is_null.' '.$is_primary_key.' '.$extra;

		//给每个表格添加固定的字段 四列 字段 类型 说明 默认值
		$objPHPExcel->getActiveSheet()->setCellValue('A'.$row,$field['Field'])
                              ->setCellValue('B'.$row, $field_type)
                              ->setCellValue('C'.$row, $field['Comment'])
                              ->setCellValue('D'.$row, $field['Default']);
	}
	$boder[1] = $row;
	//添加边框
	$styleThinBlackBorderOutline= array(
       'borders' => array (
             'outline' => array (
                   'style' =>PHPExcel_Style_Border::BORDER_THIN,   //设置border样式
                   //'style' =>PHPExcel_Style_Border::BORDER_THICK, 另一种样式
                   'color' => array ('argb' => 'FF000000'),       //设置border颜色
            ),
      	),
	);
	$objPHPExcel->getActiveSheet()->getStyle( 'A'.$boder[0].':D'.$boder[1])->applyFromArray($styleThinBlackBorderOutline);
}

$objPHPExcel->getActiveSheet()->setTitle(DB);
$objPHPExcel->setActiveSheetIndex(0);
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save(str_replace('.php', '.xls', DB.'.php'));
