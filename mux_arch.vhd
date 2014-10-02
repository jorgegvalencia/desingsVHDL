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
ENTITY test IS

END test;


-- Modelo de arquitectura
ARCHITECTURE test_arch OF mux_bus IS

-- Declaracion de componentes
mux_3 COMPONENT mux_bus
GENERIC (num_bits: POSITIVE:=3);
PORT(	control				: IN STD_LOGIC;
		data_in0,data_in1	: IN UNSIGNED((num_bits-1) DOWNTO O);
		data_out 			: OUT UNSIGNED((num_bits-1) DOWNTO 0);
END COMPONENT mux_3

SIGNAL control	:	STD_LOGIC;
SIGNAL data_in0	:	UNSIGNED((num_bits-1) DOWNTO 0);
SIGNAL data_in1	:	UNSIGNED((num_bits-1) DOWNTO 0);
SIGNAL data_out :	UNSIGNED((num_bits-1) DOWNTO 0);



BEGIN




END test_arch