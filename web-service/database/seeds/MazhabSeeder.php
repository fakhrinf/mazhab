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
                'kode_mazhab' => "M001",
                'biografi' => "Imam Abu Hanifah. Mazhab ini dinisbahkan kepada Imam Abu Hanifah al-Nu’man bin Tsabit bin Zutha al-Tamimi. Lahir di Kuffah pada 80 H/700 M dan wafat di Baghdad tahun 150 H/767 M. Orangtua Abu Hanifah masih memiliki hubungan kerabat dengan Ali bin Abi Thalib. Ketika Abu Hanifah memperhatikan hal-hal yang terkait dengan ilmu, ia memfokuskan diri kepada fikih dan ilmu kalam yang merupakan tantangan dalam menjelaskan akidah. Kemudian meguatkan tauhid dengan dalil aqli, menghafal sejumlah hadis dan memahami ilmu nahwu dan sastra serta mengambil manfaat dari itu semua dengan peradaban yang meluas. Ia memfokuskan diri pada studi fikih serta mengistinbatkan hukum-hukum dari AlQur’an dan Sunnah dengan menelsuri jejak para salaf al-salih dan memahami dimana letak kesepakatan mereka. "
            ],
            [
                'mazhab' => "Hambali",
                'kode_mazhab' => "M002",
                'biografi' => "Imam Ahmad bin Hanbal. Ia adalah Abu Abdillah Ahmad bin Hanbal bin Hilal bin Asad alSyaibany al-Mawazin al-Baghdadi (781 M-855 M). Ia tekun mengumpulkan Sunnah dan menghafalnya, sehingga ia menjadi imam ahli Hadis pada masanya. Ia belajar hukum dari beberapa ahli, termasuk al-Syafi’i dan di beberapa tempat lain. Selain ahli hukum, ia ahli pula tentang Hadis Nabi SAW dan ia juga menyusun kitab Hadis terkenal bernama al-Musnad atau al-Masnad. Ahmad bin Hanbal memulai belajar menghafal Alquran, kemudian belajar bahasa Arab, Hadis, sejarah Nabi, dan sejarah sahabat serta para tabi’in. Untuk memperdalam ilmu, beliau pergi ke Basrah bertemu dengan Imam Syafi‟i. Beliau juga menuntut ilmu ke Yaman dan Mesir. Di antara gurunya beliau yaitu Yusus Al Hasan bin Ziad, Husyaim, Umair, Ibn Humam dan Ibn Abbas. Sepeninggal beliau, mazhab Hambali berkembang luas dan menjadi salah satu mazhab yang memiliki banyak penganut"
            ],
            [
                'mazhab' => "Maliki",
                'kode_mazhab' => "M003",
                'biografi' => "Imam Malik bin Anas. Namanya adalah Malik bin Anas bin Malik bin Abi Amir al-Asbahi (713 M-795 M). kakeknya yang tertinggi Abu Amir adalah seorang sahabat yang agung dan mengikuti semua peperangan Bersama Nabi SAW keuali Perang Badar. Imam Malik adalah seorang dari empat yang memanggul jenazah Utsman ke kuburannya. Kakeknya banyak meriwayatkan Hadis dari sahabat, seperti Umar bin Khattab, Utsman bin Affan, dll. Malik bin Anas banyak menggunakan Sunnah dalam memecahkan persoalan hukum ia sendiri menjadi pengumpul Sunnah Nabi dan menyusunna dalam kitab Hadis yang terkenal dengan nama alMutawaththa’. Sejak kecil beliau rajin menghadiri majlis-majlis ilmu pengetahuan, sehingga sejak kecil itu pula beliau telah hafal Al-Qur’an. Pada mulanya beliau belajar dari Rabi‟ah, selain itu beliau juga memperdalam hadis pada Ibn Syihab, di samping juga mempelajari ilmu fiqih dari para sahabat"
            ],
            [
                'mazhab' => "Syafi'i",
                'kode_mazhab' => "M004",
                'biografi' => "Imam Syafi’i. Ia adalah Abu Abdillah Muhammad bin Idris bin al-Abbas bin Utsman bin Syafi’I al-Hasyimi al-Muthalibi dari keturunan Bani Muthalib bin Abdi Manaf. Bertemu dengan Nabi SAW pada kakeknya Abdi Manaf. Ia dilahirkan di Kota Ghaza pada tahun 150 H/767 M dan wafat pada 820 M. Ia belajar hukum fikih Islam dari para mujtahid Mahab Hanafi dan Malik bin Anas. Karena itu pula, ia mengetahui kedua aliran hukum tersebut, baik tentang sumber hukum maupun mengenai metode yang digunakan. Lalu ia dapat menyatukan kedua aliran itu dan merumuskan sumber-sumber hukum (fikih) Islam (baru). Imam al-Syafi’i sering melakukan perjalanan dalam rangka mencari ilmu. Perjalanan ini, selain dilakukan untuk menambah ilmu, juga berdampak pada banyaknya murid, sesuai dengan negeri di mana ia pernah tinggal. Setelah wafat Imam Malik (179 H), beliau kemudian pergi Yaman, menetap dan mengajarkan ilmu di sana bersama Harun Al Rasyid. Beliau juga menulis kitab Al Um, Amali Kubra, kitab Risalah, Ushul Al Fiqh, dan memperkenalkan Waul Jadid, sebagai mazhab baru. Dalam penyusunan kitab Ushul Fiqh beliau dikenal sebagai pelopor orang pertama yang mempelopori dalam penulisan bidang tersebut"
            ],
        ]);
    }
}
