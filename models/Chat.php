<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "chat".
 *
 * @property integer $id
 * @property integer $from
 * @property integer $to
 * @property integer $author_id
 * @property integer $created
 * @property string $content
 * @property integer $chat_type
 * @property integer $room_id
 */
class Chat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'chat';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['from', 'to', 'author_id', 'created'], 'required'],
            [['from', 'to', 'author_id', 'created', 'chat_type', 'room_id'], 'integer'],
            [['content'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'from' => 'From',
            'to' => 'To',
            'author_id' => 'Author ID',
            'created' => 'Created',
            'content' => 'Content',
            'chat_type' => 'Chat Type',
            'room_id' => 'Room ID',
        ];
    }
}
