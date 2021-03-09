<?php

namespace App\Events\Backend\Companies;

use Illuminate\Queue\SerializesModels;

/**
 * Class CompanyUpdated.
 */
class CompanyUpdated
{
    use SerializesModels;

    /**
     * @var
     */
    public $company;

    /**
     * @param $company
     */
    public function __construct($company)
    {
        $this->company = $company;
    }
}
