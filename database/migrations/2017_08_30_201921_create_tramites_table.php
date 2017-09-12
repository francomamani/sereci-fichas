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
            $table->integer('categoria_tramite_id')->unsigned();
            $table->foreign('categoria_tramite_id')
                  ->references('id')
                  ->on('categoria_tramites')
                  ->onDelete('cascade');
            $table->integer('cajero_id')->unsigned();
            $table->foreign('cajero_id')
                  ->references('id')
                  ->on('cajeros')
                  ->onDelete('cascade');
            $table->integer('solicitud_autorizacion_id')->unsigned();
            $table->foreign('solicitud_autorizacion_id')
                ->references('id')
                ->on('solicitud_autorizaciones')
                ->onDelete('cascade');
            $table->string('glosa')->default('');
            $table->date('fecha_elaboracion')->default(date('Y-m-d'));
            $table->date('fecha_aceptacion')->default(date('Y-m-d'));
            $table->boolean('con_prueba')->default(false);
            $table->boolean('entregado')->default(false);
            $table->enum('parentesco', ['interesado', 'familiar', 'apoderado']);
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
