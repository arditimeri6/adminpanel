<?php

namespace App\Repositories\Backend\Projects;

use App\Exceptions\GeneralException;
use App\Models\Comment\Comment;
use App\Models\Project\Project;
use App\Repositories\BaseRepository;
use App\Events\Backend\Comments\CommentCreated;

/**
 * Class ProjectsCommentRepository.
 */
class ProjectsCommentRepository extends BaseRepository
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
    public function create(array $input, $project_id)
    {
        $input['created_by'] = auth()->id();
        $input['commentable_type'] = Project::class;
        $input['commentable_id'] = $project_id;

        if ($comment = Comment::create($input)) {
            event(new CommentCreated($comment));

            return $comment;
        }

        throw new GeneralException(trans('exceptions.backend.comments.create_error'));
    }

}
