<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('autenticar', 'UserController@autenticar');
Route::group(['middleware'=>['jwt-auth']], function (){
    Route::get('usuario', 'UserController@usuario');
    Route::resource('usuarios', 'UserController', ['except'=>['create','edit']]);
    Route::put('usuarios-activar/{id}', 'UserController@activar');
    Route::put('usuarios-desactivar/{id}', 'UserController@desactivar');
    Route::resource('noticias', 'NoticiaController', ['except'=>['create','edit']]);
    Route::get('noticias-habilitadas', 'NoticiaController@noticiasHabilitadas');
    Route::get('noticias-deshabilitadas', 'NoticiaController@noticiasDeshabilitadas');
    Route::resource('agencias', 'AgenciaController', ['except' => ['create', 'edit']]);
    Route::resource('categorias', 'CategoriaController', ['except' => ['create', 'edit']]);
    Route::resource('fichas', 'FichaController', ['except' => ['create', 'edit']]);
    Route::resource('tipo-tramites', 'TipoTramiteController', ['except' => ['create', 'edit']]);
    Route::resource('cajeros', 'CajeroController', ['except' => ['create', 'edit']]);
    Route::resource('administradores', 'AdministradorController', ['except' => ['create', 'edit']]);
    Route::resource('comunicadores', 'ComunicadorController', ['except' => ['create', 'edit']]);
    Route::resource('asignacion-categorias', 'AsignacionCategoriaController', ['except' => ['create', 'edit']]);
    Route::resource('videos', 'VideoController', ['except' => ['create', 'edit']]);
    Route::resource('tramites', 'TramiteController', ['except' => ['create', 'edit']]);
    Route::resource('categoria-tramites', 'CategoriaTramiteController', ['except' => ['create', 'edit']]);
    Route::resource('ventanillas', 'VentanillaController', ['except' => ['create', 'edit']]);
    Route::resource('asignacion-ventanillas', 'AsignacionVentanillaController', ['except' => ['create', 'edit']]);
    Route::resource('normativas', 'NormativaController', ['except'=>['create', 'edit']]);
    Route::resource('articulos', 'ArticuloController', ['except'=>['create', 'edit']]);


    Route::resource('partidas', 'PartidaController', ['except' => ['create', 'edit']]);
    Route::resource('solicitantes', 'SolicitanteController', ['except' => ['create', 'edit']]);
    Route::resource('items', 'ItemController', ['except' => ['create', 'edit']]);
    Route::resource('detalles', 'DetalleController', ['except' => ['create', 'edit']]);
    Route::resource('recepcion_tramites', 'RecepcionTramiteController', ['except' => ['create', 'edit']]);
    Route::resource('inscritos', 'InscritoController', ['except' => ['create', 'edit']]);
    Route::resource('solicitud-autorizaciones', 'SolicitudAutorizacionController', ['except' => ['create', 'edit']]);

    Route::get('cajeros-id', 'CajeroController@cajerosId', ['except' => ['create', 'edit']]);
    Route::get('administradores-user', 'AdministradorController@administradoresUser');
    Route::get('comunicadores-user', 'ComunicadorController@comunicadoresUser');
    Route::get('cajeros-user', 'CajeroController@cajerosUser');
    Route::get('refresh-token', 'UserController@refreshToken');

    Route::get('video-ids', 'VideoController@videoIds');

    Route::get('get-info-video/{id}', 'VideoController@getInfoVideo');
    Route::get('download/{id}', 'VideoController@download');

    Route::get('llamar-ficha/{ventanilla_id}', 'FichaController@llamarFicha');
    Route::post('solicitante-buscar', 'SolicitanteController@buscar');
    Route::post('inscrito-buscar', 'InscritoController@buscar');

    Route::get('get-categoria-tramites/{tipo_tramite_id}', 'TipoTramiteController@getCategoriaTramites');
    Route::get('get-asignacion-ventanillas', 'CajeroController@getAsignacionVentanillas');
});
Route::get('file/{id}', 'VideoController@file');
Route::post('guardar', 'ExampleController@store');
Route::get('test', 'ExampleController@test');