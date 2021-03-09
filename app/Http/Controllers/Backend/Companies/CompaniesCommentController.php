<?php

namespace App\Http\Controllers\Backend\Companies;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Events\Backend\Comments\CommentCreated;
use App\Http\Requests\Backend\Companies\StoreCommentRequest;
use App\Repositories\Backend\Companies\CompaniesCommentRepository;
use App\Http\Responses\RedirectResponse;

class CompaniesCommentController extends Controller
{
	protected $comments;

    /**
     * @param \App\Repositories\Backend\Companies\CompaniesCommentRepository $comments
     */
    public function __construct(CompaniesCommentRepository $comments)
    {
        $this->comments = $comments;
    }

    /**
     * @param \App\Http\Requests\Backend\Companies\StoreCommentRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreCommentRequest $request, $company_id)
    {

        $this->comments->create($request->except(['_token']), $company_id);

        return new RedirectResponse(url()->previous(), ['flash_success' => trans('alerts.backend.comments.created')]);
    }
}
