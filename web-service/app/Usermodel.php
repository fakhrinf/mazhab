<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Usermodel extends Model
{
    protected $table = "users";

    public function checkuser($username, $password)
    {
        $ck = Usermodel::where('username', $username)->where('password', md5($password))->get();
        if(!empty($ck)){
            return $ck;
        }else{
            return null;
        }
    }
}
