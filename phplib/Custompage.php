<?php
/**基于yii2的分页处理类  可以根据已有的数组，已有的query对象实现分页处理 并将分页的html代码存储于 htmlpart静态属性上。
 * Created by PhpStorm.
 * User: farewell
 * Date: 2017/7/16
 * Time: 14:02
 */

namespace app\models\helper;


use yii\data\Pagination;
use yii\widgets\LinkPager;

class CustomPage
{
    public static $baseRecord = 10;
    public static $htmlPart = '';
    private $param = 'page';  //page的参数名

    /**普通分页
     * @param $query             query对象
     * @param int $perpage       每页显示的记录数
     * @return mixed             返回query对象
     */
    public static function comonPage($query,$perpage=10)
    {
        $page = new Pagination([
            'totalCount' => $query->count(),
            'pageSize'   => $perpage
        ]);
        self::$htmlPart = LinkPager::widget([
            'pagination' => $page
        ]);
        return $query -> offset($page->offset) -> limit($page->limit);
    }

    /**下拉刷新分页的query对象获取
     * @param $query          query对象
     * @param int $perpage    下拉之后的获取的数据的条数
     * @return mixed
     */
    public static function dropPage($query,$perpage=10)
    {
        $page = \yii::$app->request->get('page',0);
        if($page == 0 || $page == 1){
            return $query -> limit(self::$baseRecord);
        }
        return $query -> offset(self::$baseRecord+($page-2)*$perpage) -> limit($perpage);
    }

    /**对数组进行分页处理
     */
    public static function arrayPage($data,$perpage=10)
    {
        $page = new Pagination([
            'totalCount' => count($data),
            'pageSize'   => $perpage
        ]);
        self::$htmlPart = LinkPager::widget([
            'pagination' => $page
        ]);
        $page = \yii::$app->request->get('page',1);
        $offset = ($page-1)*$perpage;
        $data = array_slice($data,$offset,$perpage);
        return $data;
    }
}