<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Dtag */

$this->title = 'Create Dtag';
$this->params['breadcrumbs'][] = ['label' => 'Dtags', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dtag-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
