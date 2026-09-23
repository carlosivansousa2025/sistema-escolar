<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RotaController;
use App\Http\Controllers\DashBoardController;
use App\Http\Controllers\CursoController;


//Route::resource('rota',RotaController::class);

Route::get('/dashboard',[DashBoardController::class,'index']);
Route::resource('/curso',CursoController::class);


