<?php

use App\Models\Access\User\User;
use App\Models\Project\Project;
use Faker\Generator as Faker;

$factory->define(Project::class, function (Faker $faker) {
    $title = $faker->sentence(3);

    $newestProject = Project::orderBy('id', 'desc')->first();

    return [
        'title'             => $title,
        'project_slug'      => str_slug($title),
        'timeframe'         => $faker->numberBetween(1, 50),
        'description'       => $faker->paragraph,
        'status'            => 1,
        'created_by'        => $faker->numberBetween(1, 9),
        'company_id'        => $faker->numberBetween(1, 12),
        'created_at'        => Carbon\Carbon::now(),
        'updated_at'        => Carbon\Carbon::now(),
    ];
});
