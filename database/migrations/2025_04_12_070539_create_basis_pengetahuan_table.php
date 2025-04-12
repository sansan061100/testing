<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('basis_pengetahuan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('penyakit_id')->constrained('penyakit')->onDelete('cascade');
            $table->foreignId('gejala_id')->constrained('gejala')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('basis_pengetahuan');
    }
};
