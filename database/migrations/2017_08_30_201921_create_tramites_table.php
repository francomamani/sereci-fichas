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
            $table->integer('ventanilla_id')->unsigned();
            $table->foreign('ventanilla_id')
                ->references('id')
                ->on('ventanillas')
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
            $table->string('glosa');
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
