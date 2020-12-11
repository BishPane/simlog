<?php

use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\AdminCheck;
use GuzzleHttp\Middleware;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::prefix('app')->middleware(['admin-check'])->group(function(){

Route::get('/get_roles',[ AdminController::class, 'getRoles']);
Route::get('/get_users',[ AdminController::class, 'getUsers']);
Route::post('/create_user',[ AdminController::class, 'addUser']);

Route::post('/user_login',[ AdminController::class, 'userLogin']);

Route::post('/assign_roles',[ AdminController::class, 'assignPermission']);



});

Route::get('/', function () {
    return view('welcome');
});


Route::get('/logout',[AdminController::class,'logout']);
Route::get('/login',[AdminController::class,'index']);

Route::get('/',[AdminController::class,'index']);
Route::any('{slug}',[AdminController::class,'index']);