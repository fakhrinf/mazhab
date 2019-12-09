<?php

use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table("categories")->insert([
            [
                'category' => "Niat"
            ],
            [
                'category' => "Takkbiratulihram"
            ],
            [
                'category' => "Berdiri"
            ],
            [
                'category' => "Membaca Al-Fatihah"
            ],
            [
                'category' => "Sujud"
            ],
            [
                'category' => "Tasyahud Akhir"
            ],
            [
                'category' => "Salam"
            ],
            [
                'category' => "Cara Mengangkat Tangan"
            ],
            [
                'category' => "Meletakkan Tangan Kanan di Atas Tangan Kiri"
            ],
            [
                'category' => "Memberi Isyarat dengan Telunjuk saat Tasyahud"
            ],
        ]);
    }
}
