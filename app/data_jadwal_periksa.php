<!DOCTYPE html>
<html lang="en">
  <?php
    include('../conf/config_poliklinik.php');
  ?>
  <body class="hold-transition sidebar-mini">
    <div class="wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-1">
              <div class="col-sm-6">
                <h1>Jadwal Periksa</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                  <li class="breadcrumb-item active">Jadwal Periksa</li>
                </ol>
              </div>
            </div>
          </div><!-- /.container-fluid -->
      </section>
      <!-- Main content -->
      <section class="content-header">
        <div class="container-fluid">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg">
            Tambah Jadwal Periksa
          </button>
          <br></br>
          <div class="row">
            <!-- /.col -->
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Daftar Jadwal Periksa</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th style="width: 10px">No</th>
                        <th>Nama Dokter</th>
                        <th>Hari</th>
                        <th>Jam Mulai</th>
                        <th>Jam Selesai</th>
                        <th>Status</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                        $query = mysqli_query($koneksi,"SELECT jadwal_periksa.*, dokter.nama FROM jadwal_periksa LEFT JOIN dokter ON jadwal_periksa.id_dokter = dokter.id");
                        while($dok = mysqli_fetch_array($query)){
                          
                      ?>
                      <tr>
                        <td><?php echo $dok['id'];?></td>
                        <td><?php echo $dok['nama'];?></td>
                        <td><?php echo $dok['hari'];?></td>
                        <td><?php echo $dok['jam_mulai'];?></td>
                        <td><?php echo $dok['jam_selesai']; ?></td>
                        <td>
                        <?php 
                                if ($dok['aktif'] == 'Y'){
                                    echo 'Aktif';
                                }
                                else if ($dok['aktif'] == 'N'){
                                    echo 'Tidak Aktif';
                                } 
                                else {
                                    echo 'Tidak ada jadwal';
                                } 
                            ?>
                        </td>
                        <td>
                          <a href="dokter.php?page=edit-data-jadwal-periksa&& id=<?php echo $dok['id']?>" class="btn btn-sm btn-success">Ubah</a>
                        </td>
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->
          </div>
        </div>  
      </section>
      <!-- /.content -->

      <!-- Tambah Data Dokter -->
      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Tambah Data Dokter</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetData()">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="dataDokter" method="post" action="add/tambah_data_dokter.php">
              <div class="modal-body">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputNamaDokter">Nama Dokter</label>
                    <input type="text" class="form-control" id="exampleInputNamaDokter" placeholder="Nama Dokter" name="nama" required>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputAlamat">Alamat</label>
                    <input type="text" class="form-control" id="exampleInputAlamat" placeholder="Alamat" name="alamat" required>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputNoHp">Nomor Hp</label>
                    <input type="text" class="form-control" id="exampleInputNoHp" placeholder="Nomor Hp" name="no_hp" required>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                      <!-- select -->
                      <div class="form-group">
                        <label>Poli</label>
                        <select class="form-control" name="nama_poli">
                          <option selected>Pilih</option>
                          <?php
                            $query = mysqli_query($koneksi,"SELECT id, nama_poli FROM poli");
                            while($dok = mysqli_fetch_array($query)){
                              echo '<option value="'.$dok['id'].'">'.htmlentities($dok['nama_poli']).'</option>';
                            }
                          ?>
                        </select>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <div class="modal-footer justify-content-between">
                  <button type="submit" class="btn btn-default" data-dismiss="modal" onclick="resetData()">Batal</button>
                  <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
              </div>  
            </form>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
      </div>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->
    <script>
      // Reset the form after submission
      function resetData() {
        document.getElementById("dataDokter").reset();
      }

      function hapus_data_dokter(data_id){
        Swal.fire({
          title: "Apakah yakin data ingin dihapus ?",
          showCancelButton: true,
          confirmButtonText: "Hapus Data",
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
            window.location=("delete/hapus_data_dokter.php?id="+data_id)
          }
        });
      }
    </script>
  </body>
</html>