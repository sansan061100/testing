<?php

namespace App\Http\Controllers;

use App\Models\HasilDiagnosa;
use Illuminate\Http\Request;

class PrintController extends Controller
{
    public function print($record)
    {
        $data = [
            'record' => HasilDiagnosa::findOrFail($record),
        ];

        return view('print', $data);
    }
}
