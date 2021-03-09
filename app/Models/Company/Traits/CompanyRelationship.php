<?php

namespace App\Models\Company\Traits;

use App\Models\Access\User\User;

trait CompanyRelationship
{
    public function owner()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function projects()
    {
        return $this->hasMany('App\Models\Project\Project');
    }

    public function comments()
    {
        return $this->morphMany('App\Models\Comment\Comment', 'commentable');
    }
}
