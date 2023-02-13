<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Auto extends Model
{
    use HasFactory;
    public $table = 'autok';
    public $timestamps = false;
    public $guarded = [];

    /**
     * Get the tulajdonos that owns the Auto
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tulajdonos()
    {
        return $this->belongsTo(Tulajdonos::class, 'tulajdonos');
    }
}
