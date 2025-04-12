<?php

namespace App\Http\Controllers;

use App\Models\Gejala;
use App\Models\Kontak;
use App\Models\Penyakit;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $penyakit = Penyakit::count();
        $gejala = Gejala::count();
        $pengguna = User::count();
        return view('dashboard', [
            'penyakit' => $penyakit,
            'gejala' => $gejala,
            'pengguna' => $pengguna,
        ]);
    }

    public function kontak() {
        Kontak::create([
            'nama' => request('nama'),
            'email' => request('email'),
            'subject' => request('subject'),
        ]);

        return redirect()->back()->with('success', 'Pesan berhasil dikirim');
    }
}
