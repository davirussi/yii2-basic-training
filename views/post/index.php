<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'titulo',
            'conteudo:ntext',
            [
                'enableSorting' => TRUE,
                'attribute' => 'userId',
                'label' => 'Username',
                'value'=> 'user.userName' //valor vem direto do models/User
            ],
            [
                'enableSorting' => TRUE,
                'attribute' => 'fullname',
                'label' => 'Full Name',
                'value'=> 'user.FullName' //valor vem direto do models/User
            ], 
            [
                'enableSorting' => TRUE,
                'attribute' => 'tags',
                'label' => 'Tag',
                'value'=> 'alldtagspost' //valor vem direto do models/Post
            ], 
             
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete} '
            ],
        ],
    ]); ?>
</div>
