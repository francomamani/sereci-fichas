<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecepcionTramitesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recepcion_tramites', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ventanilla_id')->unsigned();
            $table->foreign('ventanilla_id')
                  ->references('id')
                  ->on('ventanillas')
                  ->onDelete('cascade');
            $table->integer('tramite_id')->unsigned();
            $table->foreign('tramite_id')
                  ->references('id')
                  ->on('tramites')
                  ->onDelete('cascade');
            $table->enum('estado_tramite', ['procesando', 'derivado', 'concluido']);
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
        Schema::dropIfExists('recepcion_tramites');
    }
}
