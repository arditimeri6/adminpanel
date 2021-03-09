<?php

namespace App\Repositories\Frontend\Companies;

use App\Exceptions\GeneralException;
use App\Models\Company\Company;
use App\Repositories\BaseRepository;

/**
 * Class CompaniesRepository.
 */
class CompaniesRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = Company::class;

    /*
    * Find page by company_slug
    */
    public function findCompanyBySlug($company_slug)
    {
        if (!is_null($this->query()->whereCompany_slug($company_slug)->firstOrFail())) {
            return $this->query()->whereCompany_slug($company_slug)->firstOrFail();
        }

        throw new GeneralException(trans('exceptions.backend.access.companies.not_found'));
    }
}
