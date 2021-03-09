<?php

namespace App\Http\Controllers\Backend\Projects;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Events\Backend\Comments\CommentCreated;
use App\Http\Requests\Backend\Projects\StoreCommentRequest;
use App\Repositories\Backend\Projects\ProjectsCommentRepository;
use App\Http\Responses\RedirectResponse;

class ProjectsCommentController extends Controller
{
    protected $comments;

    /**
     * @param \App\Repositories\Backend\Projects\ProjectsCommentController $comments
     */
    public function __construct(ProjectsCommentRepository $comments)
    {
    	$this->comments = $comments;
    }

	/**
     * @param \App\Http\Requests\Backend\Projects\StoreProjectRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreCommentRequest $request, $project_id)
    {
        $this->comments->create($request->except(['_token']), $project_id);

        return new RedirectResponse(url()->previous(), ['flash_success' => trans('alerts.backend.comments.created')]);
    }
}
