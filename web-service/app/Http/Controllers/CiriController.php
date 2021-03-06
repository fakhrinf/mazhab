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

            $kode = $request->kodeciri;
            $ciri = $request->ciriciri;
            $categoryid = $request->kategori;
            $mazhabid = $request->mazhab;
            $mazhabid = explode(',', $mazhabid);

            $data = new CiriciriModel();
            $data->ciriciri = $ciri;
            $data->kode_ciriciri = $kode;
            $data->category_id = $categoryid;

            $data->save();

            $id = $data->id;

            foreach ($mazhabid as $i => $d) {
                $cmz = new CiriMazhabModel();
                $cmz->ciri_id = $id;
                $cmz->mazhab_id = $d;

                $cmz->save();
            }

            return response()->json(['message' => "Ciri with id:{$id} added."], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function editciri(Request $request, $id)
    {
        try {

            $kode = $request->kodeciri;
            $ciri = $request->ciriciri;
            $categoryid = $request->kategori;
            $mazhabid = $request->mazhab;
            $mazhabid = explode(',', $mazhabid);

            $data = CiriciriModel::find($id);

            if(empty($data)) {
                return response()->json(['message' => "data not found."], 404);
            }else{
                $data->ciriciri = $ciri;
                $data->kode_ciriciri = $kode;
                $data->category_id = $categoryid;
    
                $data->save();

                $cirimazhab = CiriMazhabModel::where('ciri_id', $id)->delete();
                foreach ($mazhabid as $i => $d) {
                    $cmz = new CiriMazhabModel();
                    $cmz->ciri_id = $id;
                    $cmz->mazhab_id = $d;

                    $cmz->save();
                }               
    
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
                $cirimazhab = CiriMazhabModel::where('ciri_id', $id)->delete();

                return response()->json(['message' => "Ciri with id:{$id} deleted."], 200);
            }

        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getallciri()
    {
        try {
            
            $data = CiriciriModel::orderBy('id','desc')->get();
            foreach ($data as $i => $ciri) {
                $res[$i] = $ciri;
                foreach ($ciri->getMazhab as $mi => $mid) {
                    $mz[] = $mid->mazhab_id;
                }
                $res[$i]['mazhab'] = array_unique($mz);
                unset($mz);
            }

            // echo "<pre>",print_r($data), "</pre>";
            // exit();
            return response()->json(['data' => $res], 200);

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

    public function getallcirimazhab()
    {
        try {
            $data = CiriMazhabModel::all();
            return response()->json(['data' => $data], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getcirimazhabbyid($ciriid, $mazhabid)
    {
        try {
            if($ciriid == 0) {
                $data = CiriMazhabModel::where('mazhab_id', $mazhabid)->get();
            }else{
                $data = CiriMazhabModel::where('ciri_id', $ciriid)->where('mazhab_id', $mazhabid)->get();
            }
            return response()->json(['data' => $data], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getpenjelasanciri($ciriid)
    {
        $ciri = explode(",",$ciriid);
        foreach ($ciri as $i => $c) {
            $dt = CiriMazhabModel::where('ciri_id', $c)->get();

            foreach ($dt as $ci => $cr) {
                $rs[$i]['ciriid'] = $cr->ciri_id;
                $rs[$i]['mazhabid'] = $cr->mazhab_id;
                $rs[$i]['category'] = $cr->getCiri->getCategory->category;
                $rs[$i]['ciri'] = $cr->getCiri->ciriciri;
                $rs[$i]['mazhab'][] = $cr->getMazhab->mazhab;
                $cr->penjelasan = ($cr->penjelasan == null) ? "-" : $cr->penjelasan;
                $rs[$i]['penjelasan'][] = "<strong>{$cr->getMazhab->mazhab}</strong><hr/> {$cr->penjelasan}<br/><br/>";
            }
        }

        // echo "<pre>",print_r($rs),"</pre>";
        // exit();

        $tmp = array();

        foreach ($rs as $i => $r) {
            // echo "<pre>",print_r($rs),"</pre>";            
            $tmp[$r['category']][] = $r;
        }

        // echo "<pre>",print_r($tmp),"</pre>";
        // exit();

        $output = array();

        foreach($tmp as $cat => $rs)
        {
            $output[] = array(
                'category' => $cat,
                'penjelasan' => $rs
            );
        }

        // echo "<pre>",print_r($output),"</pre>";
        // exit();

        return response()->json(['data' => $output], 200);
    }
}
