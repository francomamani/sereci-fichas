<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Namshi\JOSE\JWT;
use Tymon\JWTAuth\Exceptions\JWTException;
use JWTAuth;
use App\Administrador;
use App\Cajero;
use App\Comunicador;
use App\User;

class UserController extends Controller
{
    public function index(){
        return response()->json(User::orderBy('nombres', 'asc')->get(), 200);
    }
    public function show($id){
        return response()->json(User::find($id), 200);
    }
    public function store(){
        $data = [
            'cuenta'=> request()->input('cuenta'),
            'password'=>bcrypt(request()->input('carnet')),
            'nombres'=>request()->input('nombres'),
            'apellidos'=>request()->input('apellidos'),
            'carnet'=>request()->input('carnet'),
            'celular'=>request()->input('celular'),
            'tipo'=> request()->input('tipo'),
            'activo'=>true
        ];
        $user = User::create($data);
        switch (request()->input('tipo')){
            case 'administrador':
                Administrador::create(['user_id'=>$user->id]);
                break;
            case 'comunicador':
                Comunicador::create(['user_id'=>$user->id]);
                break;
            case 'cajero':
                Cajero::create(['user_id'=>$user->id]);
                break;
        }
        return response()->json($user , 201);
    }
    public function update($id){
        $user =  User::find($id);
        $user->update(request()->all());
        return response()->json($user, 200);
    }
    public function destroy($id){
        $user = User::find($id);
        $user->delete();
        return response()->json(['exito'=>'Usuario eliminado con id: ' . $user->id], 200);
    }
    public function activar($id){
        $user = User::find($id);
        $user->activo = true;
        $user->save();
        return response()->json(['exito'=>'Usuario activado exitosamente'], 200);
    }
    public function desactivar($id){
        $user = User::find($id);
        $user->activo = false;
        $user->save();
        return response()->json(['exito'=>'Usuario desactivado exitosamente'], 200);
    }
    public function autenticar(Request $request){
        $credentials = $request->only('cuenta', 'password');
        $token = null;
        try {
            // attempt to verify the credentials and create a token for the user
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 401);
            }
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            return response()->json(['error' => 'could_not_create_token'], 500);
        }
        $usuario = JWTAuth::toUser($token);
        return response()->json(compact('token', 'usuario'));
    }
    public function usuario(){
        $user = JWTAuth::toUser();
        return response()->json($user);
    }
    public function refreshToken(){
        $token = JWTAuth::parseToken();
        return response()->json(compact('token'));
    }
/*    public function getRol(){
        $response = null;
        $user = JWTAuth::toUser();
        $cajeros = Cajero::where('user_id', $user->id)->count();
        if ($cajeros > 0){
            $response = Cajero::where('user_id', $user->id)->first();
        }else{
            $administradores = Administrador::where('user_id', $user->id)->count();
            if ($administradores > 0){
                $response = Administrador::where('user_id', $user->id)->first();
            }else{
                $response = Comunicador::where('user_id', $user->id)->first();
            }
        }
        return response()->json($response);
    }*/
}
