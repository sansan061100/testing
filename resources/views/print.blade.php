<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Hasil Diagnosa</title>
    <script>
        window.onload = function() {
            window.print();
        }
    </script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-black text-sm p-8">
    <div class="overflow-x-auto">
        <h1 class="text-2xl font-bold mb-4 text-center">Hasil Diagnosa</h1>
        <table class="w-full text-sm text-left text-black border border-gray-300">
            <tbody class="bg-white divide-y divide-gray-300">
                <tr>
                    <td class="px-6 py-4 font-medium w-40">Gejala</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        @php
                            $gejala = \App\Models\Gejala::whereIn('id', $record->basis_pengetahuan->gejala_id)->get();
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
                    <td class="px-6 py-4">{{ $record->basis_pengetahuan->penyakit->nama_penyakit }}</td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Deskripsi</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">{{ $record->basis_pengetahuan->penyakit->deskripsi_penyakit }}</td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Solusi</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">{{ $record->basis_pengetahuan->penyakit->solusi }}</td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Foto</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">
                        <img src="{{ asset('storage/' . $record->basis_pengetahuan->penyakit->foto) }}" alt="Foto Penyakit" class="w-32 h-32 object-cover rounded-md border border-gray-300">
                    </td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Sumber</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">{{ $record->basis_pengetahuan->penyakit->sumber }}</td>
                </tr>

                <tr>
                    <td class="px-6 py-4 font-medium">Tanggal Diagnosa</td>
                    <td class="px-2 py-4">:</td>
                    <td class="px-6 py-4">{{ $record->created_at->format('d-m-Y H:i:s') }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
