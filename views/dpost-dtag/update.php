<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\DpostDtag */

$this->title = 'Update Dpost Dtag: ' . $model->post_id;
$this->params['breadcrumbs'][] = ['label' => 'Dpost Dtags', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->post_id, 'url' => ['view', 'post_id' => $model->post_id, 'tag_id' => $model->tag_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dpost-dtag-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
