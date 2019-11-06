<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CategoryModel;
use App\CiriciriModel;

class CategoryController extends Controller
{
    //
    public function getallcategories(Request $request)
    {
        try {
            $data = CategoryModel::all();
            return response()->json(['data' => $data], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getallcategorieswithciries(Request $request)
    {
        $response = array();
        try {
            $data = CategoryModel::all();
            foreach ($data as $v) {
                $res = CiriciriModel::where('category_id', $v->id)->get();
                array_push($response, ['category' => $v->category, 'ciri' => $res]);
            }
            return response()->json(['data' => $response], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function getcategoriesbyid($id)
    {
        try {
            $data = CategoryModel::all();
            return response()->json(['data' => $data], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function addcategories(Request $request)
    {
        try {
            $data = new CategoryModel();
            $data->category = $request->category;
            $data->save();

            return response()->json(['message' => "Category with id:{$data->id} added."], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function editcategories(Request $request, $id)
    {
        try {
            $data = CategoryModel::find($id);
            $data->category = $request->category;
            $data->save();

            return response()->json(['message' => "Category with id:{$id} updated."], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function deletecategories($id)
    {
        try {
            $data = CategoryModel::find($id);
            if(empty($data)){
                return response()->json(['message' => "data not found."], 404);
            }else{
                $data->delete();
                return response()->json(['message' => "Category with id:{$id} deleted."], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
