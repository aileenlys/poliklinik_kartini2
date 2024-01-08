<?php
include('../../conf/config_poliklinik.php');

// Get the dokter ID based on the name
$nama_dokter = $_POST['hidden_nama'];
$queryDokter = mysqli_query($koneksi, "SELECT id FROM dokter WHERE nama = '$nama_dokter'");
$dokter = mysqli_fetch_assoc($queryDokter);

if (!$dokter || empty($dokter['id'])) {
    die('Error: Dokter not found for name ' . $nama_dokter);
}

$id_dokter = $dokter['id'];

$hari = isset($_POST['hari']) ? $_POST['hari'] : null;
$jam_mulai = isset($_POST['jam_mulai']) ? $_POST['jam_mulai'] : null;
$jam_selesai = isset($_POST['jam_selesai']) ? $_POST['jam_selesai'] : null;
$status = isset($_POST['status']) ? $_POST['status'] : null;

// Add additional checks for null values
if ($hari === null || $jam_mulai === null || $jam_selesai === null || $status === null) {
    die('Error: Missing required parameters.');
}

$query = mysqli_query($koneksi, "INSERT INTO jadwal_periksa (id_dokter, hari, jam_mulai, jam_selesai, aktif) VALUES ('$id_dokter', '$hari', '$jam_mulai', '$jam_selesai', '$status')");

if (!$query) {
    die('Error: ' . mysqli_error($koneksi));
}
header('Location: ../dokter.php?page=data-jadwal-periksa');
?>
