<?php
/**
 * Created by PhpStorm.
 * User: chindor
 * Date: 2017/4/26
 * Time: 10:23
 */

namespace app\api\modules\v1\owner\models;

use app\models\File;
use yii\base\Model;

class UploadModel extends Model
{
    public $path ;
    public $maxsize = 20971520;
    public $img_extension = [
        'bmp','jpeg','jpg','gif','png'
    ];

    public $doc_extension = [
        'doc','docx','xls','xlsx'
    ];

    public $default_extension = [
        'png','bmp','jpeg','jpg','gif','doc','docx','xls','xlsx'
    ];

    public function uploadImg($field)
    {
        $this->path = '/images/image/'.date('Ymd').'/';
        $session = \yii::$app->session;
        $file = new File([
            'basic_path' => \Yii::$app->basePath,
            'maxsize'   => $this->maxsize,
            'allowtype' => $this->img_extension,
            'path'      => $this->path,
        ]);

        if(!$file->upload($field)){
            $session->setFlash('error',$file->getErrorMsg());
            return false;
        }else{
            $session->setFlash($field,$file->getFileName());
            return true;
        }
    }

    public function uploadAttachment($field)
    {
        $this->path = '/images/attachment/'.date('Ymd').'/';
        $session = \yii::$app->session;
        $file = new File([
            'basic_path' => \Yii::$app->basePath,
            'maxSize'   => $this->maxsize,
            'allowtype' => [],
            'path'      => $this->path,
        ]);
        if(!$file->upload($field)){
            $session->setFlash('error',$file->getErrorMsg());
            return false;
        }else{
            $session->setFlash($field,$file->getFileName());
            return true;
        }
    }
}