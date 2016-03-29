<?php

namespace app\controllers;

use Yii;
use app\models\Post;
use app\models\PostSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use app\models\User;

/**
 * PostController implements the CRUD actions for Post model.
 */
class PostController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PostSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @param integer $userId
     * @return mixed
     */
    public function actionView($id, $userId)
    {
        return $this->render('view', [
            'model' => $this->findModel($id, $userId),
        ]);
    }

    /**
     * Creates a new Post model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Post();
        $model->userId = Yii::$app->user->identity->id;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'userId' => $model->userId]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Post model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @param integer $userId
     * @return mixed
     */

    public function getUserList(){
         //o problema dessa abordagem que find_all() vai retornar toda a tabela e todas 
         //as linhas e vai carregar na memória
         $output = ArrayHelper::map(User::find()->all(), 'id', 'username');
         
         //aqui só será retornado os atributos username, email e id de todos os registros
         $output = ArrayHelper::map(User::find()->select(['username','email','id'])->all(), 'id', 'username');     
        
         //aqui será retornado só os atributos username email e id, porém ele irá mostrar a informação utilizando a função getUserNameEmail (Yii procura pela função get + UserNameEmail)
         $output = ArrayHelper::map(User::find()->select(['username','email','id'])->all(), 'id', 'UserNameEmail');     
         return $output;
    }

    public function actionUpdate($id, $userId)
    {
        $model = $this->findModel($id, $userId);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'userId' => $model->userId]);
        } else {
            $lista_users = $this->getUserList();
            return $this->render('update', [
                'lista_users' => $lista_users,
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Post model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @param integer $userId
     * @return mixed
     */
    public function actionDelete($id, $userId)
    {
        $this->findModel($id, $userId)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @param integer $userId
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $userId)
    {
        if (($model = Post::findOne(['id' => $id, 'userId' => $userId])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
