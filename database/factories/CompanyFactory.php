<?php

use App\Models\Access\User\User;
use App\Models\Company\Company;
use Faker\Generator as Faker;

$factory->define(Company::class, function (Faker $faker) {
    $title = $faker->company;

    $newestCompany = Company::orderBy('id', 'desc')->first();

    return [
        'title'             => $title,
        'company_slug'      => str_slug($title),
        'website'           => $faker->domainName,
        'address'           => $faker->address,
        'phone_number'      => $faker->tollFreePhoneNumber,
        'description'       => $faker->paragraph,
        'created_by'        => $faker->numberBetween(1, 9),
        'status'            => 1,
        'created_at'        => Carbon\Carbon::now(),
        'updated_at'        => Carbon\Carbon::now(),
    ];
});
