<?php

namespace App\Models\Project;

use App\Models\BaseModel;
use App\Models\ModelTrait;
use App\Models\Project\Traits\Attribute\ProjectAttribute;
use App\Models\Project\Traits\ProjectRelationship;
use Illuminate\Database\Eloquent\SoftDeletes;

class Project extends BaseModel
{
    use ModelTrait,
        SoftDeletes,
        ProjectRelationship,
        ProjectAttribute
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
        // $this->table = config('module.project.table');
    }
}
