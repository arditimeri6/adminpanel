<?php

namespace App\Models\Task\Traits;

use App\Models\Access\User\User;
use App\Models\Project\Project;

trait TaskRelationship
{
    public function owner()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function projectOwner()
    {
    	return $this->belongsTo(Project::class, 'project_id');
    }

	public function comments()
    {
        return $this->morphMany('App\Models\Comment\Comment', 'commentable');
    }
}
