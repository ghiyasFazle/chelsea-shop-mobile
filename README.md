# TUGAS 7 #

1. apa itu widget tree dan hubungan parent child

widget tree itu semacam struktur pohon dari semua widget yang ada di aplikasi flutter. setiap tampilan di flutter dibangun dari banyak widget yang saling bersarang. ada widget induk (parent) yang membungkus widget lain di dalamnya (child). misalnya Scaffold itu parent dari body, lalu di dalam body ada Column, di dalam Column ada ElevatedButton dan seterusnya. jadi semuanya saling terhubung membentuk satu pohon tampilan.



2. widget yang aku pakai dan fungsinya

* MaterialApp → untuk nyalain fitur material design dan jadi root app nya
* Scaffold → nyediain struktur dasar layar kayak appbar, body, snackbar
* AppBar → bagian atas yang ada judulnya “Chelsea Shop”
* Center → buat ngeposisikan widget di tengah
* Column → buat nyusun tombol-tombol secara vertikal
* ElevatedButton.icon → tombol yang ada ikon dan teks
* Icon → nampilin ikon di tombol
* Text → nampilin tulisan di tombol dan snackbar
* SnackBar → munculin pesan singkat di bawah pas tombol ditekan
* ScaffoldMessenger → buat munculin snackbar dari context tertentu
* SizedBox → kasih jarak antar tombol



3. fungsi dari widget MaterialApp

MaterialApp itu kayak pembungkus utama dari aplikasi flutter berbasis material design. di dalamnya bisa ngatur tema, title, route, dan halaman awal (home). widget ini sering banget dipake jadi root karena hampir semua fitur UI flutter material butuh konteks dari MaterialApp biar bisa jalan normal, misalnya snackbar, theme, navigator, dll.



4. perbedaan StatelessWidget dan StatefulWidget

StatelessWidget itu widget yang tampilannya ga berubah-ubah, datanya statis aja. kayak tampilan tombol biasa, teks, ikon, dsb.
StatefulWidget itu widget yang bisa berubah pas dijalankan, biasanya karena ada interaksi user atau perubahan data, misal counter, form input, atau animasi.
aku pilih stateless kalo cuma mau nampilin hal sederhana yang ga berubah, dan pilih stateful kalo butuh update tampilan saat ada perubahan state.


5. apa itu BuildContext dan kenapa penting

BuildContext itu semacam “identitas” atau info posisi widget di dalam tree. penting karena dipake buat nyari parent widget, akses tema, navigator, atau munculin snackbar. di metode build, biasanya context dipakai buat manggil fungsi-fungsi kayak `ScaffoldMessenger.of(context)` atau `Theme.of(context)` biar tahu harus ngambil data dari mana.



6. konsep hot reload dan bedanya sama hot restart

hot reload itu fitur buat langsung liat perubahan kode tanpa restart penuh aplikasi. dia cuma reload bagian yang berubah dan nyimpen state yang udah ada. jadi cepet banget buat ngetes tampilan.
sedangkan hot restart itu nge-restart semua aplikasi dari awal, semua state ilang. jadi kayak ngerun ulang aplikasi dari awal banget.

## Tugas 8 ##

1. navigator push digunakan untuk menambahkan halaman baru di atas halaman sebelumnya navigator pushreplacement menggantikan halaman yang sedang dibuka dengan halaman baru di aplikasi ini navigator push digunakan saat pindah dari halaman utama ke halaman tambah produk supaya bisa kembali lagi sementara navigator pushreplacement digunakan di drawer supaya halaman lama tidak menumpuk

2. scaffold appbar dan drawer digunakan untuk membuat struktur halaman yang konsisten scaffold jadi dasar halaman yang punya area appbar body dan drawer appbar untuk menampilkan judul halaman biar konsisten drawer digunakan sebagai navigasi utama antara halaman utama dan halaman tambah produk

3. padding singlechildscrollview dan listview dipakai supaya tampilan form lebih rapi padding ngasih jarak biar elemen tidak menempel di tepi singlechildscrollview dan listview supaya form bisa discroll kalau isinya banyak di aplikasiku listview membungkus semua input form dan padding dipakai biar jarak antar elemen enak dilihat

4. Untuk saat ini halaman utama masih polos namun saya berencana untuk menggunakan tema warna yang sesuai dengan tugas django saya sebelumnya yang berdominan berwarna biru tua, sesuai dengan klub sepakbola Chelsea FC. 

### Tugas 9 ###


