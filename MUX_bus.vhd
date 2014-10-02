---------------------------------------------------------------------- 
-- © Universidad Politecnica de Madrid 
-- Se permite copia para fines de estudio 
----------------------------------------------------------------------
-- 
-- Proyecto           : Practica final
-- Diseno             : Mux de 2 entradas con número de bits parametrizado - Reusable 
-- Nombre del fichero : mux_bus.vhd
-- Autor              : Jorge Gonzalez Valencia 
-- Fecha              : 24/09/2014 
-- Version            : V1.0 
-- Resumen            : Este fichero contiene la entidad y arquitectura Tipo de datos I/O: UNSIGNED y control: STD_LOGIC_1164. Parametro GENERICO: num_bits
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

-- Modelo de entidad
ENTITY MUX_bus IS
GENERIC(num_bits: IN POSITIVE:=4);
PORT(	control					: IN STD_LOGIC;
		data_in0,data_in1		: IN UNSIGNED((num_bits-1) DOWNTO 0);
		data_out 				: OUT UNSIGNED((num_bits-1) DOWNTO 0));
END MUX_bus;

-- Modelo de arquitectura de comportamiento
ARCHITECTURE simple OF mux_bus IS
BEGIN
	PROCESS (data_in0, data_in1, control)
	BEGIN
		IF control = '0' THEN data_out <= data_in0;
			ELSE data_out <= data_in1;
		END IF;
	END PROCESS;
END simple;


