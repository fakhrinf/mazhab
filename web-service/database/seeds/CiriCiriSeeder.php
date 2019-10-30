<?php

use Illuminate\Database\Seeder;

class CiriCiriSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table("ciriciris")->insert([
            [
                'kode_ciriciri' => 'C001', 
                'ciriciri' => 'Berniat harus dilakukan saat takbiratul ihram',
                'category_id' => 1,
            ],
            [
                'kode_ciriciri' => 'C002', 
                'ciriciri' => 'Cara berniat cukup dengan mengetahui shalat yang dikerjakan. Contoh: mengetahui akan melaksanakan shalat dzuhur',
                'category_id' => 1,
            ],
            [
                'kode_ciriciri' => 'C003', 
                'ciriciri' => 'Harus menyebutkan shalat yg dikerjakan',
                'category_id' => 1,
            ],
            [
                'kode_ciriciri' => 'C004', 
                'ciriciri' => 'Menyebutkan ketentuan waktu dari shalat fardu yg dikerjakan. Contoh: mengerjakan shalat fardu dzuhur',
                'category_id' => 1,
            ],
            [
                'kode_ciriciri' => 'C005', 
                'ciriciri' => 'Meninggalkan takbiratulihram, shalat tidak sah.',
                'category_id' => 2,
            ],
            [
                'kode_ciriciri' => 'C006', 
                'ciriciri' => 'Meninggalkan takbiratulihram shalat sah.',
                'category_id' => 2,
            ],
            [
                'kode_ciriciri' => 'C007', 
                'ciriciri' => 'Lafaz harus dengan “allāhu ʾakbar”',
                'category_id' => 2,
            ],
            [
                'kode_ciriciri' => 'C008', 
                'ciriciri' => '“allāhu ʾakbar” boleh diganti dengan subhanallah, la ilaha ilallah, Allahu Rahim, Allahu karim',
                'category_id' => 2,
            ],
            [
                'kode_ciriciri' => 'C009', 
                'ciriciri' => 'Harus berdiri secukup waktu untuk membaca 1 ayat Panjang, 3 ayat pendek, Al-Fatihah dan selama bacaan Al- Qur’an yang dibaca (meskipun seisi Al-Qur’an)',
                'category_id' => 3,
            ],
            [
                'kode_ciriciri' => 'C010', 
                'ciriciri' => 'Wajib berdiri pada saat membaca bacaan yang wajib, jika membaca yang sunnah maka berdiri juga akan menjadi sunnah',
                'category_id' => 3,
            ],
            [
                'kode_ciriciri' => 'C011', 
                'ciriciri' => 'Wajib berdiri saat takbiratulihram, membaca Al-Fatihah, dan hendak ruku’. Namun ketika membaca Al-Qur’an sunnah dan boleh bersandar.',
                'category_id' => 3,
            ],
            [
                'kode_ciriciri' => 'C012', 
                'ciriciri' => 'Al-Fatihah dibaca pada 2 rakaat pertama',
                'category_id' => 4,
            ],
            [
                'kode_ciriciri' => 'C013', 
                'ciriciri' => 'Membaca Al-Fatihah dlm semua rakaat',
                'category_id' => 4,
            ],
            [
                'kode_ciriciri' => 'C014', 
                'ciriciri' => 'Harus mendengar bacaannya sendiri, jika tidak mendengar, maka dianggap tidak membaca',
                'category_id' => 4,
            ],
            [
                'kode_ciriciri' => 'C015', 
                'ciriciri' => 'Cukup menggerakan lidahnya, tidak harus mendengar bacannya',
                'category_id' => 4,
            ],
            [
                'kode_ciriciri' => 'C016', 
                'ciriciri' => 'Makruh jika meletakan kening di atas tangan',
                'category_id' => 5,
            ],
            [
                'kode_ciriciri' => 'C017', 
                'ciriciri' => 'Batal jika meletakan kening di atas tangan',
                'category_id' => 5,
            ],
            [
                'kode_ciriciri' => 'C018', 
                'ciriciri' => 'Meletakan kening di atas benda yg dipakai(dibawa) dlm shalat hukumnya makruh. Contoh: serban yang dililitkan dikepala',
                'category_id' => 5,
            ],
            [
                'kode_ciriciri' => 'C019', 
                'ciriciri' => 'Meletakan kening di atas benda yg dipakai(dibawa) dlm shalat hukumnya bisa membatalkan shalat',
                'category_id' => 5,
            ],
            [
                'kode_ciriciri' => 'C020', 
                'ciriciri' => 'Fardu (rukun), ditinggalkan shalat tidak sah',
                'category_id' => 6,
            ],
            [
                'kode_ciriciri' => 'C021', 
                'ciriciri' => 'Wajib shalat, ditinggalkan shalat tetap sah',
                'category_id' => 6,
            ],
            [
                'kode_ciriciri' => 'C022', 
                'ciriciri' => 'Sunnah',
                'category_id' => 6,
            ],
            [
                'kode_ciriciri' => 'C023', 
                'ciriciri' => 'Harus dikerjakan, jika tidak shalat batal',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C024', 
                'ciriciri' => 'Tidak harus dikerjakan',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C025', 
                'ciriciri' => 'Mengucapkan salam minimal 1 kali dengan “assalamu ‘alaikum wa rahmatullah”',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C026', 
                'ciriciri' => 'Mengucapan salam 2 kali dengan “assalamu ‘alaikum wa rahmatullah”',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C027', 
                'ciriciri' => 'Boleh membaca “alaikumsalam”',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C028', 
                'ciriciri' => 'Boleh mengakhiri shalat dengan membatalkan wudhu',
                'category_id' => 7,
            ],
            [
                'kode_ciriciri' => 'C029', 
                'ciriciri' => 'Laki-laki dan budak wanita: Mengangkat tangan di samping telinga sambil mergangkannya. Wanita: Mengangkat tangan sebatas bahu',
                'category_id' => 8,
            ],
            [
                'kode_ciriciri' => 'C030', 
                'ciriciri' => 'Mengangkat tangan lurus dengan bahu',
                'category_id' => 8,
            ],
            [
                'kode_ciriciri' => 'C031', 
                'ciriciri' => 'Ujung jemari lurus dengan atas telinga, kedua jempol lurus dengan bawah daun telinga, kedua telapak tangan lurus dengan bahu',
                'category_id' => 8,
            ],
            [
                'kode_ciriciri' => 'C032', 
                'ciriciri' => 'Meletakan tangan dengan posisi di atas pusar dan di bawah dada',
                'category_id' => 9,
            ],
            [
                'kode_ciriciri' => 'C033', 
                'ciriciri' => 'Meletakan tangan dengan posisi di atas pusar, di bawah dada dan dengan posisi sebelah kiri (perut)',
                'category_id' => 9,
            ],
            [
                'kode_ciriciri' => 'C034', 
                'ciriciri' => 'Meletakan tangan dengan posisi di atas pusar',
                'category_id' => 9,
            ],
            [
                'kode_ciriciri' => 'C035', 
                'ciriciri' => 'Meletakan tangan dengan posisi di bawah pusar',
                'category_id' => 9,
            ],
            [
                'kode_ciriciri' => 'C036', 
                'ciriciri' => '− Mengangkat telunjuk kanan ketika menyatakan peniadaan Tuhan dengan ucapan “la ilaha” − Merapatkan kembali ketika menetapkan adanya Allah “illallah”',
                'category_id' => 10,
            ],
            [
                'kode_ciriciri' => 'C037', 
                'ciriciri' => 'Mengangkat jari telunjuk tangan kanan pada saat membaca syahadat dan doa setelahnya',
                'category_id' => 10,
            ],
            [
                'kode_ciriciri' => 'C038', 
                'ciriciri' => 'Menggerak-gerakkan telunjuk ke kiri dan kanan dengan gerakan sederhana',
                'category_id' => 10,
            ],
            [
                'kode_ciriciri' => 'C039', 
                'ciriciri' => 'Mengangkat dan menggerak-gerakkan tulunjuk ketika mengucapkan “illallah”',
                'category_id' => 10,
            ],
        ]);
    }
}
