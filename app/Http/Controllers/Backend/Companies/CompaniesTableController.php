<?php

namespace App\Http\Controllers\Backend\Companies;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Companies\ManageCompanyRequest;
use App\Repositories\Backend\Companies\CompaniesRepository;
use Yajra\DataTables\Facades\DataTables;

/**
 * Class CompaniesTableController.
 */
class CompaniesTableController extends Controller
{
    protected $companies;

    /**
     * @param CompaniesRepository $companies
     */
    public function __construct(CompaniesRepository $companies)
    {
        $this->companies = $companies;
    }

    /**
     * @param ManageCompanyRequest $request
     *
     * @return mixed
     */
    public function __invoke(ManageCompanyRequest $request)
    {
        return Datatables::of($this->companies->getForDataTable())
            ->escapeColumns(['title'])
            ->addColumn('status', function ($company) {
                return $company->status_label;
            })
            ->addColumn('created_at', function ($company) {
                return $company->created_at->toDateString();
            })
            ->addColumn('created_by', function ($company) {
                return $company->created_by;
            })
            ->addColumn('actions', function ($company) {
                return $company->action_buttons;
            })
            ->make(true);
    }
}
