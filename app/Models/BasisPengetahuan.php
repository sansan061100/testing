<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BasisPengetahuan extends Model
{
    protected $table = 'basis_pengetahuan';

    protected $guarded = ['id'];

    public function penyakit()
    {
        return $this->belongsTo(Penyakit::class);
    }

    protected $casts = [
        'gejala_id' => 'array',
    ];
}
