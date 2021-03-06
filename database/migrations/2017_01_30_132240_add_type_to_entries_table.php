<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTypeToEntriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('entries', function (Blueprint $table) {
            $table->tinyInteger('type')->unsigned()->nullable();
            // 0 - user registered for tournament
            // 2 - user registered with decklist - TO BE ADDED LATER
            // 3 - claim with decklists
            // 4 - claim without decklists
            // 11 - imported entry by NRTM
            // 12 - imported entry by CSV - depricated
            // 13 - imported entry by manual
            // 14 - imported entry by Cobr.ai
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('entries', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
