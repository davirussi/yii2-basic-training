<?php
namespace app\rbac;

use Yii;
use Yii\app;
use yii\rbac\Rule;
use yii\helpers\BaseUrl;
use yii\helpers\Url;
use app\assets\AppAsset;


/**
 * Checks if authorID matches user passed via params
 */
class AuthorRule extends Rule
{
    public $name = 'isAuthor';

    /**
     * @param string|integer $user the user ID.
     * @param Item $item the role or permission that this rule is associated with
     * @param array $params parameters passed to ManagerInterface::checkAccess().
     * @return boolean a value indicating whether the rule permits the role or permission it is associated with.
     */
    

    public function test()
    {
        return true;
    }

   
    public function execute($user, $item, $params)
    {
        if ($user == $params['userId'])
           return true;
        Url::previous();
        return false;

//        return false;
/*         if ( Yii::$app->user->can('permission_admin') ){
          return true;
}
      return false;
*/
        $w = Url::current();
        $y = Yii::$app->user;
//        return true;
        echo ($w);
        
        echo ("<pre>");
 //       print_r($y);
        echo ("<br> ");
        print_r($params);
        echo ("user<br> ");
        print_r($user);
        echo ("<br>");
        print_r($item);
        echo("/<pre>");
         die();

 
        return isset($params['post']) ? $params['post']->createdBy == $user : false;
    }
}
?>
