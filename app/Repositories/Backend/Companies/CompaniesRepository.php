<?php

namespace App\Repositories\Backend\Companies;

use App\Events\Backend\Companies\CompanyCreated;
use App\Events\Backend\Companies\CompanyDeleted;
use App\Events\Backend\Companies\CompanyUpdated;
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

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->query()
            ->leftjoin(config('access.users_table'), config('access.users_table').'.id', '=', config('module.companies.table').'.created_by')
            ->select([
                config('module.companies.table').'.id',
                config('module.companies.table').'.title',
                config('module.companies.table').'.company_slug',
                config('module.companies.table').'.website',
                config('module.companies.table').'.address',
                config('module.companies.table').'.phone_number',
                config('module.companies.table').'.status',
                config('module.companies.table').'.created_at',
                config('module.companies.table').'.updated_at',
                config('access.users_table').'.first_name as created_by',
            ]);
    }

    /**
     * @param array $input
     *
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function create(array $input)
    {
        if ($this->query()->where('title', $input['title'])->first()) {
            throw new GeneralException(trans('exceptions.backend.companies.already_exists'));
        }

        // Making extra fields
        $input['company_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['created_by'] = auth()->id();

        if ($company = Company::create($input)) {
            event(new CompanyCreated($company));

            return $company;
        }

        throw new GeneralException(trans('exceptions.backend.companies.create_error'));
    }

    /**
     * @param \App\Models\Company\Company $company
     * @param array                 $input
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function update($company, array $input)
    {
        if ($this->query()->where('title', $input['title'])->where('id', '!=', $company->id)->first()) {
            throw new GeneralException(trans('exceptions.backend.companies.already_exists'));
        }

        // Making extra fields
        $input['company_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['updated_by'] = access()->user()->id;

        if ($company->update($input)) {
            event(new CompanyUpdated($company));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.companies.update_error'));
    }

    /**
     * @param \App\Models\Comany\Company $company
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function delete($company)
    {
        if ($company->delete()) {
            event(new CompanyDeleted($company));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.companies.delete_error'));
    }
}
