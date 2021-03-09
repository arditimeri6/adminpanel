<?php

namespace App\Models\Comment;

use App\Models\BaseModel;
use App\Models\ModelTrait;
use App\Models\Comment\Traits\CommentRelationship;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends BaseModel
{
    use ModelTrait,
        SoftDeletes,
        CommentRelationship
        {
            // PageAttribute::getEditButtonAttribute insteadof ModelTrait;
        }

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table;

    /**
     * The guarded field which are not mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * The default values for attributes.
     *
     * @var array
     */
    protected $attributes = [
        'created_by' => 1,
    ];

    protected $with = ['owner'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        // $this->table = config('module.comment.table');
    }
}
