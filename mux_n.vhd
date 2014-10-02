---------------------------------------------------------------------- 
-- © Universidad Politecnica de Madrid 
-- Se permite copia para fines de estudio 
----------------------------------------------------------------------
-- 
-- Proyecto           : Guia Veribest 
-- Diseno             : Puerta and de dos entradas 
-- Nombre del fichero : mux_n 
-- Autor              : Jorge Gonzalez Valencia 
-- Fecha              : 24/09/2014 
-- Version            : 1.0 
-- Resumen            : Este fichero contiene la entidad de un multiplexor generico
-- 
-- 
-- Modificaciones: 
-- 
-- Fecha        Autor        Version         Descripcion del cambio 
----------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX_bus IS
PORT (num_bits: IN POSITIVE);
PORT(sel: IN STD_LOGIC;
	E1,E0: IN UNSIGNED(()num_bits-1) DOWNTO O);
	sal OUT UNSIGNED((num_bits-1) DOWNTO 0);
END mux_n;


ARCHITECTURE simple OF mux_n IS
BEGIN
	PROCESS ()
	BEGIN
		IF sel = '0' THEN sal <= E0;
			ELSE sal <= E1;
		END IF;
		WAIT ON E0, E1, sel;
	END PROCESS;
END simple


