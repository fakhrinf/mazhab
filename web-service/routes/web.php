<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('login', ['as' => 'login', 'uses' => 'UserController@login']);
$router->put('logout/{id}', ['as' => 'logout', 'uses' => 'UserController@logout']);
$router->put('updatepassword/{id}', ['as' => 'update_password', 'uses' => 'UserController@updatepassword']);

$router->get('mazhab', ['as' => 'mazhab', 'uses' => 'MazhabController@getallmazhab']);
$router->get('mazhab/{id}', ['as' => 'mazhab_id', 'uses' => 'MazhabController@getmazhabbyid']);
$router->delete('mazhab/{id}', ['as' => 'mazhab_delete', 'uses' => 'MazhabController@deletemazhab']);
$router->put('mazhab/{id}', ['as' => 'mazhab_edit', 'uses' => 'MazhabController@editmazhab']);
$router->post('mazhab', ['as' => 'mazhab_add', 'uses' => 'MazhabController@addmazhab']);

$router->get('ciriciri', ['as' => 'ciriciri', 'uses' => 'CiriController@getallciri']);
$router->get('ciriciri/{ciriid}/penjelasan', ['as' => 'ciriciripenjelasan', 'uses' => 'CiriController@getpenjelasanciri']);
$router->get('ciriciri/{id}', ['as' => 'ciriciri_id', 'uses' => 'CiriController@getallciribyid']);
$router->post('ciriciri', ['as' => 'ciriciri_add', 'uses' => 'CiriController@addciri']);
$router->put('ciriciri/{id}', ['as' => 'ciriciri_edit', 'uses' => 'CiriController@editciri']);
$router->delete('ciriciri/{id}', ['as' => 'ciriciri_delete', 'uses' => 'CiriController@deleteciri']);

$router->get('cirimazhab', ['as' => 'cirimazhab', 'uses' => 'CiriController@getallcirimazhab']);
$router->get('cirimazhab/{ciriid}/{mazhabid}', ['as' => 'cirimazhab_byid', 'uses' => 'CiriController@getcirimazhabbyid']);

$router->get('hasil', ['as' => 'hasil', 'uses' => 'HasilController@getallhasil']);
$router->get('hasil/{id}', ['as' => 'hasil_id', 'uses' => 'HasilController@getallhasilbyid']);
$router->post('hasil', ['as' => 'hasil_add', 'uses' => 'HasilController@addhasil']);
$router->put('hasil/{id}', ['as' => 'hasil_edit', 'uses' => 'HasilController@edithasil']);
$router->delete('hasil/{id}', ['as' => 'hasil_delete', 'uses' => 'HasilController@deletehasil']);

$router->get('category', ['as' => 'category', 'uses' => 'CategoryController@getallcategories']);
$router->get('categoryciri', ['as' => 'getallcategorieswithciries', 'uses' => 'CategoryController@getallcategorieswithciries']);
$router->get('category/{id}', ['as' => 'category_id', 'uses' => 'CategoryController@getcategoriesbyid']);
$router->post('category', ['as' => 'category_add', 'uses' => 'CategoryController@addcategories']);
$router->put('category/{id}', ['as' => 'category_edit', 'uses' => 'CategoryController@editcategories']);
$router->delete('category/{id}', ['as' => 'category_delete', 'uses' => 'CategoryController@deletecategories']);