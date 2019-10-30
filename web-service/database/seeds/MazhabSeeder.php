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
                'mazhab' => "Hanafi",
                'kode_mazhab' => "M001"
            ],
            [
                'mazhab' => "Hambali",
                'kode_mazhab' => "M002"
            ],
            [
                'mazhab' => "Maliki",
                'kode_mazhab' => "M003"
            ],
            [
                'mazhab' => "Syafi'i",
                'kode_mazhab' => "M004"
            ],
        ]);
    }
}
