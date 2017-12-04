<?php
/**基于yii2的数据完整性验证类
 * Created by PhpStorm.
 * User: farewell
 * Date: 2017/7/15
 * Time: 17:27
 */

namespace app\models\helper;


use yii\base\DynamicModel;

class CustomValidator
{
   public static $errors ;  //储存错误信息的容器
   public static $field;


   
   public static function validate($data,$rule)
   {
       self::get_field($rule);
       $model = DynamicModel::validateData(self::handle_data($data),$rule);
       if($model -> hasErrors()){
           self::$errors = array_values($model->getFirstErrors())[0];
           return false;
       }else{
           return true;
       }
   }

   private static function get_field($rule)
   {
       $field = [];
       array_map(function ($val) use(&$field){
            if(is_array($val[0])){
                foreach($val[0] as $v){
                    $field[] = $v;
                }
            }else{
                $field[] = $val[0];
            }
       },$rule);
       self::$field = array_unique($field);
   }

   private static function handle_data($data)
   {
       $arr = [];
       foreach(self::$field as $v){
           if(!isset($data[$v])){
               $arr[$v] = '';
           }else{
               $arr[$v] = $data[$v];
           }
       }
       return $arr;
   }

}