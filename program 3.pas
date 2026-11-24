program program3;
uses crt;

var
  p, q: boolean;
  inputP, inputQ: char;
  ulang: char;

begin
  clrscr;

  repeat
    writeln('======================================');
    writeln('       PROGRAM OPERATOR LOGIKA');
    writeln('======================================');
    writeln('B = Benar');
    writeln('S = Salah');
    writeln;

    { Memasukkan dan memvalidasi nilai p }
    repeat
      write('Masukkan nilai p (B/S): ');
      readln(inputP);
      inputP := upcase(inputP);

      if (inputP <> 'B') and (inputP <> 'S') then
        writeln('Input salah! Masukkan B atau S.');
    until (inputP = 'B') or (inputP = 'S');

    { Memasukkan dan memvalidasi nilai q }
    repeat
      write('Masukkan nilai q (B/S): ');
      readln(inputQ);
      inputQ := upcase(inputQ);

      if (inputQ <> 'B') and (inputQ <> 'S') then
        writeln('Input salah! Masukkan B atau S.');
    until (inputQ = 'B') or (inputQ = 'S');

    { Mengubah B/S menjadi boolean }
    p := (inputP = 'B');
    q := (inputQ = 'B');

    writeln;
    writeln('======================================');
    writeln('           HASIL OPERATOR');
    writeln('======================================');

    { NOT p }
    write('NOT p     : ');
    if not p then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Membalik nilai kebenaran p.');

    { NOT q }
    write('NOT q     : ');
    if not q then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Membalik nilai kebenaran q.');

    { p AND q }
    write('p AND q   : ');
    if p and q then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Benar hanya jika p dan q sama-sama benar.');

    { p OR q }
    write('p OR q    : ');
    if p or q then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Salah hanya jika p dan q sama-sama salah.');

    { Implikasi p -> q }
    write('p -> q    : ');
    if (not p) or q then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Salah hanya jika p = B dan q = S.');

    { Biimplikasi p <-> q }
    write('p <-> q   : ');
    if p = q then
      writeln('B')
    else
      writeln('S');
    writeln('Penjelasan: Benar jika nilai p dan q sama.');

    writeln('======================================');

    { Menanyakan apakah program diulang }
    writeln;
    write('Ulangi program? (Y/T): ');
    readln(ulang);
    ulang := upcase(ulang);

    clrscr;

  until ulang = 'T';

  writeln('Program selesai. Terima kasih!');
  readln;
end.
