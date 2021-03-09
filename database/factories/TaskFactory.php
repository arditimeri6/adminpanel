<?php

use App\Models\Task\Task;
use App\Models\Access\User\User;
use Faker\Generator as Faker;

$factory->define(Task::class, function (Faker $faker) {
    $title = $faker->sentence(3);

    $newestTask = Task::orderBy('id', 'desc')->first();

    return [
        'title'             => $title,
        'task_slug'      => str_slug($title),
        'timeframe'         => $faker->numberBetween(1, 50),
        'description'       => $faker->paragraph,
        'status'            => 1,
        'created_by'        => $faker->numberBetween(1, 9),
        'project_id'        => $faker->numberBetween(1, 15),
        'created_at'        => Carbon\Carbon::now(),
        'updated_at'        => Carbon\Carbon::now(),
    ];
});
