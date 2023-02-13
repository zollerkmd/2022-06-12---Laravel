<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('autok', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tulajdonos')->references('id')->on('tulajdonosok');
            $table->string('model');
            $table->string('marka');
            $table->integer('evjarat')->nullable();
            $table->integer('ar');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('autok');
    }
};
