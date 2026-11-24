program kodeprogram1;
uses crt, sysutils;

var
  kalimat, teks, operatorLogika: string;
  jenis: string;
  selesai: boolean;

begin
  clrscr;
  selesai := false;

  writeln('======================================');
  writeln('     PROGRAM PENENTU JENIS PROPOSISI');
  writeln('======================================');

  repeat
    writeln;
    write('Masukkan kalimat (ketik keluar untuk berhenti): ');
    readln(kalimat);

    { Mengubah kalimat menjadi huruf kecil }
    teks := lowercase(kalimat);

    if teks = 'keluar' then
      selesai := true

    else
    begin
      operatorLogika := '';
      jenis := '';

      { Memeriksa tanda tanya, seru, dan kata perintah }
      if (copy(teks, length(teks), 1) = '?') or
         (copy(teks, length(teks), 1) = '!') or
         (pos('silakan', teks) = 1) or
         (pos('kerjakan', teks) = 1) then
      begin
        jenis := 'BUKAN PROPOSISI';
        operatorLogika := 'Kalimat tanya, seruan, atau perintah';
      end

      else
      begin
        { Memeriksa operator biimplikasi terlebih dahulu }
        if pos('jika dan hanya jika', teks) > 0 then
          operatorLogika := 'Biimplikasi (jika dan hanya jika)'

        else if pos('jika', teks) > 0 then
          operatorLogika := 'Implikasi (jika)'

        else if pos('maka', teks) > 0 then
          operatorLogika := 'Implikasi (maka)'

        else if pos(' dan ', teks) > 0 then
          operatorLogika := 'Konjungsi (dan)'

        else if pos(' atau ', teks) > 0 then
          operatorLogika := 'Disjungsi (atau)'

        else if pos('tidak', teks) > 0 then
          operatorLogika := 'Negasi (tidak)'

        else if pos('bukan', teks) > 0 then
          operatorLogika := 'Negasi (bukan)';

        { Menentukan jenis proposisi }
        if operatorLogika <> '' then
          jenis := 'PROPOSISI MAJEMUK'
        else
          jenis := 'PROPOSISI TUNGGAL';
      end;

      writeln;
      writeln('--------------------------------------');
      writeln('Hasil       : ', jenis);
      writeln('Kata kunci  : ', operatorLogika);

      if jenis = 'BUKAN PROPOSISI' then
        writeln('Penjelasan  : Kalimat tidak memiliki nilai')
        else if jenis = 'PROPOSISI MAJEMUK' then
          writeln('Penjelasan  : Kalimat mengandung operator')
          else
            writeln('Penjelasan  : Kalimat hanya memiliki satu pernyataan');

      writeln('--------------------------------------');
    end;

  until selesai = true;

  writeln;
  writeln('Program selesai. Terima kasih!');
  readln;
end.
