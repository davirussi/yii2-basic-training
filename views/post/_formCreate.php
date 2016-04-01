<?php

use kartik\widgets\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'titulo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'conteudo')->textarea(['rows' => 6]) ?>
    
    
<?= $form->field($tagmodel, 'tag_id')->widget(Select2::classname(), [
    'data' => $tags,
    'options' => [
        'placeholder' => 'Select Dtags  ...',
        'multiple' => true
    ],
    'pluginOptions' => [
        'allowClear' => true
    ],
]);
?>
   <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
