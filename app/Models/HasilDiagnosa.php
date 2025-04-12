<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HasilDiagnosa extends Model
{
    protected $table = 'hasil_diagnosa';

    protected $guarded = ['id'];

    public function basis_pengetahuan()
    {
        return $this->belongsTo(BasisPengetahuan::class, 'basis_pengetahuan_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}