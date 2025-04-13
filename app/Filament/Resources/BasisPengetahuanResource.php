<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BasisPengetahuanResource\Pages;
use App\Filament\Resources\BasisPengetahuanResource\RelationManagers;
use App\Models\BasisPengetahuan;
use App\Models\Gejala;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\HtmlString;

class BasisPengetahuanResource extends Resource
{
    protected static ?string $model = BasisPengetahuan::class;

    protected static ?string $navigationIcon = 'heroicon-o-question-mark-circle';

    public static function canAccess(): bool
    {
        return auth()->user()->role == "ADMIN";
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('penyakit_id')
                    ->relationship('penyakit', 'nama_penyakit')
                    ->searchable()
                    ->required(),
                Select::make('gejala_id')
                    ->multiple()
                    ->options(
                        Gejala::all()->pluck('nama_gejala', 'id')
                    )
                    ->searchable()
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('penyakit.nama_penyakit')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('gejala.nama_gejala')
                    ->getStateUsing(function ($record) {
                        $gejala = Gejala::whereIn('id', $record->gejala_id)->get();

                        // pakai ul li
                        return new HtmlString('<ul class="list-disc pl-5">' . $gejala->map(function ($item) {
                            return '<li>' . $item->nama_gejala . '</li>';
                        })->implode('') . '</ul>');
                    })
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
            'index' => Pages\ListBasisPengetahuans::route('/'),
            // 'create' => Pages\CreateBasisPengetahuan::route('/create'),
            // 'edit' => Pages\EditBasisPengetahuan::route('/{record}/edit'),
        ];
    }
}
