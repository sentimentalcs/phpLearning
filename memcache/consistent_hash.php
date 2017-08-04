<?php
/**
 * Created by PhpStorm.
 * User: chindor
 * Date: 2017/8/4
 * Time: 14:01
 */

    interface CsHash
    {
        public static function _hash($str);

        public static function find($key);
    }

    class memcache_CsHash implements CsHash
    {
        public static $pos;
        public static $mapNum = 64;

        public static function _hash($str)
        {
            return sprintf('%u',crc32($str));
        }

        public static function find($key)
        {
            $pos = self::_hash($key);
            $node = current(self::$pos);
            foreach(self::$pos as $k => $v){
                if($pos <= $k){
                    $node = $v;
                    break;
                }
            }
            reset(self::$pos);
            return $node;
        }

        /*删除节点
         * @param $node
         */
        public static function delNode($node)
        {
            if(!in_array($node,self::$pos)){
                return ;
            }

            foreach(self::$pos as $k => $v){
                if($v == $node){
                    unset(self::$pos[$k]);
                }
            }
        }

        /**添加节点
         * @param $node
         */
        public static function addNode($node)
        {
            if(is_string($node)){
                $node = [$node];
            }
            foreach($node as $v){
                if(!empty(self::$pos)){
                    if(in_array($v,self::$pos)){
                        return ;
                    }
                }
                for($i = 0 ; $i < self::$mapNum; $i++){
                    $pos = self::_hash($v.'-'.$i);
                    self::$pos[$pos] = $v;
                }

                ksort(self::$pos);
            }

        }
    }

        memcache_CsHash::$mapNum = 5;
        memcache_CsHash::addNode(['A','B','C','D','E']);
        var_dump(memcache_CsHash::$pos);
        memcache_CsHash::delNode('B');
        echo '<br/>';
        var_dump(memcache_CsHash::$pos);
//        var_dump(memcache_CsHash::find('test'));