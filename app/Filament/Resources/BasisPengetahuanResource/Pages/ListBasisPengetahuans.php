<?php

namespace App\Filament\Resources\BasisPengetahuanResource\Pages;

use App\Filament\Resources\BasisPengetahuanResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBasisPengetahuans extends ListRecords
{
    protected static string $resource = BasisPengetahuanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
