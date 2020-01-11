<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CiriMazhabmodel;

class HasilController extends Controller
{
    //
    public function addhasil()
    {
        # code...
    }

    public function editpenjelasan(Request $request)
    {
        try {
            $penjelasan = CiriMazhabmodel::where([
                "ciri_id" => $request->ciriid,
                "mazhab_id" => $request->mazhabid
            ])->first();
    
            $penjelasan->penjelasan = $request->penjelasan;
            $penjelasan->save();

            return response()->json(['message' => "Update data success"], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }

    }

    public function deletehasil($id)
    {
        # code...
    }

    public function getallpenjelasanhasil()
    {
        $cirimazhab = CiriMazhabmodel::all();
        foreach ($cirimazhab as $i => $val) {
            $res[$i]['ciriid'] = $val->ciri_id;
            $res[$i]['mazhabid'] = $val->mazhab_id;
            $res[$i]['ciri'] = $val->getCiri->ciriciri;
            $res[$i]['mazhab'] = $val->getMazhab->mazhab;
            $res[$i]['penjelasan'] = $val->penjelasan;
        }

        return response()->json(['data' => $res], 200);
    }

    public function getpenjelasanhasilbyid($id)
    {
        # code...
    }
}
