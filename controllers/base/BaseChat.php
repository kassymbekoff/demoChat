<?php
namespace app\controllers\base;
/**
 * Created by PhpStorm.
 * User: kassymbekoff
 * Date: 28.11.2016
 * Time: 23:40
 */
interface BaseChat
{
    /**
     * Send msg
     * @return array
     */
    public function actionSendMsg();

    /**
     * Update chat
     * @return array
     */
    public function actionUpdateChat();
}