program deret_bilangan;
uses crt;

var
  n, i: integer;

{ Fungsi deret a: menghitung suku ke-x pada deret Fibonacci }
function deret_a(x: integer): longint;
var
  k: integer;
  a, b, c: longint;
begin
  if (x = 1) or (x = 2) then
    deret_a := 1
  else
  begin
    a := 1;
    b := 1;
    for k := 3 to x do
    begin
      c := a + b;
      a := b;
      b := c;
    end;
    deret_a := b;
  end;
end;

{ Fungsi deret b: menghitung suku ke-x pada deret kelipatan 2 (2^(x-1)) }
function deret_b(x: integer): longint;
var
  k: integer;
  hasil: longint;
begin
  hasil := 1;
  for k := 2 to x do
    hasil := hasil * 2;
  deret_b := hasil;
end;

{ Fungsi deret c: menghitung suku ke-x dengan rumus kuadrat (x * x) }
function deret_c(x: integer): longint;
begin
  deret_c := x * x;
end;

{ Fungsi deret d: menghitung suku ke-x dengan rumus x * (x + 1) }
function deret_d(x: integer): longint;
begin
  deret_d := x * (x + 1);
end;

begin
  clrscr;
  { Input jumlah suku (N) yang ingin ditampilkan }
  readln(n);
  writeln;

  { Cetak deret a sebanyak N suku }
  for i := 1 to n do
  begin
    write(deret_a(i));
    if i < n then
      write(', ');
  end;
  writeln;

  { Cetak deret b sebanyak N suku }
  for i := 1 to n do
  begin
    write(deret_b(i));
    if i < n then
      write(', ');
  end;
  writeln;

  { Cetak deret c sebanyak N suku }
  for i := 1 to n do
  begin
    write(deret_c(i));
    if i < n then
      write(', ');
  end;
  writeln;

  { Cetak deret d sebanyak N suku }
  for i := 1 to n do
  begin
    write(deret_d(i));
    if i < n then
      write(', ');
  end;
  writeln;

  readln;
end.