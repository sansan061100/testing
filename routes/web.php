<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PrintController;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/print/{record}', [PrintController::class, 'print'])->name('print');
Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');
Route::post('/', [DashboardController::class, 'kontak']);
