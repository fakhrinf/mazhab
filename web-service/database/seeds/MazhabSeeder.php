<?php

use Illuminate\Database\Seeder;

class MazhabSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mazhabs')->insert([
            [
                'mazhab' => "M001",
                'kode_mazhab' => "Hanafi"
            ],
            [
                'mazhab' => "M002",
                'kode_mazhab' => "Hambali"
            ],
            [
                'mazhab' => "M003",
                'kode_mazhab' => "Maliki"
            ],
            [
                'mazhab' => "M004",
                'kode_mazhab' => "Syafi'i"
            ],
        ]);
    }
}
