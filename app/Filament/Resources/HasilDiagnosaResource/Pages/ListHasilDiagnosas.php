<?php

namespace App\Filament\Resources\HasilDiagnosaResource\Pages;

use App\Filament\Resources\HasilDiagnosaResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListHasilDiagnosas extends ListRecords
{
    protected static string $resource = HasilDiagnosaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // Actions\CreateAction::make()
            // ->hidden(fn (): bool => auth()->user()->role == "ADMIN")
        ];
    }
}
