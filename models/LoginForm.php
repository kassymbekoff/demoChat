<?php

namespace app\models;

use Yii;
use yii\base\Model;
use mdm\admin\models\form\Login as BaseLoginForm;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class LoginForm extends BaseLoginForm
{
}
