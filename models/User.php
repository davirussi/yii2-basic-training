<?php
namespace app\models;

use dektrium\user\models\User as BaseUser;

class User extends BaseUser
{
    public function getUserNameEmail()
    {
        return $this->username . ' ' . $this->email;
        // do your magic
    }
}
?>
