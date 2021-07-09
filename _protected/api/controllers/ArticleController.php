<?php
namespace api\controllers;

use yii\rest\ActiveController;
//use frontend\models\Article;

class ArticleController extends ActiveController
{
    public $modelClass = 'frontend\models\Article';
}