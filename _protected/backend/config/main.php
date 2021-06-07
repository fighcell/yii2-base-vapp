<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'user' => [
            // following line will restrict access to profile, recovery, registration and settings controllers from backend
            //'as backend' => 'dektrium\user\filters\BackendFilter',
            'admins' => ['fighcell', 'fai-virtual']
        ],
    ],
    'components' => [
        'user' => [
            /*'identityClass' => 'dektrium\user\models\User',  */
            'identityCookie' => [
                'name'     => '_backendIdentity',
                //'path'     => '/admin',
                'httpOnly' => true,
            ],
        ],
        'session' => [
            'name' => 'BACKENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
                //'path'     => '/admin',
            ],
            'class' => 'yii\web\DbSession',
        ], 
        // here you can set theme used for your backend application 
        // - template comes with: 'default', 'slate', 'spacelab' and 'cerulean'
        'view' => [
            'theme' => [
                'pathMap' => ['@app/views' => '@webroot/themes/cerulean/views'],
                //'pathMap' => ['@app/views' => '@vendor/dmstr/yii2-adminlte-asset/example-views/yiisoft/yii2-app'],
                'baseUrl' => '@web/themes/cerulean',
            ],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'params' => $params,
];
