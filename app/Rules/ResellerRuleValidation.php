<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Auth;

class ResellerRuleValidation implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        //
    }

    public function passes(string $attribute, mixed $value)
    {
        $id = Auth::id();
        return $value == $id;
    }

    public function message(): string {
        return "Your login credentials are didn't match your entry's data";
    }
}
