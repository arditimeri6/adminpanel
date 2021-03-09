<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 191);
            $table->string('task_slug', 191)->unique();
            $table->integer('timeframe')->unsigned();
            $table->text('description', 65535)->nullable();
            $table->boolean('status')->default(1);
            $table->integer('created_by')->unsigned()->index('task_user_id_foreign');
            $table->integer('updated_by')->unsigned()->nullable();
            $table->integer('project_id')->unsigned()->index('task_project_id_foreign');
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
        Schema::dropIfExists('tasks');
    }
}
