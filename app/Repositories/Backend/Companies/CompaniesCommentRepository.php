<?php

namespace App\Repositories\Backend\Companies;

use App\Exceptions\GeneralException;
use App\Models\Comment\Comment;
use App\Models\Company\Company;
use App\Repositories\BaseRepository;
use App\Events\Backend\Comments\CommentCreated;

/**
 * Class CompaniesCommentRepository.
 */
class CompaniesCommentRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = Comment::class;


    /**
     * @param array $input
     *
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function create(array $input, $company_id)
    {
        $input['created_by'] = auth()->id();
        $input['commentable_type'] = Company::class;
        $input['commentable_id'] = $company_id;

        if ($comment = Comment::create($input)) {
            event(new CommentCreated($comment));

            return $comment;
        }

        throw new GeneralException(trans('exceptions.backend.comments.create_error'));
    }

}
