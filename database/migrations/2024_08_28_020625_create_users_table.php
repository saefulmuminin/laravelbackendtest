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
        // Membuat tabel 'users'
        Schema::create('users', function (Blueprint $table) {
            $table->id(); // Membuat kolom 'id' sebagai primary key dengan auto-increment
            $table->string('name'); // Membuat kolom 'name' dengan tipe VARCHAR, tidak boleh kosong
            $table->string('email')->unique(); // Membuat kolom 'email' dengan tipe VARCHAR, tidak boleh kosong, dan harus unik dan beda
            $table->string('password'); // Membuat kolom 'password' dengan tipe VARCHAR, tidak boleh kosong
            $table->timestamp('created_at')->useCurrent(); // Membuat kolom 'created_at' dengan nilai default CURRENT_TIMESTAMP
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate(); // Membuat kolom 'updated_at' dengan default CURRENT_TIMESTAMP, dan akan diperbarui setiap kali ada perubahan data
        });
    }

    /**
     * Menghapus migrasi.
     *
     * @return void
     */
    public function down()
    {
        // Menghapus tabel 'users' jika ada
        Schema::dropIfExists('users');
    }
};
