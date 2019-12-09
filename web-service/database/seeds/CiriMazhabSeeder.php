<?php

use Illuminate\Database\Seeder;

class CiriMazhabSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table("cirimazhabs")->insert([
            [
                'ciri_id' => 2,
                'mazhab_id' => 1,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 6,
                'mazhab_id' => 1,
                'penjelasan' => "Takbiratulihram wajib, tp meninggalkannya tidak membatalkan shalat, karena “kewajiban (jika tdk, dosa)” lebih rendah dr “fardhu (jika tdk, terhalang dpt syafaat Rasulullah SAW. Di hari kiamat)”"
            ],
            [
                'ciri_id' => 8,
                'mazhab_id' => 1,
                'penjelasan' => "Boleh diganti dgn takbir yg menunjukan pengagungan kpd Allah SWT tanpa mencakup doa dan semisalnya"
            ],
            [
                'ciri_id' => 9,
                'mazhab_id' => 1,
                'penjelasan' => "Wajib, baik fardu lima waktu, maupun witir, nazar dan dua rakaat fajar"
            ],
            [
                'ciri_id' => 12,
                'mazhab_id' => 1,
                'penjelasan' => "<ol><li>Bukan fardu (rukun), tp wajib(lbh rendah dr rukun)</li><li>Bacaan yg fardu, membaca Al-Qur’an scr umum.</li><li>Bacaan dilakukan pd 2 rakaat pertama salat fardu, sdgkan Al-Fatihah pd rakaat tsb merupakan wajib.</li><li>Jika tdk membaca pd dua rakaat pertama, maka membacanya pd dua rakaat setelahnya.</li><li>Jika membaca karena lupa, maka wajib bersujud sahwi. Baik shalat fardu maupun bukan.</li></ol>"
            ],
            [
                'ciri_id' => 14,
                'mazhab_id' => 1,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 16,
                'mazhab_id' => 1,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 18,
                'mazhab_id' => 1,
                'penjelasan' => "Boleh bersujud di atas serban yg dililitkan pd kepala dan menutupi sebagian kening"
            ],
            [
                'ciri_id' => 21,
                'mazhab_id' => 1,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 24,
                'mazhab_id' => 1,
                'penjelasan' => "Lafal salam itu wajib, bukan fardu (rukun)."
            ],
            [
                'ciri_id' => 28,
                'mazhab_id' => 1,
                'penjelasan' => "<ol><li>Mengakhiri shalat bisa dilakukan dengan berbagai cara, bahkan dengan membatalkan wudhu sekalipun.</li><li>Biasa juga dengan mengucapkan “salam” saja tanpa “alaikum”</li></ol>"
            ],
            [
                'ciri_id' => 29,
                'mazhab_id' => 1,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 35,
                'mazhab_id' => 1,
                'penjelasan' => "<ol><li>Pria: Meletakan bagian dalam tangan kanannya di atas punggung tangan kirinya dengan menggenggamkan kelingking dan jempolnya pada pergelangan tangan pada posisi bawah pusar</li><li>Wanita: Meletakan kedua tangannya di atas dada tanpa menggenggam</li></ol>"
            ],
            [
                'ciri_id' => 36,
                'mazhab_id' => 1,
                'penjelasan' => "<ol><li>Memberi Isyarat adalah dengan jari telunjuk kanan.</li><li>Jika jari terpotong atau sakit, maka tidak boleh diganti jari lain dari tangan kanan dan tidak boleh diganti dengan jari pada tangan kiri pada saat selesai membaca syahadat</li></ol>"
            ],
            [
                'ciri_id' => 3,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 5,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 7,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 10,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 13,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 14,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 17,
                'mazhab_id' => 2,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 18,
                'mazhab_id' => 2,
                'penjelasan' => "Boleh bersujud di atas serban yg dililitkan pd kepala dan menutupi sebagian kening"
            ],
            [
                'ciri_id' => 23,
                'mazhab_id' => 2,
                'penjelasan' => "Wajib. Jika tidak dikerjakan, shalat batal."
            ],
            [
                'ciri_id' => 26,
                'mazhab_id' => 2,
                'penjelasan' => "Mengucapkan salam dua kali dengan membaca “assalamu ‘alaikum wa rahmatullah” secara berurutan."
            ],
            [
                'ciri_id' => 30,
                'mazhab_id' => 2,
                'penjelasan' => "Mengangkat kedua tangannya lurus dengan bahu ketika takbiratulihram, ruku’, bangkit dari ruku’"
            ],
            [
                'ciri_id' => 34,
                'mazhab_id' => 2,
                'penjelasan' => "Meletakan bagian dalam telapak tangan di atas punggung tangan kiri di atas pusar"
            ],
            [
                'ciri_id' => 37,
                'mazhab_id' => 2,
                'penjelasan' => "<ol><li>Mengangkat jari telunjuk tangan kanan pada saat membaca syahadat dan doa setelahnya</li><li>Diikuti dengan menggenggam jari kelingking dan jari manis tangan kanan, lalu melingkarkan jari jempol dan jari tengah</li><li>Saat menyebut lafal Allah, jari telunjuk kanan tidak boleh digerak-gerakkan</li></ol>"
            ],
            [
                'ciri_id' => 4,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 5,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 7,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 11,
                'mazhab_id' => 3,
                'penjelasan' => "Ketika membaca Al-Qur’an(boleh bersandar pd sesuatu yg menyebabkan jatuh ketika dia dibuang), tp tidak boleh duduk, meskipun tidak diwajibkan."
            ],
            [
                'ciri_id' => 13,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 15,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 17,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 18,
                'mazhab_id' => 3,
                'penjelasan' => "Boleh bersujud di atas serban yg dililitkan pd kepala dan menutupi sebagian kening"
            ],
            [
                'ciri_id' => 22,
                'mazhab_id' => 3,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 23,
                'mazhab_id' => 3,
                'penjelasan' => "Wajib. Jika tidak dikerjakan, shalat batal."
            ],
            [
                'ciri_id' => 25,
                'mazhab_id' => 3,
                'penjelasan' => "<ol><li>Mengucapkan salam satu kali saja dengan membaca “assalamu ‘alaikum wa rahmatullah” secara berurutan.</li><li>Bagi yang tidak mampu mengucapkannya. Dia tidak wajib mengerjakannya.</li></ol>"
            ],
            [
                'ciri_id' => 30,
                'mazhab_id' => 3,
                'penjelasan' => "Mengangkat kedua tangan lurus dengan kedua bahu saat tabiratulihram.Cara menangkatnya menurut pendapat yg masyhur adalah kedua tangan terbuka, punggung tangan menghadap langit dan bagian dalamnya menghadap bumi"
            ],
            [
                'ciri_id' => 32,
                'mazhab_id' => 3,
                'penjelasan' => "Meletakan tangan kanan di atas tangan kiri (di atas pusar, di bawah dada). Hukumnya mandub(disenangi Allah)."
            ],
            [
                'ciri_id' => 38,
                'mazhab_id' => 3,
                'penjelasan' => "<ol><li>Menggenggam semua jemari kanan, kecuali jempol dan telunjuk lalu, mengulurkan jari telunjuk dan jempol</li><li>Menggerak-gerakkan telunjuk ke kiri dan kanan dengan gerakan sederhana</li></ol>"
            ],
            [
                'ciri_id' => 1,
                'mazhab_id' => 4,
                'penjelasan' => "<ol><li>Berniat melaksanakan kewajiban (shalat fardu)</li><li>Menyengaja pelaksanaan shalat konsentrasi (menghadirkan hati saat niat)</li><li>Menentukan macam shalat pada takbiratul ihram</li><li>Ketiga syarat diatas dilakukan pada saat takbiratul ihram</li></ol>"
            ],
            [
                'ciri_id' => 5,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 7,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 10,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 13,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 14,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 17,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 19,
                'mazhab_id' => 4,
                'penjelasan' => "<ol><li>Bersujud boleh dilakkukan di atas sapu tangan, karena terpisah dr org yg sujud</li><li>Jika sujud dengan serban di kepala yg menutupi semua kening, tidak sah dan membatalkan shalat, kecuali karena sakit seperti luka dan harus ditutupi, supaya tidak tersentuh</li></ol>"
            ],
            [
                'ciri_id' => 20,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 23,
                'mazhab_id' => 4,
                'penjelasan' => "Wajib. Jika tidak dikerjakan, shalat batal."
            ],
            [
                'ciri_id' => 27,
                'mazhab_id' => 4,
                'penjelasan' => "<ol><li>Mengucapkan salam tidak disyaratkan tertib atau sesuai urutan salam.</li><li>Orang yang membaca “alaikumsalam”, shalat tetap sah walaupun makruh</li></ol>"
            ],
            [
                'ciri_id' => 31,
                'mazhab_id' => 4,
                'penjelasan' => null
            ],
            [
                'ciri_id' => 33,
                'mazhab_id' => 4,
                'penjelasan' => "Meletakkan bagian dalam telapak tangan kanan di atas punggung tangan kiri di bawah dada dan di atas pusar, dengan posisi sebelah kiri (perut)"
            ],
            [
                'ciri_id' => 39,
                'mazhab_id' => 4,
                'penjelasan' => "<ol><li>Menggenggam semua jemari tangan kanan, kecuali telunjuk.</li><li>Yg utama: Melipat jempol ke bawah pangkal telunjuk dan meletakkan telunjuk di atas ujung jempol</li><li>Cara memberi isyarat: Ketika mengucapkan ucapan “ilallah” mengangkat dan menggerak-gerakkan tulunjuk. Pada tasyahud awal, telunjuk kanan dibiarkan terangkat sampai bangkit dari tasyahud. Sedangkan pada tasyahud akhir, telunjuk kanan dibiarkan terangkat sampai mengucapkan salam dan sebaiknya mata memandangi telunjuk. </li></ol>"
            ],
        ]);
    }
}
