<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCiriMazhabmodelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cirimazhabs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('ciri_id');
            $table->integer('mazhab_id');
            $table->text("penjelasan");
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
        Schema::dropIfExists('ciri_mazhabmodels');
    }
}
