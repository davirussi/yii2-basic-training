<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DpostDtag */

$this->title = 'Create Dpost Dtag';
$this->params['breadcrumbs'][] = ['label' => 'Dpost Dtags', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dpost-dtag-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
