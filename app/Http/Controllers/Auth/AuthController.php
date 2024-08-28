<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    // Fungsi untuk login
    public function login(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Mengambil input email dan password
        $credentials = $request->only('email', 'password');

        // Cek apakah kredensial valid dan mengembalikan token jika benar
        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Mengembalikan token dalam respons
        return response()->json([
            'token' => $token,
            'message' => 'Login successful',
        ], 200);
    }

}
