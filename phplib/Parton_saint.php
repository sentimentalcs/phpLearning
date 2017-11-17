<?php
	

	/**
	 * 辅助助手类
	 */
	class Parton_saint
	{
	    /*根据数据中存入的地址，返回相应的网络地址，如果该文件实际地址不存在，则返回空。
	     * @param $src                  存入数据库的文件地址 /images/attachment/1.jpg
	     * @param bool $default         默认的文件地址
	     * @return string               返回格式化的可用于直接前台显示的文件路径
	     */
	    public static function formt_file_path($src,$default=false)
	    {
	        if(empty($src)){
	            return '';
	        }

	        $root_path = \yii::getAlias('@app');
	        $default = empty($default)?'':$default;

	        //文件路径
	        $file_path = $root_path.$src;                          //src文件的绝对路径
	        $default_file_path = $root_path.$default;              //default文件的绝对路径

	        //网络路径
	        $web_root  = \yii::$app->params['img_host'];
	        $web_file_path = $web_root.$src;                        //src文件的网络路径
	        $web_default_path = $web_root.$default;               //default文件的网络路径

	        if(file_exists($file_path) && is_file($file_path)){
	            return $web_file_path;
	        }else{
	            if(file_exists($default_file_path) && is_file($file_path)){
	                return $web_default_path;
	            }else{
	                return '';
	            }
	        }
	    }

	     /*获取客户端的Ip的方法
	     * [get_client_ip_from_ns description]   
	     * @param  boolean $proxy_override [description]   
	     * @return [type]                  [description]
	     */
	    public static function get_client_ip_from_ns($proxy_override = false)
	    {
	        if ($proxy_override) {
	            /* 优先从代理那获取地址或者 HTTP_CLIENT_IP 没有值 */
	            $ip = empty($_SERVER["HTTP_X_FORWARDED_FOR"]) ? (empty($_SERVER["HTTP_CLIENT_IP"]) ? NULL : $_SERVER["HTTP_CLIENT_IP"]) : $_SERVER["HTTP_X_FORWARDED_FOR"];
	        } else {
	            /* 取 HTTP_CLIENT_IP, 虽然这个值可以被伪造, 但被伪造之后 NS 会把客户端真实的 IP 附加在后面 */
	            $ip = empty($_SERVER["HTTP_CLIENT_IP"]) ? NULL : $_SERVER["HTTP_CLIENT_IP"];
	        }

	        if (empty($ip)) {
	            $ip = $_SERVER['REMOTE_ADDR'];
	        }

	        /* 真实的IP在以逗号分隔的最后一个, 当然如果没用代理, 没伪造IP, 就没有逗号分离的IP */
	        if ($p = strrpos($ip, ",")) {
	            $ip = substr($ip, $p+1);
	        }

	        return trim($ip);
	    }

	    /**返回数组中的某个键的值，若该键不存在或者该传入的data为空都是返回[];
	     * [filter_empty description]
	     * @param  [type] $data [description]   要查找的一维数组
	     * @param  [type] $key  [description]   要查找的键
	     * @return [type]       [description]   
	     */
	    public static function filter_empty($data,$key)
	    {
	        return empty($data)?[]:(empty($data[$key])?[]:$data[$key]);
	    }

	    /**比较两个值，如果相等则返回$classname,否则就返回'';常用于前台
	     * [filter_class description]
	     * @param  [type] $cval         [description]
	     * @param  [type] $selected_val [description]
	     * @param  [type] $classname    [description]
	     * @return [type]               [description]
	     */
	    public static function filter_class($cval,$selected_val,$classname)
	    {
	        if($cval == $selected_val){
	            return $classname;
	        }else{
	            return '';
	        }
	    }

	    /**返回前端显示的格式化好的时间
	     * @param int $time              时间戳 默认为当前时间
	     * @param $delimiter             时间分隔符 默认为-
	     * @param $hms                   是否精确到时分秒
	     * @return false|string
	     */
	    public static function format_time($time,$delimiter='-',$hms=false)
	    {
	        if(empty($hms)){
	            return date('Y'.$delimiter.'m'.$delimiter.'d',$time);
	        }
	        return date('Y'.$delimiter.'m'.$delimiter.'d'.' H:i:s',$time);
	    }


	    /**根据文件路径获取文件名
	     * @param $path
	     * @return mixed|string
	     */
	    public static function get_name_by_path($path)
	    {
	        if(empty($path)){
	            return '';
	        }else{
	            $arr = explode('/',$path);
	            return array_pop($arr);
	        }
	    }


	    
	}