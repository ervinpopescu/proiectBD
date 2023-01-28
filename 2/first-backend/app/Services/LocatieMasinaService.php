<?php

namespace App\Services;

use App\Models\LocatieMasina;

class LocatieMasinaService
{
    public function _construct()
    {
        //
    }

    public function setProperties(LocatieMasina $locatie, array $properties): void
    {
        if (!empty($properties['x'])) {
            $locatie->x = $properties['x'];
        }

        if (!empty($properties['y'])) {
            $locatie->y = $properties['y'];
        }

    }
}