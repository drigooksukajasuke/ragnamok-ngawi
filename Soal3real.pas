program hasil_studi_mahasiswa;
uses crt;

{ Metode pengerjaan:
  1. Simpan data banyak mahasiswa pakai array of record (data_mhs), dan tiap mahasiswa
     punya array of record lagi buat nyimpen daftar mata kuliah yang diambil (data_mk).
  2. Saat input, tiap mata kuliah langsung diubah huruf nilainya jadi bobot angka, lalu
     dihitung skornya (sks * bobot) sambil mengakumulasi total SKS dan total skor.
  3. Setelah semua data selesai diinput, tampilkan satu per satu per mahasiswa lalu pakai
     readln supaya layar berhenti nunggu Enter sebelum lanjut ke mahasiswa berikutnya. }

type
  data_mk = record
    nama_mk : string;
    sks     : integer;
    nilai   : string;
    skor    : real;
  end;

  data_mhs = record
    nama      : string;
    nim       : string;
    jml_mk    : integer;
    mk        : array[1..20] of data_mk;
    total_sks : integer;
    total_skor: real;
    ip        : real;
  end;

var
  mhs          : array[1..50] of data_mhs;
  jml_mhs, i, j: integer;
  bobot        : real;

begin
  clrscr;
  { Langkah 1: Minta jumlah mahasiswa dulu buat batas perulangan input }
  write('Masukkan jumlah mahasiswa: ');
  readln(jml_mhs);
  writeln;

  { Langkah 2: Perulangan luar untuk input data tiap mahasiswa }
  for i := 1 to jml_mhs do
  begin
    writeln('--- Input Mahasiswa ke-', i, ' ---');
    write('Nama : ');
    readln(mhs[i].nama);
    write('NIM  : ');
    readln(mhs[i].nim);
    write('Jumlah mata kuliah : ');
    readln(mhs[i].jml_mk);

    { Reset akumulator tiap awal mahasiswa biar nggak nyampur sama mahasiswa sebelumnya }
    mhs[i].total_sks := 0;
    mhs[i].total_skor := 0;

    { Langkah 3: Perulangan dalam untuk input mata kuliah sesuai jumlah MK mahasiswa ini }
    for j := 1 to mhs[i].jml_mk do
    begin
      writeln('  Mata kuliah ke-', j);
      write('  Nama MK : ');
      readln(mhs[i].mk[j].nama_mk);
      write('  SKS     : ');
      readln(mhs[i].mk[j].sks);
      write('  Nilai   : ');
      readln(mhs[i].mk[j].nilai);

      { Konversi nilai huruf ke bobot angka pakai if-else (dicek huruf besar & kecil) }
      if (mhs[i].mk[j].nilai = 'A') or (mhs[i].mk[j].nilai = 'a') then
        bobot := 4
      else if (mhs[i].mk[j].nilai = 'B+') or (mhs[i].mk[j].nilai = 'b+') then
        bobot := 3.5
      else if (mhs[i].mk[j].nilai = 'B') or (mhs[i].mk[j].nilai = 'b') then
        bobot := 3
      else if (mhs[i].mk[j].nilai = 'C+') or (mhs[i].mk[j].nilai = 'c+') then
        bobot := 2.5
      else if (mhs[i].mk[j].nilai = 'C') or (mhs[i].mk[j].nilai = 'c') then
        bobot := 2
      else if (mhs[i].mk[j].nilai = 'D') or (mhs[i].mk[j].nilai = 'd') then
        bobot := 1
      else
        bobot := 0;

      { Hitung skor MK ini (SKS * bobot), lalu tambahkan ke total SKS dan total skor }
      mhs[i].mk[j].skor := mhs[i].mk[j].sks * bobot;
      mhs[i].total_sks := mhs[i].total_sks + mhs[i].mk[j].sks;
      mhs[i].total_skor := mhs[i].total_skor + mhs[i].mk[j].skor;
    end;

    { Hitung IP dengan rumus total skor dibagi total SKS (cegah pembagian nol) }
    if mhs[i].total_sks > 0 then
      mhs[i].ip := mhs[i].total_skor / mhs[i].total_sks
    else
      mhs[i].ip := 0;

    writeln;
  end;

  { Langkah 4: Tampilkan hasil studi satu per satu mahasiswa }
  for i := 1 to jml_mhs do
  begin
    clrscr;
    writeln('Nama : ', mhs[i].nama);
    writeln('NIM  : ', mhs[i].nim);