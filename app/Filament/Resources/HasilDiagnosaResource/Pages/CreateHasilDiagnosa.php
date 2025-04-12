<?php

namespace App\Filament\Resources\HasilDiagnosaResource\Pages;

use App\Filament\Resources\HasilDiagnosaResource;
use App\Models\BasisPengetahuan;
use App\Models\HasilDiagnosa;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;

class CreateHasilDiagnosa extends CreateRecord
{
    protected static string $resource = HasilDiagnosaResource::class;

    protected static bool $canCreateAnother = false;

    protected function handleRecordCreation(array $data): Model
    {
        $selectedGejala = collect($data)
            ->filter(fn($value, $key) => $value === true && str_starts_with($key, 'gejala_'))
            ->map(fn($value, $key) => (int) str_replace('gejala_', '', $key))
            ->values()
            ->toArray();

        $hasil = BasisPengetahuan::all()
            ->filter(function ($item) use ($selectedGejala) {
                $gejalaDb = is_string($item->gejala_id) ? json_decode($item->gejala_id, true) : $item->gejala_id;
                return collect($gejalaDb)->every(fn($gejala) => in_array($gejala, $selectedGejala));
            })
            ->first();

        if (!$hasil) {
            // Kalau tidak ditemukan, kirim notifikasi & hentikan proses
            Notification::make()
                ->title('Penyakit tidak ditemukan')
                ->danger()
                ->send();

            // Kembalikan ke form tanpa membuat data
            $this->halt();
        }

        return HasilDiagnosa::create([
            'basis_pengetahuan_id' => $hasil->id,
            'user_id' => auth()->user()->id,
        ]);
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', [
            'record' => $this->record,
        ]);
    }

    // Hapus beforeSave karena sudah ditangani di atas
}
