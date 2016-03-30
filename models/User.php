<?php
namespace app\models;

use Yii;
use dektrium\user\models\User as BaseUser;


class User extends BaseUser
{

    public function getFullName(){
    $profile = $this->getProfile()->one();
    if (!($profile['name'] == ''))
       return $profile['name'];
    return 'Sem Nome Profile - models/User';
    }

    public function getUserName(){ 
        return $this->username;
    } 

    public function getUserNameEmail()
    {
        return $this->username . ' ' . $this->email;
        // do your magic
    }
}
?>
