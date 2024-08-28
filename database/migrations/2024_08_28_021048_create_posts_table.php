<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        // Membuat tabel 'posts'
        Schema::create('posts', function (Blueprint $table) {
            $table->id(); // Membuat kolom 'id' sebagai primary key dengan auto-increment
            $table->string('title'); // Membuat kolom 'title' dengan tipe VARCHAR, tidak boleh kosomg
            $table->text('body'); // Membuat kolom 'body' dengan tipe TEXT, tidak boleh kosomg
            $table->unsignedBigInteger('user_id'); // Membuat kolom 'user_id' dengan tipe INT, sebagai foreign key yang merujuk ke tabel 'users'
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade'); // Menentukan 'user_id' sebagai foreign key yang merujuk ke kolom 'id' pada tabel 'users'. Jika user dihapus, postingannya juga ikut terhapus (cascade)
            $table->timestamp('created_at')->useCurrent(); // Membuat kolom 'created_at' dengan default CURRENT_TIMESTAMP
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate(); // Membuat kolom 'updated_at' dengan default CURRENT_TIMESTAMP, akan diperbarui setiap kali data diupdate
        });
    }

    /**
     * Menghapus migrasi.
     *
     * @return void
     */
    public function down()
    {
        // Menghapus tabel 'posts' jika ada
        Schema::dropIfExists('posts');
    }
};
