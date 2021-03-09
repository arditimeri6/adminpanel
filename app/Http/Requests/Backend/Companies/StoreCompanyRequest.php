<?php

namespace App\Http\Requests\Backend\Companies;

use App\Http\Requests\Request;

/**
 * Class StoreCompanyRequest.
 */
class StoreCompanyRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return access()->allow('create-company');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title'       => 'required|max:191',
            'description' => 'required',
        ];
    }
}
