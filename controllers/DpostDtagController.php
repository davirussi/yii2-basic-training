<?php

namespace app\controllers;

use Yii;
use app\models\DpostDtag;
use app\models\DpostDtagsearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DpostDtagController implements the CRUD actions for DpostDtag model.
 */
class DpostDtagController extends Controller
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
     * Lists all DpostDtag models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DpostDtagsearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DpostDtag model.
     * @param integer $post_id
     * @param integer $tag_id
     * @return mixed
     */
    public function actionView($post_id, $tag_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($post_id, $tag_id),
        ]);
    }

    /**
     * Creates a new DpostDtag model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new DpostDtag();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'post_id' => $model->post_id, 'tag_id' => $model->tag_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing DpostDtag model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $post_id
     * @param integer $tag_id
     * @return mixed
     */
    public function actionUpdate($post_id, $tag_id)
    {
        $model = $this->findModel($post_id, $tag_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'post_id' => $model->post_id, 'tag_id' => $model->tag_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing DpostDtag model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $post_id
     * @param integer $tag_id
     * @return mixed
     */
    public function actionDelete($post_id, $tag_id)
    {
        $this->findModel($post_id, $tag_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the DpostDtag model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $post_id
     * @param integer $tag_id
     * @return DpostDtag the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($post_id, $tag_id)
    {
        if (($model = DpostDtag::findOne(['post_id' => $post_id, 'tag_id' => $tag_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
