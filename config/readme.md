## Medpoint mediverse
tujuan Medpoint mediverse system adalah 
- pengguna bisa melakukan berbagai jenis reservasi medis online, termasuk konsultasi dokter, tes laboratorium, tindakan medis, dan vaksinasi. 
- memudahkan pengguna dengan proses reservasi online saat menjalani tindakan medis. 
- mempunyai fitur pencarian dokter dan fasilitas kesehatan (faskes), penjadwalan janji temu dengan dokter atau tindakan medis. 
- fitur utama seperti autentikasi, manajemen pengguna, reservasi, data dokter, data fasilitas kesehatan, data layanan, e-prescription, pembayaran, dan notifikasi.
  
terdapat aktor
- Super Admin –> Mengelola semua data master dan hak akses pengguna.
    - [ ] manage semua data master
    - [ ] manage role permission
- Admin –> Mengelola data master, jadwal, slot reservasi, dan pembayaran.
    - [ ] manage data master
    - [ ] manage jadwal
    - [ ] manage reservasi
    - [ ] manage pembayaran
- User –> Membuat reservasi, membatalkan, dan melakukan pembayaran.
    - [ ] membuat dan membatalkan reservasi
    - [ ] melakukan dan membatalkan pembayaran
- Doctor –> 
    - [ ] Menyediakan slot reservasi, 
    - [ ] menyetujui reservasi, 
    - [ ] memberikan konsultasi 
    - [ ] resep obat.


## Fitur Utama CMS:
- [x] Auth dan User, Admin dapat login dan dapat mengelola profile pengguna
- [ ] Reservations, Menampilkan list reservasi dan dapat dikelola oleh Super Admin seperti Booking, Reschedule dan Cancel Reservation
- [ ] Data Doctor, Menampilkan list data Dokter yang dapat dikelola oleh super admin
- [ ] Master Data, Menampilkan dan mengelola CRUD Data Master Faskes, Master data poli, master data layanan, dan data Address
- [x] Payment, Menampilkan Billing dan validasi pembayaran
- [x] Notifications, Allow to recieves and read notifications

## Fitur utama Mobile:
- [x] User, Registrasi, Login dan Mengelola profil pribadi
- [x] Payment, Billing dan melakukan pembayaran
- [x] Notifications, Allow to recieves and read notifications
- [x] Reservation, Search, booking dan membatalkan reservasi

## yang terdapat di API
- [x] authService -> Menangani autentikasi dan otorisasi pengguna. 
- [x] userManagementService -> Mengelola data pengguna (Super Admin, Admin, User, Doctor).
- [x] reservationService -> Menangani proses reservasi, termasuk booking, reschedule, dan cancel reservation.
- [x] doctorManagementService -> Mengelola data dokter dan slot reservasi.
- [x] facilityManagementService -> Mengelola data fasilitas kesehatan (faskes) dan layanan.
- [x] prescriptionService -> Mengelola data resep dan riwayat medis pasien.
- [x] paymentService -> Mengelola pembayaran
- [x] notificationService -> Mengelola notifikasi



