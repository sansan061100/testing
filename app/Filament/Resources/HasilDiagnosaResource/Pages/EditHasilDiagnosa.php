<?php

namespace App\Filament\Resources\HasilDiagnosaResource\Pages;

use App\Filament\Resources\HasilDiagnosaResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditHasilDiagnosa extends EditRecord
{
    protected static string $resource = HasilDiagnosaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
