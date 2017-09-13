<?php

use App\Administrador;
use App\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $user = User::create([
            'cuenta'=>'franco.mamani',
            'password'=> bcrypt('7275047'),
            'nombres'=> 'Franco Jesus',
            'apellidos'=> 'Mamani Pozo',
            'carnet'=> '7275047',
            'celular'=> '76137653',
            'tipo'=> 'administrador',
            'activo'=> true,
        ]);
        Administrador::create(['user_id'=>$user->id]);
    }
}
