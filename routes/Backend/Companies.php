<?php

/*
 * CMS Companies Management
 */
Route::group(['namespace' => 'Companies'], function () {
    Route::resource('companies', 'CompaniesController', ['except' => ['show']]);

    //For DataTables
    Route::post('companies/get', 'CompaniesTableController')->name('companies.get');

	Route::post('companies/comments/{company_id}', 'CompaniesCommentController@store')->name('comments.store');

});