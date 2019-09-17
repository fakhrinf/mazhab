<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mazhabmodel;

class MazhabController extends Controller
{
    //

    public function addmazhab(Request $request)
    {
        $kode = $request->kodemazhab;
        $mazhab = $request->mazhab;

        try {
            $data = new Mazhabmodel();
            $data->kode_mazhab = $kode;
            $data->mazhab = $mazhab;
            $data->save();

            return response()->json(['message' => "data with id:{$data->id} added"], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function editmazhab(Request $request, $id)
    {
        $kode = $request->kodemazhab;
        $mazhab = $request->mazhab;

        try {
            $data = Mazhabmodel::find($id);

            if(empty($data)){
                return response()->json(['message' => "data not found."], 404);
            }else{
                $data->kode_mazhab = $kode;
                $data->mazhab = $mazhab;
                $data->save();

                return response()->json(['message' => "data with id:{$id} updated"], 200);
            }

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    function deletemazhab($id)
    {
        try {
            $data = Mazhabmodel::find($id);
            if(empty($data)) {
                return response()->json(['message' => "data not found."], 404);
            }else{
                $data->delete();

                return response()->json(['message' => "Mazhab with id:{$id} deleted."], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getallmazhab()
    {
        try {
            $data = Mazhabmodel::all();

            return response()->json(['data' => $data], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getmazhabbyid($id)
    {
        try {
            $data = Mazhabmodel::find($id);

            if(empty($data)){
                return response()->json(['message' => "data not found."], 404);
            }else{
                return response()->json(['data' => $data], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }

    }
}
