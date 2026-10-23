<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RotaController;
use App\Http\Controllers\DashBoardController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\TipoConteudoController;
use App\Http\Controllers\CargoController;
use App\Http\Controllers\DisciplinaController;



//Route::resource('rota',RotaController::class);

Route::get('dashboard',[DashBoardController::class,'index']);
Route::resource('curso',CursoController::class);
Route::resource('tipo-conteudo',TipoConteudoController::class);
Route::resource('cargo',CargoController::class);
Route::get('disciplina/conteudos/{id}', [DisciplinaController::class, 'conteudos'])
      ->name('disciplina.conteudos');

Route::post('disciplina/add-conteudos', [DisciplinaController::class, 'conteudos'])
      ->name('disciplina.add-conteudo');

Route::resource('/disciplina',DisciplinaController::class);


