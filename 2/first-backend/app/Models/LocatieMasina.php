<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 *  App\Models\LocatieMasina
 * @property int $idLocatieMasina
 * @property float $x
 * @property float $y
 */

class LocatieMasina extends Model
{
    use HasFactory;

    protected $table = 'tblLocatieMasina';

    protected $columns = [
        'idLocatieMasina' => [
            'label' => 'idLocatieMasina'
        ],
        'x' => [
            'label' => 'x'
        ],
        'y' => [
            'label' => 'y'
        ]
    ];

    protected $primaryKey = 'idLocatieMasina';
}
