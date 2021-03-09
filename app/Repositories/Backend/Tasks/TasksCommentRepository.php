<?php

namespace App\Repositories\Backend\Tasks;

use App\Exceptions\GeneralException;
use App\Models\Comment\Comment;
use App\Models\Task\Task;
use App\Repositories\BaseRepository;
use App\Events\Backend\Comments\CommentCreated;

/**
 * Class TasksCommentRepository.
 */
class TasksCommentRepository extends BaseRepository
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
    public function create(array $input, $task_id)
    {
        $input['created_by'] = auth()->id();
        $input['commentable_type'] = Task::class;
        $input['commentable_id'] = $task_id;

        if ($comment = Comment::create($input)) {
            event(new CommentCreated($comment));

            return $comment;
        }

        throw new GeneralException(trans('exceptions.backend.comments.create_error'));
    }

}
