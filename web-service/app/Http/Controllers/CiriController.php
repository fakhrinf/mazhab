<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CiriMazhabModel;
use App\Ciricirimodel;

class CiriController extends Controller
{
    //

    public function addciri(Request $request)
    {
        try {

            $kode = $request->kode;
            $ciri = $request->ciriciri;

            $data = new CiriciriModel();
            $data->ciriciri = $ciri;
            $data->kode_ciri = $kode;

            $data->save();

            return response()->json(['message' => "Ciri with id:{$id} added."], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function editciri(Request $request, $id)
    {
        try {

            $kode = $request->kode;
            $ciri = $request->ciriciri;

            $data = CiriciriModel::find($id);

            if(empty($data)) {
                return response()->json(['message' => "data not found."], 404);
            }else{
                $data->ciriciri = $ciri;
                $data->kode_ciri = $kode;
    
                $data->save();
    
                return response()->json(['message' => "Ciri with id:{$id} updated."], 200);
            }

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function deleteciri($id)
    {
        try {

            $ciri = CiriciriModel::find($id);
            if(empty($ciri)){
                return response()->json(['message' => "data not found."], 404);
            }else{
                $ciri->delete();
                $cirimazhab = CiriMazhab::where('ciri_id', $id)->delete();

                return response()->json(['message' => "Ciri with id:{$id} deleted."], 200);
            }

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getallciri()
    {
        try {
            
            $data = CiriciriModel::all();
            return response()->json(['data' => $data], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getciribyid($id)
    {
        try {

            $data = CiriciriModel::find($id);
            return response()->json(['data' => $data], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
