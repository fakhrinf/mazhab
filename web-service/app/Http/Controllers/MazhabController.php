<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MazhabController extends Controller
{
    //

    public function addmazhab()
    {
        # code...
    }

    public function editmazhab($id)
    {
        # code...
    }

    function deletemazhab($id)
    {
        # code...
    }

    public function getallmazhab()
    {
        # code...
    }

    public function getmazhabbyid($id)
    {
        return response()->json(['id' => $id, 'mazhab' => 'sample'], 200);
    }
}
