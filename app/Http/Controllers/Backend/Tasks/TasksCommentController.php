<?php

namespace App\Http\Controllers\Backend\Tasks;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Events\Backend\Comments\CommentCreated;
use App\Http\Requests\Backend\Tasks\StoreCommentRequest;
use App\Repositories\Backend\Tasks\TasksCommentRepository;
use App\Http\Responses\RedirectResponse;

class TasksCommentController extends Controller
{
    protected $comments;

	/**
     * @param \App\Repositories\Backend\Tasks\TasksCommentController $comments
     */
    public function __construct(TasksCommentRepository $comments)
    {
    	$this->comments = $comments;
    }

    /**
     * @param \App\Http\Requests\Backend\Tasks\StoreProjectRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreCommentRequest $request, $task_id)
    {
    	$this->comments->create($request->except(['_token']), $task_id);

        return new RedirectResponse(url()->previous(), ['flash_success' => trans('alerts.backend.comments.created')]);
    }
}
