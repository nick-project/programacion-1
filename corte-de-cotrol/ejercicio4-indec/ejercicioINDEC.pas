program Ejercicio4INDEC.pas;
uses crt;
var archivo:text; 

procedure MostrarRegistroINDEC (var archivo:text);
	var provincia,ciudad,varones,mujeres,desocupados:longInt;
 		provinciaAnterior, contadorDesocupados, contadorDesocupadosAnterior:longInt;
 		guardarProvincia:integer;
 				
	begin
	reset(archivo);
	readln(archivo,provincia,ciudad,varones,mujeres,desocupados);
	provinciaAnterior:= provincia;
	contadorDesocupados:= 0;
	contadorDesocupadosAnterior:= 0;
	guardarProvincia:= 0; 
	
	writeln('PROVINCIA: ', provincia);
	while not EOF(archivo) and (provinciaAnterior = provincia) do
 		begin
 		writeln('Ciudad: ', ciudad,' ',' Varones: ',varones,' Mujeres: ',mujeres,' Desocupados: ',desocupados);
 		contadorDesocupados:= contadorDesocupados + desocupados;
 		readln(archivo, provincia, ciudad, varones, mujeres, desocupados);
 				
 		if (provinciaAnterior <> provincia) then
 			begin	
 			if (contadorDesocupados > contadorDesocupadosAnterior) then
 					begin
 					guardarProvincia:= provinciaAnterior;
 					contadorDesocupadosAnterior:= contadorDesocupados;
 					contadorDesocupados:= 0;
 					end;					
				contadorDesocupados:= 0;
				provinciaAnterior:= provincia;
				writeln;
				writeln('PROVINCIA: ', provincia);
 			end;
		end;
		
 		writeln('Ciudad: ', ciudad,' ',' Varones: ',varones,' Mujeres: ',mujeres,' Desocupados: ',desocupados);
 		contadorDesocupados:= contadorDesocupados + desocupados;
 		
 		if (contadorDesocupados > contadorDesocupadosAnterior) then
			guardarProvincia:= provincia;	
 		writeln;
 		writeln('Provincia con mayor desocupados: ', guardarProvincia);
 end;

BEGIN
assign(archivo,'poblacion.txt');
MostrarRegistroINDEC(archivo);
END.
