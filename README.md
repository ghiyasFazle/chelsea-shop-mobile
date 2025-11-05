# TUGAS 7 #

1. apa itu widget tree dan hubungan parent child

widget tree itu semacam struktur pohon dari semua widget yang ada di aplikasi flutter. setiap tampilan di flutter dibangun dari banyak widget yang saling bersarang. ada widget induk (parent) yang membungkus widget lain di dalamnya (child). misalnya Scaffold itu parent dari body, lalu di dalam body ada Column, di dalam Column ada ElevatedButton dan seterusnya. jadi semuanya saling terhubung membentuk satu pohon tampilan.

---

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


