<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePartidasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('partidas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tramite_id')->unsigned();
            $table->foreign('tramite_id')
                  ->references('id')
                  ->on('tramites')
                  ->onDelete('cascade');
            $table->integer('num_registro')->unsigned();
            $table->string('orc');
            $table->string('libro');
            $table->string('num_partida');
            $table->date('fecha_inscripcion');
            $table->string('departamento');
            $table->enum('estado_partida', ['cancelar', 'vigente', 'igualar']);
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
        Schema::dropIfExists('partidas');
    }
}
