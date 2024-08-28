<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\UserController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Post\PostController;

// Routes tanpa autentikasi JWT
Route::post('/users', [UserController::class, 'store']);
Route::post('/login', [AuthController::class, 'login']);

// Middleware autentikasi JWT
Route::middleware(['auth:api'])->group(function () {

    // Route untuk postingan
    Route::get('/posts', [PostController::class, 'index']);
    Route::post('/posts', [PostController::class, 'store']);

    // Route untuk mendapatkan postingan pengguna berdasarkan id
    Route::get('/users/{id}/posts', [PostController::class, 'getPostsByUserId']);

    // Route untuk menghapus pengguna dan semua postingan terkait
    Route::delete('/users/{id}', [UserController::class, 'destroy']);
    Route::post('/logout',[AuthController::class, 'logout']);
});
