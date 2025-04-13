<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PenyakitResource\Pages;
use App\Filament\Resources\PenyakitResource\RelationManagers;
use App\Models\Penyakit;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PenyakitResource extends Resource
{
    protected static ?string $model = Penyakit::class;

    protected static ?string $navigationIcon = 'heroicon-o-beaker';

    public static function canAccess(): bool
    {
        return auth()->user()->role == "ADMIN";
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('nama_penyakit')
                    ->required(),
                Textarea::make('deskripsi_penyakit')
                    ->required(),
                Textarea::make('solusi')
                    ->required(),
                FileUpload::make('foto')
                    ->image()
                    ->required(),
                TextInput::make('sumber')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_penyakit')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('deskripsi_penyakit')
                    ->sortable()
                    ->wrap()
                    ->limit(200)
                    ->searchable(),
                TextColumn::make('solusi')
                    ->sortable()
                    ->wrap()
                    ->limit(200)
                    ->searchable(),
                ImageColumn::make('foto')
                    ->label(label: 'Foto Penyakit')
                    ->size(200),
                TextColumn::make('sumber')
                    ->sortable()
                    ->searchable(),
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
            'index' => Pages\ListPenyakits::route('/'),
            // 'create' => Pages\CreatePenyakit::route('/create'),
            // 'edit' => Pages\EditPenyakit::route('/{record}/edit'),
        ];
    }
}
