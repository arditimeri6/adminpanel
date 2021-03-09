<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 191);
            $table->string('project_slug', 191)->unique();
            $table->integer('timeframe')->unsigned();
            $table->text('description', 65535)->nullable();
            $table->boolean('status')->default(1);
            $table->integer('created_by')->unsigned()->index('project_user_id_foreign');
            $table->integer('updated_by')->unsigned()->nullable();
            $table->integer('company_id')->unsigned()->index('project_company_id_foreign');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projects');
    }
}
