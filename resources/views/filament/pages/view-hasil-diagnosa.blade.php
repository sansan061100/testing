<x-filament-panels::page>
    <div class="overflow-x-auto">
        <table class="w-full text-sm text-left text-black border border-gray-300">
            <tbody class="bg-white divide-y divide-gray-300">
                <tr>
                    <td class="px-6 py-4 font-medium w-40">Gejala</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        @php
                        $gejala = \App\Models\Gejala::whereIn('id', $this->record->basis_pengetahuan->gejala_id)->get();
                        @endphp

                        <ul class="list-disc pl-5 text-black">
                            @foreach ($gejala as $item)
                            <li>{{ $item->nama_gejala }}</li>
                            @endforeach
                        </ul>
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Penyakit</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        {{ $this->record->basis_pengetahuan->penyakit->nama_penyakit }}
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Deskripsi</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        {{ $this->record->basis_pengetahuan->penyakit->deskripsi_penyakit }}
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Solusi</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        {{ $this->record->basis_pengetahuan->penyakit->solusi }}
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Foto</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        <img src="{{ asset('storage/' . $this->record->basis_pengetahuan->penyakit->foto) }}" alt="Foto Penyakit" class="w-32 h-32 object-cover rounded-md border border-gray-300">
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Sumber</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        {{ $this->record->basis_pengetahuan->penyakit->sumber }}
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Tanggal Diagnosa</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        {{ $this->record->created_at->format('d-m-Y H:i:s') }}
                    </td>
                </tr>

            </tbody>
        </table>
        <div class="mt-5">
            <x-filament::button size="md" color="info" href="{{ url('/app/hasil-diagnosas/create') }}" tag="a">
                Kembali Diagnosa
            </x-filament::button>
            <td>
                <x-filament::button size="md" color="success" href="{{ url('/print/' . $this->record->id) }}" tag="a" target="_blank">
                    Print
                </x-filament::button>
            </td>
        </div>
    </div>
</x-filament-panels::page>
