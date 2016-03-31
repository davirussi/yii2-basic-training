<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\DpostDtag */

$this->title = $model->post_id;
$this->params['breadcrumbs'][] = ['label' => 'Dpost Dtags', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dpost-dtag-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'post_id' => $model->post_id, 'tag_id' => $model->tag_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'post_id' => $model->post_id, 'tag_id' => $model->tag_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'post_id',
            'tag_id',
        ],
    ]) ?>

</div>
