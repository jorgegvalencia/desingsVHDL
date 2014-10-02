---------------------------------------------------------------------- 
-- © Universidad Politecnica de Madrid 
-- Se permite copia para fines de estudio 
----------------------------------------------------------------------
-- 
-- Proyecto           : Practica final
-- Diseno             : Registro paralelo/paralelo con n√∫mero de bits parametrizado - Reusable
-- Nombre del fichero : reg_pp_algorithm.vhd
-- Autor              : Jorge Gonzalez Valencia 
-- Fecha              : 01/10/2014 
-- Version            : V1.0 
-- Resumen            : Este fichero contiene la entidad y arquitectura Tipo de datos I/O: UNSIGNED y control: STD_LOGIC_1164. 
-- Parametro GENERICO: num_bits
-- 
-- Modificaciones: 
-- 
-- Fecha        Autor        Version         Descripcion del cambio 
----------------------------------------------------------------------

-- Definicion de librerias y paquetes
LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Modelo de entidad
ENTITY reg_pp_algorithm IS
GENERIC(num_bits: IN POSITIVE);
PORT(		data_in 				: IN UNSIGNED((num_bits-1) DOWNTO 0);
		data_out 				: OUT UNSIGNED((num_bits-1) DOWNTO 0);
		clk_ri				: IN STD_LOGIC;
		rst_n					: IN STD_LOGIC;
		enable_e				: IN STD_LOGIC);
END reg_pp_algorithm;

-- Modelo de arquitectura de comportamiento
ARCHITECTURE behavior OF reg_pp_algorithm IS
BEGIN
	PROCESS (data_in, clk_ri, rst_n, enable_e)
	BEGIN
	IF rst_n='0' THEN
		data_out <= (OTHERS => '0');
	ELSIF RISING_EDGE(clk_ri) THEN
		IF enable_e = '1' THEN
			data_out <= data_in;
		END IF;
	END IF;
	END PROCESS;
END behavior;

--		data_out <= (OTHERS =>'0') WHEN rst_n ='0';
--		data_out <= data_in WHEN rst_n = '1' AND enable_e = '1'  AND RISING_EDGE(clk_ri);

--		IF rst_n = '0' THEN 
-- 			data_out <= (OTHERS =>'0');
-- 		ELSIF rst_n = '1' AND enable_e = '1'  AND RISING_EDGE(clk_ri) THEN
-- 			data_out <= data_in;
-- 		ELSE
-- 			null;
-- 		END IF;

