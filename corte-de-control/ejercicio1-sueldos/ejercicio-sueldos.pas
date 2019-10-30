program Ejercicio1Sueldos;

uses crt;
var archivo: text;

procedure MostrarSueldos (var archivo:text);
	var sucursal,empleado,sucAnterior:integer;
		 sueldo,sumaSueldos:real;
	begin
	reset(archivo);
	readln(archivo, sucursal, empleado, sueldo);
	sucAnterior:= sucursal;
	sumaSueldos:=0;
	
	writeln('Reporte de sueldo');
	writeln('Sucursal ', sucursal);
	writeln;
	while not EOF(archivo) and (sucAnterior = sucursal) do
		begin
		writeln('Codigo empleado: ', empleado,' - Sueldo: ', sueldo:0:2);
		sumaSueldos:= sumaSueldos + sueldo;		
		readln(archivo,sucursal,empleado,sueldo);
		
		if (sucAnterior <> sucursal) then
			begin
			writeln;
			writeln('Total sucursal: ', sumaSueldos:0:2);
			sucAnterior:= sucursal;
			sumaSueldos:=0;
			writeln;
			writeln('Reporte de sueldo');
			writeln('Sucursal ', sucursal);
			end;
		end;
		
		writeln('Codigo empleado: ', empleado,' - Sueldo: ', sueldo:0:2);
		sumaSueldos:= sumaSueldos + sueldo;		
		writeln;
		writeln('Total sucursal: ', sumaSueldos:0:2);
		close(archivo);
	end;

BEGIN
assign(archivo,'sueldos.txt');
MostrarSueldos(archivo);	
END.
