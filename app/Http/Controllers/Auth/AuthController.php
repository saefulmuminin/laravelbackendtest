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
    public function logout(Request $request)
    {
        try {
            // Mengambil token dari header Authorization
            $token = $request->bearerToken();

            // Menyimpan token yang dicabut ke dalam blacklist jika Anda menggunakan JWT blacklist
            JWTAuth::setToken($token)->invalidate();

            // Kembalikan respons sukses
            return response()->json(['message' => 'Logout berhasil'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Logout gagal', 'error' => $e->getMessage()], 500);
        }
    }
}
