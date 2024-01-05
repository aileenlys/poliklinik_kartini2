<?php
// session_start();

// include('../../conf/config_poliklinik.php');
// include('functions.php');

// $id_pasien = $_POST['id_pasien'];
// $no_rm = $_POST['no_rm'];
// $queryFetchIdPasien = mysqli_query($koneksi, "SELECT id FROM pasien WHERE no_rm = '$no_rm'");

// $id_jadwal = $_POST['id_jadwal'];
// $keluhan = $_POST['keluhan'];
// $no_antrian = getLatestNoAntrian($id_jadwal, $koneksi) + 1;

// if ($row = mysqli_fetch_assoc($queryFetchIdPasien)) {
//     $id_pasien = $row['id'];

//     $queryInsertDaftarPoli = mysqli_query($koneksi, "INSERT INTO daftar_poli (id_pasien, id_jadwal, keluhan, no_antrian) VALUES ('$id_pasien', '$id_jadwal', '$keluhan', '$no_antrian')");

//     if (!$queryInsertDaftarPoli) {
//         die('Error: ' . mysqli_error($koneksi));
//     }

//     $_SESSION['success_message'] = 'Berhasil mendaftar poli';
    
//     header('Location: ../pasien.php?page=data-poli');
// } else {
//     echo 'No_rm not found in the pasien table.';
// }
?>

<?php
session_start();

include('../../conf/config_poliklinik.php');
include('functions.php');

$id_pasien = $_POST['id_pasien'];
$no_rm = $_POST['no_rm'];
$queryFetchIdPasien = mysqli_query($koneksi, "SELECT id FROM pasien WHERE no_rm = '$no_rm'");

$id_jadwal = $_POST['id_jadwal'];
$keluhan = $_POST['keluhan'];
$no_antrian = getLatestNoAntrian($id_jadwal, $koneksi) + 1;

if ($row = mysqli_fetch_assoc($queryFetchIdPasien)) {
    $id_pasien = $row['id'];

    // Menggunakan mysqli_query untuk menjalankan query
    $queryInsertDaftarPoli = mysqli_query($koneksi, "INSERT INTO daftar_poli (id_pasien, id_jadwal, keluhan, no_antrian) VALUES ('$id_pasien', '$id_jadwal', '$keluhan', '$no_antrian')");

    // Menangkap kesalahan secara manual
    if (!$queryInsertDaftarPoli) {
        // Menggunakan pesan yang lebih informatif
        $_SESSION['error_message'] = 'Gagal mendaftar poli. Silakan coba lagi. ' . mysqli_error($koneksi);

        // Redirect ke halaman sebelumnya atau halaman tertentu
        header('Location: ../pasien.php?page=data-poli');
        exit;
    }

    // Jika berhasil, kita set pesan sukses
    $_SESSION['success_message'] = 'Berhasil mendaftar poli';

    // Redirect ke halaman sukses atau halaman tertentu
    header('Location: ../pasien.php?page=data-poli');
    exit;
} else {
    // Jika no_rm tidak ditemukan, kita set pesan error
    $_SESSION['error_message'] = 'No_rm tidak ditemukan di tabel pasien.';

    // Redirect ke halaman sebelumnya atau halaman tertentu
    header('Location: ../pasien.php?page=data-poli');
    exit;
}
?>
