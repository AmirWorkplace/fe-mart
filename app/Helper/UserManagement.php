<?php

namespace App\Helper;

use Illuminate\Support\Facades\Auth;

class UserManagement {

  /**
   * @uses role() this function return true/false depends on it's parameter.
   * @param array|string $role takes a string or array value to match with our existing user roles.
   */
  public static function role(array|string $role) {
    $match_role = ['admin', 'customer', 'user', 'reseller', 'System Admin', 'Reseller Admin'];

    if(is_string($role)){
      if(!in_array($role, $match_role)) return false;

      switch ($role) {
        case 'admin':
        case 'System Admin':
          return Auth::user()->hasRole('System Admin');

        case 'reseller':
        case 'Reseller Admin':
          return Auth::user()->hasRole('Reseller Admin');

        case 'user':
          return Auth::check();

        case 'customer':
          return Auth::user()->role == 0;

        default:
          return false;
      }
    }

    return false;
  }
}