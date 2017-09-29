program adv;
uses StrUtils;

var
a,c: string;
t,d: TextFile;

begin
  assign (t, 'tags.txt');   {*Current tag list*}
  assign (d, 'dictionary.txt');   {*advertisement*}
  reset(t);
  reset(d);
  while not eof (t) do
    begin
      readln (t,a);
      while not eof (d) do

        begin
          readln(d,c);
          if AnsiStartsText(a,c) then

            begin
             c:=ReplaceStr(c,a,'');
              Writeln(c);
              exit;
            end;
        end;
        reset(d);
    end;
end.
