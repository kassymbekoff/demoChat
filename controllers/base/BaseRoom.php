<?php
namespace app\controllers\base;
/**
 * Created by PhpStorm.
 * User: kassymbekoff
 * Date: 28.11.2016
 * Time: 23:42
 */
interface BaseRoom
{
    /**
     * Create room
     * @return array
     */
    public function actionCreateRoom();

    /**
     * Delete room
     * @return array
     */
    public function actionDeleteRoom();

    /**
     * Invite user
     * @return array
     */
    public function actionInvite();
}