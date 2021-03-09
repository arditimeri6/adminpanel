<?php

/*
 * CMS Projects Management
 */
Route::group(['namespace' => 'Projects'], function () {
    Route::resource('projects', 'ProjectsController', ['except' => ['show']]);

    //For DataTables
    Route::post('projects/get', 'ProjectsTableController')->name('projects.get');

    Route::post('projects/comments/{project_id}', 'ProjectsCommentController@store')->name('comments.store');

});