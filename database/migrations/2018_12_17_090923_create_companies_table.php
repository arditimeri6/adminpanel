<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 191);
            $table->string('company_slug', 191)->unique();
            $table->string('website', 191)->nullable();
            $table->string('address', 191)->nullable();
            $table->string('phone_number')->nullable();
            $table->text('description', 65535)->nullable();
            $table->boolean('status')->default(1);
            $table->integer('created_by')->unsigned()->index('company_user_id_foreign');
            $table->integer('updated_by')->unsigned()->nullable();
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
        Schema::dropIfExists('companies');
    }
}
