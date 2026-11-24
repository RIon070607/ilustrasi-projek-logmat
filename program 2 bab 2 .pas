program KalimatKeSimbol;
uses crt, sysutils;

var
  kalimat, teks: string;
  kiri, tengah, kanan: string;
  petaP, petaQ, petaR: string;
  simbol, hasil: string;
  posisi, posisi2: integer;
  selesai: boolean;
  negP, negQ, negR: boolean;

{ Menghilangkan kata tidak/bukan di awal proposisi }
function BersihkanNegasi(var kalimat: string): boolean;
var
  kata: string;
begin
  kata := lowercase(trim(kalimat));

  if pos('tidak ', kata) = 1 then
  begin
    delete(kalimat, 1, 6);
    kalimat := trim(kalimat);
    BersihkanNegasi := true;
  end
  else if pos('bukan ', kata) = 1 then
  begin
    delete(kalimat, 1, 6);
    kalimat := trim(kalimat);
    BersihkanNegasi := true;
  end
  else
    BersihkanNegasi := false;
end;

begin
  clrscr;
  selesai := false;

  writeln('======================================');
  writeln('       PROGRAM KALIMAT KE SIMBOL');
  writeln('======================================');

  repeat
    writeln;
    write('Masukkan kalimat (ketik keluar untuk berhenti): ');
    readln(kalimat);

    teks := lowercase(trim(kalimat));

    if teks = 'keluar' then
      selesai := true

    else
    begin
      kiri := '';
      tengah := '';
      kanan := '';
      petaP := '';
      petaQ := '';
      petaR := '';
      hasil := '';
      simbol := '';

      negP := false;
      negQ := false;
      negR := false;

      { 1. BIIMPLIKASI }
      posisi := pos('jika dan hanya jika', teks);

      if posisi > 0 then
      begin
        kiri := trim(copy(kalimat, 1, posisi - 2));
        kanan := trim(copy(kalimat,
                   posisi + length('jika dan hanya jika') + 1,
                   length(kalimat)));

        petaP := kiri;
        petaQ := kanan;

        negP := BersihkanNegasi(petaP);
        negQ := BersihkanNegasi(petaQ);

        hasil := 'p <-> q';
        if negP then hasil := '~p <-> q';
        if negQ then hasil := 'p <-> ~q';
        if negP and negQ then hasil := '~p <-> ~q';

        simbol := 'Biimplikasi';
      end

      { 2. IMPLIKASI: JIKA ... MAKA ... }
      else if (pos('jika ', teks) = 1) and
              (pos(' maka ', teks) > 0) then
      begin
        posisi := pos(' maka ', teks);

        kiri := trim(copy(kalimat, 7, posisi - 7));
        kanan := trim(copy(kalimat, posisi + 6,
                   length(kalimat)));

        { Memisahkan bagian kiri jika mengandung DAN }
        posisi2 := pos(' dan ', lowercase(kiri));

        if posisi2 > 0 then
        begin
          tengah := trim(copy(kiri, posisi2 + 5,
                       length(kiri)));
          kiri := trim(copy(kiri, 1, posisi2 - 1));

          petaP := kiri;
          petaQ := tengah;
          petaR := kanan;

          negP := BersihkanNegasi(petaP);
          negQ := BersihkanNegasi(petaQ);
          negR := BersihkanNegasi(petaR);

          hasil := '(p ^ q) -> r';
          if negP then hasil := '(~p ^ q) -> r';
          if negQ then hasil := '(p ^ ~q) -> r';
          if negR then hasil := '(p ^ q) -> ~r';
          if negP and negQ then hasil := '(~p ^ ~q) -> r';
          if negP and negR then hasil := '(~p ^ q) -> ~r';
          if negQ and negR then hasil := '(p ^ ~q) -> ~r';
          if negP and negQ and negR then
            hasil := '(~p ^ ~q) -> ~r';

          simbol := 'Konjungsi dan Implikasi';
        end
        else
        begin
          petaP := kiri;
          petaQ := kanan;

          negP := BersihkanNegasi(petaP);
          negQ := BersihkanNegasi(petaQ);

          hasil := 'p -> q';
          if negP then hasil := '~p -> q';
          if negQ then hasil := 'p -> ~q';
          if negP and negQ then hasil := '~p -> ~q';

          simbol := 'Implikasi';
        end;
      end

      { 3. HANYA JIKA }
      else if pos(' hanya jika ', teks) > 0 then
      begin
        posisi := pos(' hanya jika ', teks);

        kiri := trim(copy(kalimat, 1, posisi - 1));
        kanan := trim(copy(kalimat,
                   posisi + length(' hanya jika '),
                   length(kalimat)));

        petaR := kiri;
        petaQ := kanan;

        negR := BersihkanNegasi(petaR);
        negQ := BersihkanNegasi(petaQ);

        hasil := 'r -> q';
        if negR then hasil := '~r -> q';
        if negQ then hasil := 'r -> ~q';
        if negR and negQ then hasil := '~r -> ~q';

        simbol := 'Implikasi (Hanya jika)';
      end

