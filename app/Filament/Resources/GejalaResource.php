<?php

namespace App\Filament\Resources;

use App\Filament\Resources\GejalaResource\Pages;
use App\Filament\Resources\GejalaResource\RelationManagers;
use App\Models\Gejala;
use Filament\Forms;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class GejalaResource extends Resource
{
    protected static ?string $model = Gejala::class;

    protected static ?string $navigationIcon = 'heroicon-o-heart';

    public static function canAccess(): bool
    {
        return auth()->user()->role == "ADMIN";
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('kode')
                    ->readOnly()
                    ->required()
                    ->default(function () {
                        // return 'SPK-'. str_pad(Penyakit::max('kode') + 1, 4, '0', STR_PAD_LEFT);

                        // kode di database SPK-001, SPK-002, SPK-003
                        $lastKode = Gejala::max('kode');
                        $lastNumber = (int) substr($lastKode, 4);
                        $newNumber = $lastNumber + 1;

                        $newKode = 'SPK-' . str_pad($newNumber, 3, '0', STR_PAD_LEFT);
                        return $newKode;
                    }),
                TextInput::make('nama_gejala')
                    ->required(),
                Textarea::make('pertanyaan')
                    ->required()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('kode')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('nama_gejala')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('pertanyaan')
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListGejalas::route('/'),
        ];
    }
}
