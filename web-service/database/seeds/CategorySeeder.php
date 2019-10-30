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
                'category' => "Takbiratulihram"
            ],
            [
                'category' => "Berdiri"
            ],
            [
                'category' => "Membaca Al-fatihah"
            ],
            [
                'category' => "Sujud"
            ],
            [
                'category' => "Cara Mengangkat Tangan"
            ],
            [
                'category' => "Meletakan Tangan Kanan di Atas Tangan Kiri"
            ],
            [
                'category' => "Memberi Isyarat dengan Telunjuk saat Tasyahud"
            ],
        ]);
    }
}
