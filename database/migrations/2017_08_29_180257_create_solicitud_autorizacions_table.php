<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSolicitudAutorizacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicitud_autorizaciones', function (Blueprint $table) {
            $table->increments('id');
            $table->boolean('rectificacion')->default(false);
            $table->boolean('complementacion')->default(false);
            $table->boolean('ratificacion')->default(false);
            $table->boolean('cambio')->default(false);
            $table->boolean('cancelacion')->default(false);
            $table->boolean('reposicion')->default(false);
            $table->boolean('traspaso')->default(false);
            $table->string('num_partida_fecha_inscripcion')->nullable();
            $table->string('inscrito_esposo_fallecido')->nullable();
            $table->string('lugar_nacimiento')->nullable();
            $table->date('fecha_nacimiento')->nullable();
            $table->string('padre')->nullable();
            $table->string('complemento_apellido_convencional')->nullable();
            $table->string('otros_datos_correccion')->nullable();
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
        Schema::dropIfExists('solicitud_autorizaciones');
    }
}
