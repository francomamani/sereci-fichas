<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTramitesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tramites', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ficha_id')->unsigned();
            $table->foreign('ficha_id')
                  ->references('id')
                  ->on('fichas')
                  ->onDelete('cascade');
            $table->integer('tipo_tramite_id')->unsigned();
            $table->foreign('tipo_tramite_id')
                  ->references('id')
                  ->on('tipo_tramites')
                  ->onDelete('cascade');
            $table->integer('cajero_id')->unsigned();
            $table->foreign('cajero_id')
                  ->references('id')
                  ->on('cajeros')
                  ->onDelete('cascade');
            $table->string('descripcion');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tramites');
    }
}
