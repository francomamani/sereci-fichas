<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAsignacionVentanillasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asignacion_ventanillas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ventanilla_id')->unsigned();
            $table->foreign('ventanilla_id')
                  ->references('id')
                  ->on('ventanillas')
                  ->onDelete('cascade');
            $table->integer('cajero_id')->unsigned();
            $table->foreign('cajero_id')
                  ->references('id')
                  ->on('cajeros')
                  ->onDelete('cascade');
            $table->boolean('activo')->default(true);
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
        Schema::dropIfExists('asignacion_ventanillas');
    }
}
