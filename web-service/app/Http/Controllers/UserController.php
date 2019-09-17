<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Usermodel;

class UserController extends Controller
{
    //

    public function login(Request $request)
    { 
        $username = $request->username;
        $password = $request->password;

        $mdl = new Usermodel();
        $dt = $mdl->checkuser($username, $password);
        if(count($dt) > 0){
            return response()->json(['data' => $dt], 200);
        }else{
            return response()->json(['message' => "Username and password not match"], 400);
        }
    }

    public function updatepassword(Request $request, $id)
    {
        $newpassword = $request->newpassword;

        try {
            $user = Usermodel::find($id);
            if(empty($user)) {
                return response()->json(['message' => 'data not found'], 404);
            }else{
                $user->password = md5($newpassword);
                $user->save();
    
                return response()->json(['message' => 'password updated'], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
