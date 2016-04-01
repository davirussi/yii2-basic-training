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
 * @property DpostDtag $dpostdtag
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
            [['userId'], 'exist', 'skipOnError' => true, 'targetClass' => '\dektrium\user\models\User', 'targetAttribute' => ['userId' => 'id'], 'message' => Yii::t('app','This user doen\'t exist')],
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

    public function getDTags(){
         return $this->hasMany(DpostDtag::className(), ['post_id' => 'id']);
    }

    public function getAllDTagsPost(){
        $postTags = $this->getDTags()->all();
        $idstag = [];
        
        foreach ($postTags as $dpdt){
            $idstag[] = $dpdt['tag_id'];
        }

        $tag = Dtag::findAll($idstag);
        //select 'nome' from dtag where id IN $idstag
        $tag = Dtag::find()
                     ->asArray()
                     ->select('nome')
                     ->where(['id' => $idstag])
                     ->all();
        $output = [];
        foreach($tag as $data)
            $output[] = $data['nome'];

        return join(" ",$output);
    }
}
