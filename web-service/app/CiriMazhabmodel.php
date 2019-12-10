<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class CiriMazhabmodel extends Model
{
    //
    protected $table = "cirimazhabs";

    function getCiri() {
        return $this->belongsTo('App\Ciricirimodel', 'ciri_id');
    }

    function getMazhab() {
        return $this->belongsTo('App\Mazhabmodel', 'mazhab_id');
    }

    function getpenjelasan($ids) {
        foreach ($ids as $id) {
            $dt[] = DB::table('cirimazhabs')
                        ->join('ciriciris', 'cirimazhabs.ciri_id', '=', 'ciriciris.id')
                        ->join('mazhabs', 'cirimazhabs.mazhab_id', '=', 'mazhabs.id')
                        ->select('ciriciris.ciriciri', DB::RAW("GROUP_CONCAT(cirimazhabs.penjelasan SEPARATOR '|') as penjelasan"), DB::RAW("GROUP_CONCAT(mazhabs.mazhab,' ') as mazhab"))
                        ->groupBy('cirimazhabs.ciri_id')
                        ->get();
        }

        return $dt;
    }
}
