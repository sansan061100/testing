<?php

namespace App\Livewire;

use App\Models\User;
use Filament\Forms;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Livewire\Component;
use Illuminate\Contracts\View\View;
use Joaopaulolndev\FilamentEditProfile\Concerns\HasSort;

class CustomProfileComponent extends Component implements HasForms
{
    use InteractsWithForms;
    use HasSort;

    public ?array $data = [];

    protected static int $sort = 0;

    public function mount(): void
    {
        $this->form->fill();
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Informasi Pribadi')
                    ->aside()
                    ->description('Informasi pribadi Anda')
                    ->schema([
                        TextInput::make('nama')
                            ->label('Nama')
                            ->required(),
                        TextInput::make('no_telepon')
                            ->label('No Telepon')
                            ->required(),
                        Textarea::make('alamat')
                            ->label('Alamat')
                            ->required(),
                    ]),
            ])
            ->statePath('data');
    }

    public function save(): void
    {
        $data = $this->form->getState();

        User::where('id', auth()->user()->id)->update($data);
    }

    public function render(): View
    {
        return view('livewire.custom-profile-component');
    }
}
