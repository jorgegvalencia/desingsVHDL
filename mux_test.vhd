---------------------------------------------------------------------- 
-- © Universidad Politecnica de Madrid 
-- Se permite copia para fines de estudio 
----------------------------------------------------------------------
-- 
-- Proyecto           : Practica final
-- Diseno             : Mux de 2 entradas con número de bits parametrizado - Reusable 
-- Nombre del fichero : nombre.vhd
-- Autor              : Jorge Gonzalez Valencia 
-- Fecha              : 24/09/2014 
-- Version            : V1.0 
-- Resumen            : Este fichero contiene el modelo para test
-- 
-- 
-- Modificaciones: 
-- 
-- Fecha        Autor        Version         Descripcion del cambio 
----------------------------------------------------------------------

-- Definición de librerias y paquetes
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Modelo de entidad vacia
ENTITY test_mux_bus IS

END test_mux_bus;


-- Modelo de arquitectura
ARCHITECTURE test_mux_bus_arq OF test_mux_bus IS

-- Declaracion de componentes
COMPONENT mux_bus
GENERIC (num_bits: POSITIVE:=3);
PORT(	control				: IN STD_LOGIC:= '0';
		data_in0,data_in1	: IN UNSIGNED((num_bits-1) DOWNTO O);
		data_out 			: OUT UNSIGNED((num_bits-1) DOWNTO 0);
END COMPONENT;

CONSTANT ciclo: TIME:= 10 ns;
SIGNAL selector_entrada: STD_LOGIC:='0';
SIGNAL data_entrada0, data_entrada1	:	UNSIGNED(2 DOWNTO 0);
SIGNAL salida 	:	UNSIGNED(2 DOWNTO 0);

BEGIN
selector_entradal <= NOT selector_entrada AFTER ciclo/2;

PROCESS
BEGIN
FOR i IN 0 TO 7 LOOP
	dato_entrada0 <= TO_UNSIGNED(j,3);
	WAIT FOR ciclo;
END LOOP;
END PROCESS;

U1: mux_bus GENERIC MAP (num_bits =>3)
	PORT MAP (control = selector_entrada, data_in0 = dato_entrada0, data_in1 => data_entrada1, data_out => salida);

END test_mux_bus_arq;