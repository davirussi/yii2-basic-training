<?php

namespace app\rbac;
//namespace yii\rbac;
use Yii;
use yii\rbac\DbManager as DbM;


class MyDbManager extends DbM
{
    public $ruleFile = 'app/rbac/AuthoRule.php';
 
public function load(){
        $rules = $this->loadFromFile(Yii::getAlias($this->ruleFile));
        foreach ($rules as $ruleData) {
            $this->addRule(unserialize($ruleData));
        }
      die();
}
}

?>
