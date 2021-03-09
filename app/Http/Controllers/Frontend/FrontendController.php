<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Settings\Setting;
use App\Repositories\Frontend\Pages\PagesRepository;
use App\Repositories\Frontend\Companies\CompaniesRepository;
use App\Repositories\Frontend\Projects\ProjectsRepository;
use App\Repositories\Frontend\Tasks\TasksRepository;

/**
 * Class FrontendController.
 */
class FrontendController extends Controller
{
    /**
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $settingData = Setting::first();
        $google_analytics = $settingData->google_analytics;

        return view('frontend.index', compact('google_analytics', $google_analytics));
    }

    /**
     * show page by $page_slug.
     */
    public function showPage($slug, PagesRepository $pages)
    {
        $result = $pages->findBySlug($slug);

        return view('frontend.pages.index')
            ->withpage($result);
    }

    /**
     * show company by $company_slug.
     */
    public function showCompany($slug, CompaniesRepository $companies)
    {
        $result = $companies->findCompanyBySlug($slug);

        return view('frontend.companies.index')
            ->withCompany($result);
    }

    /**
     * show project by $project_slug.
     */
    public function showProject($slug, ProjectsRepository $projects)
    {
        $result = $projects->findProjectBySlug($slug);

        return view('frontend.projects.index')
            ->withProject($result);
    }

    /**
     * show project by $task_slug.
     */
    public function showTask($slug, TasksRepository $tasks)
    {
        $result = $tasks->findTaskBySlug($slug);

        return view('frontend.tasks.index')
            ->withTask($result);
    }
}
