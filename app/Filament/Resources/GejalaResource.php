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

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function canAccess(): bool
    {
        return auth()->user()->role == "ADMIN";
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
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
