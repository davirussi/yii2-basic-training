<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dtag".
 *
 * @property integer $id
 * @property string $nome
 * @property string $descricao
 *
 * @property DpostDtag[] $dpostDtags
 * @property Post[] $posts
 */
class Dtag extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dtag';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nome'], 'required'],
            [['nome', 'descricao'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nome' => 'Nome',
            'descricao' => 'Descricao',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDpostDtags()
    {
        return $this->hasMany(DpostDtag::className(), ['tag_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosts()
    {
        return $this->hasMany(Post::className(), ['id' => 'post_id'])->viaTable('dpost_dtag', ['tag_id' => 'id']);
    }
}
