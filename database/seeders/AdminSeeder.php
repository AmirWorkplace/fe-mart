<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::create([
            'name' => "Admin",
            'user_name' => "admin",
            'email' => "admin@gmail.com",
            'role' => 1,
            'password' => Hash::make("12345678"),
        ]);
    }
}
