<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ciricirimodel extends Model
{
    //
    protected $table = "ciriciris";

    function getCategory() {
        return $this->belongsTo('App\CategoryModel', 'category_id');
    }

    function getMazhab() {
        return $this->hasMany('App\CiriMazhabModel', 'ciri_id');
    }
}