1. Kenapa harus membuat model Dart untuk JSON?

    Model Dart itu basically “tempat nyimpen bentuk data” yang kita ambil dari Django. Kalau kita cuma pakai `Map<String, dynamic>` tanpa model, bakal banyak masalah:

    * tipe datanya jadi nggak jelas (bisa ketukar `String` ↔ `int`)
    * rawan error karena null (null-safety nggak bisa bantu)
    * gampang typo di key JSON dan tidak ketahuan
    * ribet kalau API berubah, karena semua bagian app yang pakai Map harus diubah satu-satu

    Dengan model, semuanya lebih aman, rapi, dan gampang dirawat.
    Flutter juga lebih enak memeriksa tipe data karena setiap field punya struktur yang jelas.


2. Fungsi package `http` dan `CookieRequest`, dan perbedaannya

    **http**
    → dipakai buat request biasa yang nggak perlu login/session.
    Contohnya buat fetch data publik.

    **CookieRequest**
    → ini khusus dari package `pbp_django_auth`.
    → dipakai buat request yang perlu autentikasi ke Django, karena dia otomatis menyimpan cookie session dari Django.

    Bedanya simpel:

    | http                      | CookieRequest                         |
    | ------------------------- | ------------------------------------- |
    | tidak bawa cookie         | bawa cookie session                   |
    | tidak bisa login/register | bisa login-register-logout            |
    | cocok untuk API publik    | perlu untuk API yang butuh user login |


3. Kenapa CookieRequest perlu dishare ke seluruh aplikasi?

    Karena CookieRequest menyimpan session login.
    Kalau tidak dishare, tiap halaman akan punya sesi berbeda → Django bakal mengira user belum login.

    Dengan Provider:

    ```dart
        Provider(
        create: (_) => CookieRequest(),
        child: MaterialApp(...),
        )
    ```

    semua halaman bisa pakai session yang sama, jadi login tetap ke-detect sampai logout.


4. Konfigurasi konektivitas Flutter → Django

    Supaya Flutter bisa ngobrol dengan Django, ada beberapa konfigurasi wajib:

    a. ALLOWED_HOSTS

    Harus ditambah:

    ```
    "10.0.2.2"
    ```

    Ini biar emulator Android bisa akses localhost Django.
    Kalau tidak ditambah → Django nolak request (400 Bad Request).

    b. CORS

    Perlu aktif supaya Flutter boleh akses Django dari domain berbeda.
    Kalau salah konfigurasi → semua request gagal sebelum sampai views.

    c. Cookie SameSite

    Django harus set:

    ```
    SESSION_COOKIE_SAMESITE = "None"
    SESSION_COOKIE_SECURE = True
    ```

    Kalau tidak → cookie login tidak terkirim → login dari Flutter selalu gagal.

    d. Izin internet Android

    Di AndroidManifest:

    ```xml
    <uses-permission android:name="android.permission.INTERNET" />
    ```

    Kalau tidak ditambah → Flutter nggak bisa connect ke mana pun.

5. Mekanisme data dari input → Django → tampil di Flutter

    1. User isi form (misalnya tambah produk)
    2. Flutter kirim data dalam bentuk JSON ke Django melalui `request.postJson()`
    3. Django terima data → dibersihkan → disimpan ke database
    4. Django kirim response JSON (`{"status": "success"}`)
    5. Flutter terima → tampilkan snackbar → kembali ke menu
    6. Saat halaman produk dibuka lagi, Flutter fetch `/json/` dan produk baru muncul


6. Mekanisme autentikasi: login, register, logout

    REGISTER:

    * Flutter kirim data username + password
    * Django bikin user baru
    * Flutter arahkan ke halaman login

    LOGIN:

    * Flutter kirim username + password
    * Django cek dengan `authenticate()`
    * Django bikin session + kirim cookie
    * CookieRequest simpan cookie tersebut
    * Flutter masuk ke halaman Menu

    LOGOUT:

    * Flutter panggil `request.logout()`
    * Django hapus session
    * CookieRequest buang cookie
    * Flutter kembali ke halaman login


7. Cara saya mengerjakan checklist secara bertahap (step-by-step)
    1. Mulai dari membuat model Django untuk Product dan endpoint JSON
    2. Bikin model Dart biar struktur datanya rapi dan aman
    3. Nambahin CookieRequest sebagai Provider global
    4. Bikin form produk lengkap dengan semua field dan validasinya
    5. Menambahkan fitur POST produk ke Django
    6. Bikin halaman list produk yang ngambil data dari `/json/`
    7. Membuat card tampilan untuk tiap produk
    8. Membuat halaman detail
    9. Menambah drawer + navigasi antar halaman
    10. Implementasi login & register dengan Django
    11. Implementasi logout dengan CookieRequest
    12. Ngetes semuanya satu per satu, terutama koneksi dan session
    13. Memperbaiki proxy-image karena hosting gambar eksternal tidak mengizinkan hotlink
    14. Ngerapiin struktur kode dan memperbaiki import-import