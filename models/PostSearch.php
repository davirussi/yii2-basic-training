<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Post;

/**
 * PostSearch represents the model behind the search form about `app\models\Post`.
 */
class PostSearch extends Post
{
    /**
     * @inheritdoc
     */
    public $fullname;
    public $tags;
    public function rules()
    {
        
        return [
            [['id'], 'integer'],
            [['titulo', 'conteudo', 'userId', 'fullname', 'tags'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Post::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        //adiciona capacidades de order ao campo do grid
        $dataProvider->sort->attributes['username'] = [
            'asc'  => ['user.username' => SORT_ASC],
            'desc' => ['user.username' => SORT_DESC],
        ];
        $dataProvider->sort->attributes['fullname'] = [
            'asc'  => ['profile.name' => SORT_ASC],
            'desc' => ['profile.name' => SORT_DESC],
        ];


        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        //aqui o joinWith vai buscar a função getUser da classe Post e vai realizar o JOIN
        $query->joinWith('user');
        $query->joinWith('user.profile');

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
        ]);
        $query->andFilterWhere(['like', 'titulo', $this->titulo])
            ->andFilterWhere(['like', 'conteudo', $this->conteudo])
            ->andFilterWhere(['like', 'user.username', $this->userId])
            ->andFilterWhere(['like', 'profile.name', $this->fullname]);
/*       echo('<pre>');
       print_r($query->select('*')->asArray()->one());
       echo('</pre>');
       die();
*/

        return $dataProvider;
    }
}
