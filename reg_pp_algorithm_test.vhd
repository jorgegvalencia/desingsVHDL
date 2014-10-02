---------------------------------------------------------------------- 
-- © Universidad Politecnica de Madrid 
-- Se permite copia para fines de estudio 
----------------------------------------------------------------------
-- 
-- Proyecto           : Practica final
-- Diseno             : Registro paralelo/paralelo con nÃºmero de bits parametrizado - Reusable
-- Nombre del fichero : reg_pp_algorithm_test.vhd
-- Autor              : Jorge Gonzalez Valencia 
-- Fecha              : 01/10/2014 
-- Version            : V1.0 
-- Resumen            : Este fichero contiene la entidad y arquitectura del modelo de test Tipo de datos I/O: UNSIGNED y control: STD_LOGIC_1164. 
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

-- Modelo de entidad vacia
ENTITY reg_pp_algorithm_test IS

END reg_pp_algorithm_test;

-- Modelo de arquitectura
ARCHITECTURE reg_pp_algorithm_test_arq OF reg_pp_algorithm_test IS

-- Declaracion de componentes
COMPONENT reg_pp_algorithm
GENERIC (num_bits: POSITIVE:=4);
PORT(	data_in 				: IN UNSIGNED((num_bits-1) DOWNTO 0);
		data_out 				: OUT UNSIGNED((num_bits-1) DOWNTO 0);
		clk_ri					: IN STD_LOGIC;
		rst_n					: IN STD_LOGIC;
		enable_e				: IN STD_LOGIC);
END COMPONENT;

CONSTANT ciclo: TIME:= 7 ns;
SIGNAL clock: STD_LOGIC:='0';
SIGNAL enable: STD_LOGIC;
SIGNAL reset: STD_LOGIC;
SIGNAL datos_in, datos_out : UNSIGNED(3 DOWNTO 0);

BEGIN

clock <= NOT clock AFTER ciclo/2;
reset <= '1','0' AFTER 66.5 NS, '1' AFTER 77 NS;
enable <= '1','0' AFTER 56 NS, '1' AFTER 70 NS;

PROCESS
BEGIN
FOR i IN 0 TO 15 LOOP
	datos_in <= TO_UNSIGNED(i,4);
	WAIT FOR ciclo;
END LOOP;
END PROCESS;

U1: reg_pp_algorithm GENERIC MAP (num_bits =>4)
	PORT MAP (data_in => datos_in, data_out => datos_out, clk_ri => clock, rst_n => reset , enable_e => enable);

END reg_pp_algorithm_test_arq;