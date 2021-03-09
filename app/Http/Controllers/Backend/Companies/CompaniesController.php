<?php

namespace App\Http\Controllers\Backend\Companies;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Companies\CreateCompanyRequest;
use App\Http\Requests\Backend\Companies\DeleteCompanyRequest;
use App\Http\Requests\Backend\Companies\EditCompanyRequest;
use App\Http\Requests\Backend\Companies\ManageCompanyRequest;
use App\Http\Requests\Backend\Companies\StoreCompanyRequest;
use App\Http\Requests\Backend\Companies\UpdateCompanyRequest;
use App\Repositories\Backend\Companies\CompaniesRepository;
use App\Http\Responses\Backend\Company\EditResponse;
use App\Http\Responses\RedirectResponse;
use App\Http\Responses\ViewResponse;
use App\Models\Company\Company;

/**
 * Class CompaniesController.
 */
class CompaniesController extends Controller
{
    protected $companies;

    /**
     * @param \App\Repositories\Backend\Companies\CompaniesRepository $companies
     */
    public function __construct(CompaniesRepository $companies)
    {
        $this->companies = $companies;
    }

    /**
     * @param \App\Http\Requests\Backend\Companies\ManageCompanyRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function index(ManageCompanyRequest $request)
    {
        return new ViewResponse('backend.companies.index');
    }

    /**
     * @param \App\Http\Requests\Backend\Companies\CreateCompanyRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function create(CreateCompanyRequest $request)
    {
        return new ViewResponse('backend.companies.create');
    }

    /**
     * @param \App\Http\Requests\Backend\Companies\StoreCompanyRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreCompanyRequest $request)
    {
        $this->companies->create($request->except(['_token']));

        return new RedirectResponse(route('admin.companies.index'), ['flash_success' => trans('alerts.backend.companies.created')]);
    }

    /**
     * @param \App\Models\Company\Company                            $company
     * @param \App\Http\Requests\Backend\Companies\EditCompanyRequest $request
     *
     * @return \App\Http\Responses\Backend\Company\EditResponse
     */
    public function edit(Company $company, EditCompanyRequest $request)
    {
        return new EditResponse($company);
    }

    /**
     * @param \App\Models\Company\Company                              $company
     * @param \App\Http\Requests\Backend\Companies\UpdateCompanyRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function update(Company $company, UpdateCompanyRequest $request)
    {
        $this->companies->update($company, $request->except(['_method', '_token']));

        return new RedirectResponse(route('admin.companies.index'), ['flash_success' => trans('alerts.backend.companies.updated')]);
    }

    /**
     * @param \App\Models\Company\Company                              $company
     * @param \App\Http\Requests\Backend\Companies\DeleteCompanyRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function destroy(Company $company, DeleteCompanyRequest $request)
    {
        $this->companies->delete($company);

        return new RedirectResponse(route('admin.companies.index'), ['flash_success' => trans('alerts.backend.companies.deleted')]);
    }
}
