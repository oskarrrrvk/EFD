with EFD;
with System;

procedure main is
    pragma Priority(System.Priority'First);
begin
    EFD.idle;
end main;
