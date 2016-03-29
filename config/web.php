<?php

$config = parse_ini_file('/var/phpsecure/phpconfidential.ini', true);

$params = require(__DIR__ . '/params.php');

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'user' => [
            'class' => 'dektrium\user\Module',
            'modelMap' => [
                'User' => 'app\models\User',
            ],
            'enableUnconfirmedLogin' => true,
            'confirmWithin' => 21600,
            'cost' => 12,
            'admins' => [$config['admin_username'],],
            'mailer' => [
                'sender'                => 'no-reply@myhost.com', // or ['no-reply@myhost.com' => 'Sender name']
                'welcomeSubject'        => 'Welcome subject',
                'confirmationSubject'   => 'Confirmation subject',
                'reconfirmationSubject' => 'Email change subject',
                'recoverySubject'       => 'Recovery subject',
            ],
         ],
         //adding admin module for rbac admin control
         'admin' => [
             'class' => 'mdm\admin\Module',
             'controllerMap' => [
                 'assignment' => [
                     'class' => 'mdm\admin\controllers\AssignmentController',
                     'userClassName' => 'dektrium\user\models\User',//path to the class user, here i'm using a custom user class
                     'idField' => 'id'
                  ],
             ],
             'menus' => [
                 'assignment' => [
                     'label' => 'Grand Access' // change label
                 ],
//             'route' => null, // disable menu route 
             ],

           ],

     
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '7xPLnP7wSMK_rlSUVYRhIXLHrLrGyB3C',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
       'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => false, //setar como false para configurar transport 
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => $config['smtp_host'], //configure email para permitir os envios de apps de terceiros
                'username' => $config['smtp_username'],
                'password' => $config['smtp_password'],
                'port' => '587',
                'encryption' => 'tls',
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
        'authClientCollection' => [
            'class'   => \yii\authclient\Collection::className(),
            'clients' => [
            // here is the list of clients you want to use
            // you can read more in the "Available clients" section
            'twitter' => [
                'class'        => 'dektrium\user\clients\Twitter',
                'consumerKey'     => $config['oauth_twitter_consumer_key'],
                'consumerSecret' => $config['oauth_twitter_consumer_secret'],
                ],
            ],
        ],
        'view' => [
            'theme' => [
                'pathMap' => [
                     '@dektrium/user/views' => '@app/views/user'
                ],
            ],
        ],
        'db' => require(__DIR__ . '/db.php'),
        'authManager' => [
            'class'=>'yii\rbac\DbManager',
        ],
       
        //permitir urls elegantes 
        'urlManager' => [
            'enablePrettyUrl' => true,
          //  'showScriptName' => false,
          //  'rules' => [
          //  ],
        ],
       
    ],

    //permitir páginas e subpáginas pelos rbac
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            //'*', //permitir tudo
            'user/security/login',
            'user/security/logout',
            'site/*',
            'country/', 
            ],
        ],

    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
}

return $config;
