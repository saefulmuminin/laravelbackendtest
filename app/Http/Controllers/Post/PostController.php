<?php

namespace App\Http\Controllers\Post;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    public function index(Request $request)
    {
        // Ambil parameter search dari query string (opsional)
        $search = $request->query('search');

        // Ambil parameter limit dari query string (opsional, default 10)
        $limit = $request->query('limit', 10);

        // Ambil parameter page dari query string (opsional, default 1)
        $page = $request->query('page', 1);

        // Query untuk mendapatkan postingan
        $query = Post::query();

        // Jika ada parameter search, tambahkan kondisi pencarian berdasarkan title
        if ($search) {
            $query->where('title', 'like', '%' . $search . '%');
        }

        // Ambil postingan sesuai limit dan paginasi
        $posts = $query->paginate($limit, ['*'], 'page', $page);

        // Jika hasil pencarian kosong dan search parameter diberikan, kembalikan semua postingan
        if ($search && $posts->isEmpty()) {
            // Kembalikan semua postingan dengan paginasi
            $posts = Post::paginate($limit, ['*'], 'page', $page);
        }

        // Kembalikan data postingan dalam bentuk JSON
        return response()->json($posts, 200);
    }

    public function store(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'body' => 'required|string',
            'user_id' => 'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        // Simpan postingan
        $post = Post::create([
            'title' => $request->title,
            'body' => $request->body,
            'user_id' => $request->user_id,
        ]);

        // Kembalikan respons dengan status 201 dan data postingan
        return response()->json($post, 201);
    }

    public function getPostsByUserId($id)
    {
        // Cari pengguna berdasarkan ID
        $user = User::find($id);

        // Jika pengguna tidak ditemukan
        if (!$user) {
            return response()->json(['message' => 'Pengguna tidak ditemukan'], 404);
        }

        // Ambil semua postingan milik pengguna
        $posts = $user->posts; // pastikan relasi 'posts' didefinisikan dengan benar di model User

        // Jika pengguna tidak memiliki postingan
        if ($posts->isEmpty()) {
            return response()->json(['message' => 'Tidak ada postingan untuk pengguna ini'], 404);
        }

        // Kembalikan data postingan milik pengguna dalam bentuk JSON
        return response()->json($posts, 200);
    }

}
