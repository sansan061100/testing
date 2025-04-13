<?php

namespace App\Filament\Resources;

use App\Filament\Resources\HasilDiagnosaResource\Pages;
use App\Filament\Resources\HasilDiagnosaResource\RelationManagers;
use App\Models\Gejala;
use App\Models\HasilDiagnosa;
use Filament\Forms;
use Filament\Forms\Components\Checkbox;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\HtmlString;

class HasilDiagnosaResource extends Resource
{
    protected static ?string $model = HasilDiagnosa::class;

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-check';

    public static function form(Form $form): Form
    {
        $gejala = Gejala::all();
        $gejalaCheckboxForm = [];

        foreach ($gejala as $key => $item) {
            $gejalaCheckboxForm[] = Group::make([
                Placeholder::make('gejala_' . $item->id)
                    ->label(new HtmlString('<p class="text-md">' . $key + 1 . '. ' . $item->nama_gejala . '</p>')),
                Checkbox::make('gejala_' . $item->id)
                    ->label('Ya'),
            ]);
        }

        return $form
            ->schema($gejalaCheckboxForm)
            ->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->query(
                HasilDiagnosa::query()
                    ->when(auth()->user()->role == 'USER', function (Builder $query) {
                        return $query->where('user_id', auth()->user()->id);
                    })
            )
            ->columns([
                TextColumn::make('basis_pengetahuan.penyakit.nama_penyakit')
                    ->label('Penyakit')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('basis_pengetahuan.gejala.nama_gejala')
                    ->getStateUsing(function ($record) {
                        $gejala = Gejala::whereIn('id', $record->basis_pengetahuan->gejala_id)->get();

                        // pakai ul li
                        return new HtmlString('<ul class="list-disc pl-5">' . $gejala->map(function ($item) {
                            return '<li>' . $item->nama_gejala . '</li>';
                        })->implode('') . '</ul>');
                    })
                    ->searchable()
                    ->sortable(),
                TextColumn::make('user.nama')
                    ->label('User')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('created_at')
                    ->label('Tanggal')
                    ->dateTime('d/m/Y H:i')
                    ->sortable()
                    ->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                // Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                // Tables\Actions\BulkActionGroup::make([
                //     Tables\Actions\DeleteBulkAction::make(),
                // ]),
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
            'index' => Pages\ListHasilDiagnosas::route('/'),
            'create' => Pages\CreateHasilDiagnosa::route('/create'),
            'edit' => Pages\EditHasilDiagnosa::route('/{record}/edit'),
            'view' => Pages\ViewHasilDiagnosa::route('/{record}'),
        ];
    }
}
