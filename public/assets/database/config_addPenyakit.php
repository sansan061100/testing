<?php
    include './connection.php';

            $ekstensi_diperbolehkan = array('png','jpg');
            $foto = $_FILES['foto']['name'];
            $x = explode('.', $foto);
            $ekstensi = strtolower(end($x));
            $file_tmp = $_FILES['foto']['tmp_name'];

            if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
                 move_uploaded_file($file_tmp, '../img/'.$foto);

                $kode_penyakit = $_POST['kode_penyakit'];
                $nama_penyakit = $_POST['nama_penyakit'];
                $deskripsi_penyakit = $_POST['deskripsi_penyakit'];
                $solusi = $_POST['solusi'];
                $foto = $foto;
                $sumber = $_POST['sumber'];
            }

    mysqli_query ($connect, "INSERT INTO penyakit VALUE ('$kode_penyakit','$nama_penyakit','$deskripsi_penyakit','$solusi','$sumber','$foto')") or die (mysqli_error ($connect));
    header ("location: ../../dashboard/dashboard_admin.php?message=success");
?>