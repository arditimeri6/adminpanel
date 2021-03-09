<?php

namespace App\Models\Company\Traits\Attribute;

/**
 * Class CompanyAttribute.
 */
trait CompanyAttribute
{
    /**
     * @return string
     */
    public function getActionButtonsAttribute()
    {
        return '<div class="btn-group action-btn">
                    '.$this->getEditButtonAttribute('edit-company', 'admin.companies.edit').'
                    '.$this->getViewButtonAttribute().'
                    '.$this->getDeleteButtonAttribute('delete-company', 'admin.companies.destroy').'
                </div>';
    }

    /**
     * @return string
     */
    public function getViewButtonAttribute()
    {
        return '<a target="_blank" href="'.route('frontend.companies.show', $this->company_slug).'" class="btn btn-flat btn-default">
                    <i data-toggle="tooltip" data-placement="top" title="View Company" class="fa fa-eye"></i>
                </a>';
    }

    /**
     * @return string
     */
    public function getStatusLabelAttribute()
    {
        if ($this->isActive()) {
            return "<label class='label label-success'>".trans('labels.general.active').'</label>';
        }

        return "<label class='label label-danger'>".trans('labels.general.inactive').'</label>';
    }

    /**
     * @return bool
     */
    public function isActive()
    {
        return $this->status == 1;
    }
}
