<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class CursoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'nome' => 'max:150|required',
            'descricao' => 'max:200|required',
            'status' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'nome.required' => 'O campo nome é obrigatório.',
            'nome.max' => 'O campo nome não pode ter mais de :max caracteres.',
            'descricao.required' => 'O campo descrição é obrigatório.',
            'descricao.max' => 'O campo descrição não pode ter mais de :max caracteres.',
            'preco.min' => 'O campo preço deve ser um valor positivo.',
            'status.required' => 'O campo status é obrigatório.'
        ];
    }


}
