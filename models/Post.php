<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "post".
 *
 * @property integer $id
 * @property string $titulo
 * @property string $conteudo
 * @property integer $userId
 *
 * @property User $user
 */
class Post extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['conteudo'], 'string'],
            [['userId'], 'required'],
            [['userId'], 'integer'],
            [['titulo'], 'string', 'max' => 45],
            //alterando essa linha pode-se validar usando um outro modelo não padrão
            [['userId'], 'exist', 'skipOnError' => true, 'targetClass' => '\dektrium\user\models\User', 'targetAttribute' => ['userId' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'titulo' => 'Titulo',
            'conteudo' => 'Conteudo',
            'userId' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'userId']);
    }
}
