<?php

/*
 * CMS Tasks Management
 */
Route::group(['namespace' => 'tasks'], function () {
    Route::resource('tasks', 'TasksController', ['except' => ['show']]);

    //For DataTables
    Route::post('tasks/get', 'TasksTableController')->name('tasks.get');

    Route::post('tasks/comments/{task_id}', 'TasksCommentController@store')->name('comments.store');
});