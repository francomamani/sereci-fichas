<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoriaTramitesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categoria_tramites', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tipo_tramite_id')->unsigned();
            $table->foreign('tipo_tramite_id')
                  ->references('id')
                  ->on('tipo_tramites')
                  ->onDelete('cascade');
            $table->string('descripcion');
            $table->integer('duracion_horas')->unsigned();
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
        Schema::dropIfExists('categoria_tramites');
    }
}
