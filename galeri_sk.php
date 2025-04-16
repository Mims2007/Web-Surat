<?php
    // Cek session
    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {
        if(isset($_REQUEST['act'])){
            $act = $_REQUEST['act'];
            switch ($act) {
                case 'fsk':
                    include "file_sk.php";
                    break;
            }
        } else {
            // Pagination
            $limit = 8;
            $pg = @$_GET['pg'];
            if(empty($pg)){
                $curr = 0;
                $pg = 1;
            } else {
                $curr = ($pg - 1) * $limit;
            }
            echo '
                    <div class="row">
                        <!-- Secondary Nav START -->
                        <div class="col s12">
                            <div class="z-depth-1">
                                <nav class="secondary-nav">
                                    <div class="nav-wrapper blue-grey darken-1">
                                        <div class="col 12">
                                            <ul class="left">
                                                <li class="waves-effect waves-light"><a href="?page=gsk" class="judul"><i class="material-icons">menu_book</i>Galeri file<a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <!-- Secondary Nav END -->
                    </div>
                    <!-- Row END --> 
            <div class="row jarak-form"> 
                <form class="col s12" method="post" action="">
                    <div class="input-field col s3">
                        <i class="material-icons prefix md-prefix">date_range</i>
                        <input id="dari_tanggal" type="date" name="dari_tanggal" required>
                        <label for="dari_tanggal">Dari Tanggal</label>
                    </div>
                    <div class="input-field col s3">
                        <i class="material-icons prefix md-prefix">date_range</i>
                        <input id="sampai_tanggal" type="date" name="sampai_tanggal" required>
                        <label for="sampai_tanggal">Sampai Tanggal</label>
                    </div>
                    <div class="col s6">
                        <button type="submit" name="submit" class="btn-large blue waves-effect waves-light">FILTER <i class="material-icons">filter_list</i></button>
                    </div>
                </form>
            </div>';

            if(isset($_REQUEST['submit'])){
                $dari_tanggal = $_REQUEST['dari_tanggal'];
                $sampai_tanggal = $_REQUEST['sampai_tanggal'];
                if($dari_tanggal == "" || $sampai_tanggal == ""){
                    header("Location: ./admin.php?page=gsk");
                    die();
                } else {
                    $query = mysqli_query($config, "SELECT * FROM tbl_surat_keluar WHERE tgl_catat BETWEEN '$dari_tanggal' AND '$sampai_tanggal' ORDER BY id_surat DESC LIMIT 10")
                    or die("Error: " . mysqli_error($config));
                    echo '<table class="highlight"> 
                            <thead>
                                <tr>
                                    <th>File</th>
                                    <th>No Surat</th>
                                    <th>Tanggal Surat</th>
                                    <th>Tindakan</th>
                                </tr>
                            </thead>
                            <tbody>';
                    if(mysqli_num_rows($query) > 0){
                        while($row = mysqli_fetch_array($query)){
                            echo '<tr>
                                    <td><a href="./upload/surat_keluar/'.$row['file'].'" target="_blank">'.$row['file'].'</a></td>
                                    <td>'.$row['no_surat'].'</td>
                                    <td>'.indoDate($row['tgl_catat']).'</td>
                                    <td><a class="btn light-green darken-1" href="?page=gsk&act=fsk&id_surat='.$row['id_surat'].'">Lihat Detail File</a></td>
                                  </tr>';
                        }
                    } else {
                        echo '<tr><td colspan="5" class="center-align">Tidak ada data ditemukan</td></tr>';
                    }
                    echo '</tbody>
                        </table>';
                }
            }
        }
    }
?>
