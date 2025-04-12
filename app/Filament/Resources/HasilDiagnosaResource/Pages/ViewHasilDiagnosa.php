<?php

namespace App\Filament\Resources\HasilDiagnosaResource\Pages;

use App\Filament\Resources\HasilDiagnosaResource;
use Filament\Actions;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Resources\Pages\ViewRecord;

class ViewHasilDiagnosa extends ViewRecord
{
    protected ?string $heading = "Hasil Diagnosa";

    protected static string $resource = HasilDiagnosaResource::class;

    protected static string $view = 'filament.pages.view-hasil-diagnosa';
}
