<?php

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
        $this->call('UserSeed');
        $this->call('CategorySeeder');
        $this->call('CiriCiriSeeder');
        $this->call('MazhabSeeder');
        $this->call('CiriMazhabSeeder');
    }
}