end
 end;
  end;
   simbol := 'Negasi';
   hasil := '~p';
   petaP := tengah;
  begin
  else
  end
   simbol := 'Negasi Disjungsi';
   hasil := '~(p v q)';
   petaQ := trim(copy(tengah, posisi2 + 6, length(tengah)));
   petaP := trim(copy(tengah, 1, posisi2 - 1));
  begin
  if posisi2 > 0 then
  posisi2 := pos(' atau ', lowercase(tengah));
 begin
 else
 end
  simbol := 'Negasi Konjungsi';
  hasil := '~(p ^ q)';
  petaQ := trim(copy(tengah, posisi2 + 5, length(tengah)));
  petaP := trim(copy(tengah, 1, posisi2 - 1));
 begin
 if posisi2 > 0 then
 posisi2 := pos(' dan ', lowercase(tengah));
 tengah := trim(copy(kalimat, length('tidak benar bahwa ') + 1, length(kalimat)));
begin
else if pos('tidak benar bahwa ', teks) = 1 then
{ 3A. NEGASI ATAS SELURUH PROPOSISI MAJEMUK }
      { 4. KONJUNGSI }
      else if pos(' dan ', teks) > 0 then
      begin
        posisi := pos(' dan ', teks);

        kiri := trim(copy(kalimat, 1, posisi - 1));
        kanan := trim(copy(kalimat, posisi + 5,
                   length(kalimat)));

        petaP := kiri;
        petaQ := kanan;

        negP := BersihkanNegasi(petaP);
        negQ := BersihkanNegasi(petaQ);

        hasil := 'p ^ q';
        if negP then hasil := '~p ^ q';
        if negQ then hasil := 'p ^ ~q';
        if negP and negQ then hasil := '~p ^ ~q';

        simbol := 'Konjungsi';
      end

      { 5. DISJUNGSI }
      else if pos(' atau ', teks) > 0 then
      begin
        posisi := pos(' atau ', teks);

        kiri := trim(copy(kalimat, 1, posisi - 1));
        kanan := trim(copy(kalimat, posisi + 6,
                   length(kalimat)));

        petaP := kiri;
        petaR := kanan;

        negP := BersihkanNegasi(petaP);
        negR := BersihkanNegasi(petaR);

        hasil := 'p v r';
        if negP then hasil := '~p v r';
        if negR then hasil := 'p v ~r';
        if negP and negR then hasil := '~p v ~r';

        simbol := 'Disjungsi';
      end

      { 6. NEGASI TUNGGAL }
      else if (pos('tidak ', teks) = 1) or
              (pos('bukan ', teks) = 1) then
      begin
        petaP := kalimat;
        negP := BersihkanNegasi(petaP);

        hasil := '~p';
        simbol := 'Negasi';
      end

      { 7. POLA TIDAK DIKENALI }
      else
      begin
        petaP := kalimat;
        hasil := 'p';
        simbol := 'Proposisi tunggal';
      end;

      { MENAMPILKAN HASIL }
      writeln;
      writeln('======================================');
      writeln('          HASIL TRANSLASI');
      writeln('======================================');

      writeln('Pemetaan proposisi:');

      if petaP <> '' then
        writeln('p = ', petaP);

      if petaQ <> '' then
        writeln('q = ', petaQ);

      if petaR <> '' then
        writeln('r = ', petaR);

      writeln;
      writeln('Jenis pola : ', simbol);
      writeln('Simbol     : ', hasil);

      writeln('======================================');
    end;

  until selesai;

  writeln;
  writeln('Program selesai. Terima kasih!');
  readln;
end.
