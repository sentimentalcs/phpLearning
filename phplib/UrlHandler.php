<?php
/**
 * Created by PhpStorm.
 * User: chindor
 * Date: 2017/4/21
 * Time: 16:46
 */

namespace app\api\modules\v1\owner\models;


class UrlHandler
{
    public static function handle_get($query,$get,$filter_filed=array(),$type='activity')
    {
        //全部为-1
        $sort = [];
        $like = [];
        $where = [];
        foreach($get as $k => $v)
        {
            if(strpos($k,'sort_')!==false) {
                $sort[self::parse_sort($k)] = empty($v) ? SORT_ASC : SORT_DESC;
            } else if( strpos($k,'search_' ) !== false){
                if($type == 'activity'){
                    $like = empty($v)?[]:['or',['like','name',$v],['like','activity_id',$v]];
                }else{
                    $like = empty($v)?[]:['like','name',$v];
                }
            }else{
                $filter_filed = array_merge($filter_filed,['r','per-page','page']);
                if(!in_array($k,$filter_filed)){

                    if($v!=-1) {
                        if(strpos($v,'-')!==false){
                            $where[$k] = explode('-',$v);
                        }else{
                            $where[$k] = $v;
                        }
                    }
                }
            }
        }

        if(!empty($sort)){
            return $query -> andfilterWhere($where) -> orderBy($sort) -> andWhere($like);
        }else{
            return $query -> andfilterWhere($where) -> andWhere($like);
        }
    }

    private static function parse_sort($sort)
    {
       return substr($sort,5);
    }
}