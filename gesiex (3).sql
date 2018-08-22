-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-08-2018 a las 14:30:29
-- Versión del servidor: 5.5.40
-- Versión de PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gesiex`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `clave_usuario`(IN `usuario` VARCHAR(6))
    NO SQL
select pass, id from user where cod=usuario$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `count_infractores`()
BEGIN
select count(*) from persona; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `count_merca`()
BEGIN
	select count(*) from mercancia;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `count_noticias`()
BEGIN
	select count(*) from intervencion;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `delito`()
BEGIN
	select id_delito, nom_delito from delito; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `diario`()
BEGIN
	select id_diario, nombre from diario; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `IdTipoInfractor2`(
in nombre char(20)
)
BEGIN
	select id_tipoin from tipo_infractor where tipo_infractor.nombre = nombre; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `intervencion`(
in id_intervencion int(15),
in fecha date,
in lugar int(15),
in titulo text,  
in resumen longtext
)
BEGIN
insert into gesiex.intervencion ( id_intervencion, fecha, lugar, titulo, resumen) values (`id_intervencion`,`fecha` ,`lugar`,`titulo`,`resumen` );
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `intervencion_del_int_fuen`(
in id_intervencion int (15),
in fecha date,
in lugar varchar (30),
in titulo text, 
in resumen longtext,
in id_inde int (15),
in id_delito int(15),
in id_int int(15),
in id_interventor int (15),
in id_intermercancia int (15),
in id_mercancia int(15),
in id_intervehiculo int (15),
in id_vehiculo int (15)
)
BEGIN
	start transaction ; 
	
	insert into gesiex.intervencion (id_intervencion, fecha, lugar, titulo,resumen) values (`id_intervencion`,`fecha`,`lugar`,`titulo`,`resumen`);
	insert into gesiex.inter_delito (id_inde, id_intervencion, id_delito) values(`id_inde`,`id_intervencion`,`id_delito`);
	insert into gesiex.inter_inter(id_int,id_intervencion, id_interventor) Values (`id_int`,`id_intervencion`,`id_interventor`);
	insert into gesiex.inter_mercancia(id_intermercancia,id_intervencion, id_mercancia) values(`id_intermercancia`, `id_intervencion`,`id_mercancia`);
	insert into gesiex.inter_vehiculo(id_intervehiculo,id_intervencion,id_vehiculo) values(`id_intervehiculo`,`id_intervencion`,`id_vehiculo`);

END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `interventor`()
BEGIN
	select id_interventor, nom_interventor from interventor; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `inter_delito`(
in id_intervencion int (15), 
in fecha date, 
in lugar int(15),
in titulo text,
in resumen longtext,
in id_inde int(15),
in id_delito int (15)
)
BEGIN
START TRANSACTION;

    INSERT INTO gesiex.intervencion (id_intervencion,fecha, lugar, titulo,resumen) VALUES(`id_intervencion`,`fecha`,`lugar`,`titulo`,`resumen`);
    INSERT INTO gesiex.inter_delito (id_inde, id_intervencion,id_delito) VALUES(`id_inde`,`id_intervencion`,`id_delito`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `inter_delito_inter`(
in id_intervencion int (15), 
in fecha date, 
in lugar int(15),
in titulo text,
in resumen longtext,
in id_inde int(15),
in id_delito int (15),
in id_int int(15),
in id_interventor int(15)

)
BEGIN
START TRANSACTION;

    INSERT INTO gesiex.intervencion (id_intervencion,fecha, lugar, titulo,resumen) VALUES(`id_intervencion`,`fecha`,`lugar`,`titulo`,`resumen`);
    INSERT INTO gesiex.inter_delito (id_inde, id_intervencion,id_delito) VALUES(`id_inde`,`id_intervencion`,`id_delito`);
	INSERT INTO gesiex.inter_inter (id_int, id_intervencion, id_interventor) values (`id_int`,`id_intervencion`,`id_interventor`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `item_mercancia`()
BEGIN
	select id_item, nombre from item_mercancia; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_empresa`(
in id_empresa int(15),
in nom_empresa varchar(40),
in nacionalidadd int (15),
in rubro varchar (50),
in ruc int(12)
)
BEGIN
insert into `gesiex`.`empresa` (id_empresa,nom_empresa, nacionalidadd, rubro, ruc) 
values(`id_empresa`,`nom_empresa`,`nacionalidadd`,`rubro`,`ruc`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_infempresa`(
	in id_iempresa int(15),
	in id_empresa int(15),
	in id_intervencion int(15)
)
BEGIN
	insert into `gesiex`.`inf_empresa` (id_iempresa, id_empresa, id_intervencion) 
	values(`id_iempresa`,`id_empresa`,`id_intervencion`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_infpersona`(
in id_ipersona int(15),
in id_persona int(15),
in id_intervencion int (15),
in tipo_infractor int(15)
)
BEGIN
insert into `gesiex`.`inf_persona` (id_ipersona, id_persona,id_intervencion,tipo_infractor) 
values(`id_ipersona`,`id_persona`,`id_intervencion`,`tipo_infractor`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_interdelito`(
in id_inde int(15),
in id_intervencion int (15),
in id_delito int (15)
)
BEGIN
insert into gesiex.inter_delito (id_inde, id_intervencion,id_delito)
 values (`id_inde`,`id_intervencion`, `id_delito`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_interinter`(
in id_int int(15),
in id_intervencion int (15),
in id_interventor int (15)
)
BEGIN
insert into `gesiex`.`inter_inter`(id_int,id_intervencion, id_interventor) 
values(`id_int`,`id_intervencion`,`id_interventor`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_intervencion_fuente`(
in id_intervencionn int (15), 
in fecha date, 
in lugar varchar (30),
in titulo text, 
in resumen longtext,
in id_fuente int(15),
in diario int(15),
in pagina int(15),
in link text 
)
BEGIN
START TRANSACTION;
	insert into gesiex.intervencion (id_intervencion, fecha, lugar, titulo, resumen) values (`id_intervencionn`,`fecha`,`lugar`,`titulo`,`resumen`);
	insert into gesiex.fuente(id_fuente,id_intervencion,diario,pagina,link) values (`id_fuente`,`id_intervencionn`,`diario`,`pagina`,`link`);
end$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_mercancia`(
in id_mercancia int(15),
in id_intervencion int(15),
in item int(15),
in cantidad float,
in id_moneda int(15),
in valor float
)
BEGIN
insert into `gesiex`.`mercancia` (id_mercancia, id_intervencion, item, cantidad, id_moneda,valor) 
values(`id_mercancia`,`id_intervencion`,`item`,`cantidad`,`id_moneda`,`valor`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_persona`(
in id_persona int(15),
in nombres char(50),
in apellidos char(60),
in alias char(30),
in edad int(3),
in nacionalidad int(16),
in organizacion char(60),
in dni int(8)
)
BEGIN
	insert into `gesiex`.`persona`(id_persona, nombres, apellidos, alias, edad, nacionalidad, organizacion, dni) 
values (`id_persona`,`nombres`,`apellidos`,`alias`,`edad`,`nacionalidad`,`organizacion`,`dni` );
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `i_vehiculo`(
in id_vehiculo int(15),
in id_intervencion int(15),
in tipo_vehiculo int(15),
in marca int(15),
in placa varchar(30),
in caractersiticas text
)
BEGIN
insert into `gesiex`.`vehiculo` (id_vehiculo, id_intervencion, tipo_vehiculo, marca, placa, caracteristicas) 
values(`id_vehiculo`,`id_intervencion`,`tipo_vehiculo`,`marca`,`placa`,`caracteristicas`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `lugar`()
BEGIN
	select id_lugar, lugar from lugar;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `marca`()
BEGIN
	select id_marca, nombre from marca; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `moneda`()
BEGIN
	select id_moneda, nombre from moneda; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `MostrarTituloNot`()
BEGIN
	select titulo, fecha from intervencion ORDER BY fecha DESC LIMIT 10;

END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `MostrarUltimaMerca`()
BEGIN
	select   nombre, cantidad, nombre_unidad from mercancia inner join item_mercancia
	on mercancia.item = item_mercancia.id_item inner join unidad
	on mercancia.unidad = unidad.id_unidad

	ORDER BY id_mercancia DESC LIMIT 10;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_delito`()
BEGIN
select nom_delito from delito; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_diario`()
BEGIN
select nombre from diario; 

END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_IdTipoInfractor`(
in tipo_infractor char(20)
)
BEGIN
 select id_tipoin from tipo_infractor
where tipo_infractor.nombre = tipo_infractor; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_interventor`()
BEGIN
select nom_interventor from interventor;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_item`()
BEGIN
	select nombre from item_mercancia;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_lugar`()
BEGIN
select lugar from lugar;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_marca`()
BEGIN
select nombre from marca;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_moneda`()
BEGIN
	select nombre from moneda;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_nacionalidad`()
BEGIN
	select nombre from pais;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_tinfractor`()
BEGIN
select nombre from tipo_infractor;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_tvehiculo`()
BEGIN
	select nombre from tipo_vehiculo;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `m_unidad`()
BEGIN
	select nombre_unidad from unidad; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `nombre_usuario`(IN `id_usua` INT)
    NO SQL
select nombre from user where id=id_usua$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `p`(IN `id` INT(15), IN `nombre` CHAR(50), IN `edad` INT(3))
BEGIN
insert into gesiex.prueba values (`id`,`nombre`,`edad`);
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `pais`()
BEGIN
	select id_pais, nombre from pais; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `tipo_infractor`()
BEGIN
	select id_tipoin, nombre from tipo_infractor;
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `tipo_vehiculo`()
BEGIN
	select id_tipovehiculo, nombre from tipo_vehiculo; 
END$$

CREATE DEFINER=`usr_gesiex`@`%` PROCEDURE `unidad`()
BEGIN
	select id_unidad, nombre_unidad from unidad; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delito`
--

CREATE TABLE IF NOT EXISTS `delito` (
`id_delito` int(10) NOT NULL,
  `nom_delito` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `delito`
--

INSERT INTO `delito` (`id_delito`, `nom_delito`) VALUES
(1, 'Contrabando'),
(2, 'Drogas'),
(3, 'Dinero no declarado'),
(4, 'Lavado de activos'),
(5, 'Requisitoria'),
(6, 'Tráfico de migrantes'),
(7, 'Evasión del control migratorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diario`
--

CREATE TABLE IF NOT EXISTS `diario` (
`id_diario` int(15) NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `diario`
--

INSERT INTO `diario` (`id_diario`, `nombre`) VALUES
(1, 'Correo'),
(2, 'Sin Fronteras'),
(3, 'Caplina'),
(4, 'La Estrella de Arica'),
(5, 'La República'),
(6, 'El Comercio'),
(7, 'El Peruano'),
(8, 'Gestión '),
(9, 'Caretas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`id_empresa` int(15) NOT NULL,
  `nom_empresa` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nacionalidadd` int(15) NOT NULL,
  `rubro` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nom_empresa`, `nacionalidadd`, `rubro`, `ruc`) VALUES
(5, 'Grupo 5', 1, 'Entretenimiento', NULL),
(6, 'Cruz del Sur', 1, 'Transporte', NULL),
(7, 'bitel', 1, 'cel', NULL),
(42, 'misti ', 7, 'sushi', '78945612398'),
(43, '', 1, '', ''),
(44, '', 1, '', ''),
(45, '', 1, '', ''),
(46, '', 1, '', ''),
(47, '', 1, '', ''),
(48, '', 1, '', ''),
(49, '', 1, '', ''),
(50, '', 1, '', ''),
(51, '', 1, '', ''),
(52, '', 2, '', ''),
(53, '', 1, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE IF NOT EXISTS `encuesta` (
`cod` int(11) NOT NULL,
  `registro` varchar(4) NOT NULL,
  `pregunta1` varchar(3) NOT NULL,
  `pregunta2` varchar(3) NOT NULL,
  `pregunta3` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`cod`, `registro`, `pregunta1`, `pregunta2`, `pregunta3`) VALUES
(11, '7288', 'SI', 'SI', 'Opt1'),
(16, '7288', 'SI', 'SI', 'Opt1'),
(17, '6693', 'SI', 'SI', 'Opt2'),
(18, '4311', 'SI', 'SI', 'Opt1'),
(19, '9566', 'SI', 'SI', 'Opt2'),
(20, '4456', 'NO', 'SI', 'Opt1'),
(21, 'QJ01', 'NO', 'NO', 'Opt1'),
(22, '', 'SI', 'SI', 'Opt1'),
(23, '059A', 'SI', 'SI', 'Opt1'),
(24, '', 'SI', 'NO', 'Opt2'),
(25, '5391', 'SI', 'NO', 'No'),
(26, 'AI03', 'SI', 'NO', 'Opt1'),
(27, '9754', 'SI', 'SI', 'Opt1'),
(28, '7599', 'SI', 'SI', 'Opt1'),
(29, '', 'SI', 'SI', 'Opt1'),
(30, '7429', 'SI', 'SI', 'Opt1'),
(31, 'AL91', 'SI', 'SI', 'Opt1'),
(32, 'AF50', 'SI', 'SI', 'Opt2'),
(33, '8046', 'SI', 'SI', 'Opt1'),
(34, 'SI77', 'SI', 'SI', 'Opt2'),
(35, '7698', 'SI', 'SI', 'Opt1'),
(36, '3317', 'NO', 'SI', 'Opt1'),
(37, '', 'SI', 'SI', 'Opt2'),
(38, '8337', 'NO', 'NO', 'No'),
(39, '9608', 'SI', 'NO', 'Opt1'),
(40, 'SI81', 'SI', 'SI', 'Opt2'),
(41, '8073', 'SI', 'SI', 'Opt1'),
(42, '9780', 'SI', 'SI', 'Opt1'),
(43, 'SJ72', 'SI', 'SI', 'Opt2'),
(44, '9706', 'SI', 'NO', 'No'),
(45, '8050', 'SI', 'SI', 'Opt1'),
(46, '9455', 'NO', 'NO', 'No'),
(47, '5474', 'SI', 'SI', 'Opt1'),
(48, '9631', 'SI', 'SI', 'Opt1'),
(49, '5644', 'NO', 'NO', 'No'),
(50, 'af71', 'SI', 'SI', 'Opt2'),
(51, '', 'NO', 'SI', 'Opt2'),
(52, '', 'SI', 'SI', 'Opt1'),
(53, '6691', 'NO', 'NO', 'No'),
(54, '9753', 'NO', 'NO', 'No'),
(55, '', 'SI', 'SI', 'Opt2'),
(56, '', 'SI', 'SI', 'Opt1'),
(60, 'SJ76', 'SI', 'NO', 'Opt1'),
(61, 'SI53', 'NO', 'NO', 'No'),
(62, '', 'SI', 'NO', 'No'),
(63, '5382', 'SI', 'SI', 'Opt2'),
(64, '', 'SI', 'SI', 'Opt1'),
(65, 'SI79', 'SI', 'SI', 'Opt1'),
(67, '8950', 'SI', 'SI', 'Opt2'),
(68, '8950', 'SI', 'SI', 'Opt2'),
(69, '7319', 'SI', 'NO', 'No'),
(70, '', 'SI', 'SI', 'Opt1'),
(71, '9531', 'SI', 'SI', 'Opt2'),
(72, '6986', 'SI', 'NO', 'No'),
(73, '9449', 'SI', 'SI', 'Opt1'),
(74, '5824', 'NO', 'NO', 'No'),
(75, '8980', 'SI', 'SI', 'Opt1'),
(76, '', 'SI', 'SI', 'Opt1'),
(81, '7698', 'SI', 'SI', 'Opt1'),
(82, '', 'SI', 'SI', 'Opt1'),
(83, '9589', 'SI', 'SI', 'Opt1'),
(84, '9643', 'NO', 'NO', 'No'),
(85, '8275', 'NO', 'NO', 'No'),
(86, '', 'NO', 'NO', 'No'),
(87, '9739', 'NO', 'NO', 'No'),
(88, '9748', 'SI', 'SI', 'Opt2'),
(89, '9725', 'SI', 'NO', 'No'),
(90, '4727', 'SI', 'SI', 'Opt1'),
(91, '2839', 'NO', 'NO', 'No'),
(92, '5559', 'NO', 'NO', 'No'),
(93, '', 'SI', 'SI', 'Opt1'),
(94, '', 'SI', 'SI', 'Opt1'),
(95, '9749', 'SI', 'SI', 'Opt2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente`
--

CREATE TABLE IF NOT EXISTS `fuente` (
`id_fuente` int(15) NOT NULL,
  `id_intervencion` int(15) NOT NULL,
  `diario` int(15) NOT NULL,
  `pagina` int(5) DEFAULT NULL,
  `link` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fuente`
--

INSERT INTO `fuente` (`id_fuente`, `id_intervencion`, `diario`, `pagina`, `link`) VALUES
(1, 2, 1, 6, 'http://ediciondigital.diariocorreo.pe/tacna/20180102\r\n'),
(2, 3, 1, 4, 'http://ediciondigital.diariocorreo.pe/tacna/20180104/#!/pagina/4\r\n\r\n'),
(3, 4, 2, 9, 'http://digital.diariosinfronteras.pe/diarios/Tacna/2018/01/05/index.html#page/9 \r\n'),
(4, 5, 1, 5, 'http://ediciondigital.diariocorreo.pe/tacna/20180105/#!/pagina/5\r\n'),
(6, 6, 1, 6, 'http://ediciondigital.diariocorreo.pe/tacna/20180108/#!/pagina/6\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_empresa`
--

CREATE TABLE IF NOT EXISTS `inf_empresa` (
`id_iempresa` int(15) NOT NULL,
  `id_empresa` int(15) NOT NULL,
  `id_intervencion` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inf_empresa`
--

INSERT INTO `inf_empresa` (`id_iempresa`, `id_empresa`, `id_intervencion`) VALUES
(1, 5, 3),
(2, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_persona`
--

CREATE TABLE IF NOT EXISTS `inf_persona` (
`id_ipersona` int(15) NOT NULL,
  `id_persona` int(15) NOT NULL,
  `id_intervencion` int(15) NOT NULL,
  `tipo_infractor` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inf_persona`
--

INSERT INTO `inf_persona` (`id_ipersona`, `id_persona`, `id_intervencion`, `tipo_infractor`) VALUES
(1, 1, 5, 1),
(2, 2, 6, 1),
(3, 68, 3, 3),
(4, 3, 2, 1),
(5, 3, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
`cod` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `registro` char(4) NOT NULL,
  `UO` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`cod`, `nombre`, `apellido`, `registro`, `UO`, `email`) VALUES
(1, 'Practicante OCG', '', 'SO02', '3G0010', '@hotmail.com'),
(3, 'silvana', 'cabana', 'SJ76', '3G0010', 'zbcabana@gmail.com'),
(4, 'silvana', 'cabana', 'SJ76', '3G0010', 'zbcabana@gmail.com'),
(16, 'silvana', 'cabana', 'SJ15', '3G0010', 'zbcabana@gmail.com'),
(17, 'silvana', 'cabana', 'SJ15', '3G0010', 'zbcabana@gmail.com'),
(18, 'silvana', 'cabana', 'SJ17', '3G0010', 'zbcabana@gmail.com'),
(19, 'silvana', 'cabana', 'SJ17', '3G0010', 'zbcabana@gmail.com'),
(20, 'silvana', 'cabana', 'SJ17', '3G0010', 'zbcabana@gmail.com'),
(21, 'silvana', 'cabana', 'SJ17', '3G0010', 'zbcabana@gmail.com'),
(55, '1', '2', '3', '4', '5@ee.com'),
(56, 'ss', 'ss', 'ss', 'ss', 'sss'),
(57, '', '', '', '', ''),
(58, 'ee', 'ee', 'ee', 'ee', 'ee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intervencion`
--

CREATE TABLE IF NOT EXISTS `intervencion` (
`id_intervencion` int(15) NOT NULL,
  `fecha` date NOT NULL,
  `lugar` int(15) NOT NULL,
  `titulo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `resumen` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `delito` int(15) DEFAULT NULL,
  `interventor` int(15) DEFAULT NULL,
  `fuente` int(11) NOT NULL,
  `pagina` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `eliminado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `intervencion`
--

INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(2, '2018-01-01', 1, 'Abandonan prendas de contrabando en chacras', 'Prendas de vestir importadas y nuevas por un valor de 7,680 dolares, halló la Policía de Carreteras, en chacras ubicadas cerca de la carretera de la Panamericana Sur. Todo lo incautado fue internado en el almacén aduanero de Tomasiri. ', 1, 7, 1, '', '', 1),
(3, '2018-02-04', 3, 'Minero chileno con 41kg de droga escondida en vehículo', 'Aduaneros chilenos intervinieron una camioneta que se dirigía de Tacna a Arica transportando 47 paquetes con  41.180 kg de marihuana Cripy. El vehículo pertenece a un minero de Antofagasta, quien había viajado a Tacna, donde habría modificado su unidad con compartimentos tipo "caleta". ', 2, 2, 1, '', '', 0),
(4, '2018-01-05', 12, 'Incautan ropa de contrabando ', 'La Policía de Carreteras y personal de SUNAT-ADUANAS Ilo llevaron a cabo el operativo Contrabando 2018.  Ante posible delito de contrabando, se procedió a la incautación de la mercadería en abandono, encontrada en el interior de un ómnibus, consistente en chompas y chalecos sintéticos y ropa de segundo uso valorizada en 6.220 soles', 1, 7, 1, '', '', 0),
(5, '2018-01-05', 1, 'Incautan auto partes por  700 mil', 'Un cargamento consistente en auto partes usados e importados de Asia, fue intervenido por personal de Deprove y luego internado en el almacén de la Intendencia de Aduana de Tacna, al detectarse irregularidades en los documentos que tenía el presunto dueño. Ruben Sosa Jichuña dijo ser propietario de la mercancía pero la DUA estaba a nombre de Alfredo Caso Fierro y la guía de remisión indicaba que la mercadería debía ser movilizada de Ilo a Lima.', 1, 1, 1, '', '', 0),
(6, '2018-01-08', 2, 'Intervienen a varón por intentar ingresar al país 25 mil dolares', 'Por el delito de lavado de activos es investigado Richard Willians Michel Cutipa por intentar  ingresar al país 25 mil 550 dólares sin declarar y adheridos al cuerpo. El detenido provenía de Santiago de Chile. Se determinó que los billetes incautados tenías adherencia de cocaína y por ende se tendrá que determinar si el dinero proviene del tráfico ilícito de drogas.', 4, 1, 1, '', '', 0),
(8, '2018-08-21', 3, 'En Chacalluta encontraron toda esta droga oculta al interior de un auto', 'En Chacalluta se logró detener a una banda criminal desdicada al tráfico de drogas. La detención se realizó en el marco de la operación "Gallos del Norte III" que estuvo a cargo de detectives de la Brigada Antinarcóticos y Contra el Crimen Organizado (Brianco). Desde la PDI se informó que lograron detener a una parte de una organización dedicada a la internación de importantes cantidades de droga a territorio nacional por el complejo fronterizo Chacalluta para su posterior comercialización. Se  logró la detención de un individuo de nacionalidad chilena, en circunstancias que ingresó al país por el citado complejo, transportando un total de 14 paquetes contenedores de cannabis sativa y seis paquetes con cocaína base, ocultos en la estructura de un vehículo particular, adaptado para tal efecto. Dicha sustancia fue incautada junto a otras especies y dinero asociado al delito. Fueron 10 kilos 640 gramos de cannabis sativa y cuatro kilos 490 gramos de cocaína base. El origen de la droga era Perú y su avalúo en caso de haberse logrado su comercialización supera la cifra de 120 millones de pesos.', 2, 2, 4, '5', 'http://www.estrellaarica.cl/impresa/2018/08/22/full/cuerpo-principal/4/', 0),
(9, '2018-08-22', 13, 'Detienen a dos sujetos con licores de contrabando', 'Moquegua. Dos sujetos fueron detenidos por agentes de la comisaría de Puquina, en la provincia General Sánchez Cerro, a bordo de dos camionetas que trasladaban un total de 16 cajas conteniendo botellas de licor de diferentes marcas de contrabando, por un valor comercial de 3 mil soles. Se trata de Edwin Pablo Colque Hilario(25) y Percy Antonio Delgado Larico(39), quienes conducían las camionetas de placas AHQ-890 y AEG-882, las mismas que se encontraban estacionadas en una vía de trocha carrozable y al notar la presencia policial emprendieron su huida con dirección a la localidad de Omate. En la ruta, los fugitivos optaron por ingresar al anexo de Huata, por lo que los policías solicitaron apoyo a la comisaría sectorial de Omate, logrando así la captura.', 1, 7, 2, '8', 'http://digital.diariosinfronteras.pe/diarios/Tacna/2018/08/22/#page/8', 0),
(10, '2018-01-04', 1, 'Minero chileno con 41kg de droga escondida en vehículo', 'Aduaneros chilenos intervinieron una camioneta que se dirigía de Tacna a Arica transportando 47 paquetes con  41.180 kg de marihuana Cripy. El vehículo pertenece a un minero de Antofagasta, quien había viajado a Tacna, donde habría modificado su unidad con compartimentos tipo "caleta". ', 2, 7, 1, '0', '0', 0),
(11, '2018-01-05', 1, 'Incautan ropa de contrabando ', 'La Policía de Carreteras y personal de SUNAT-ADUANAS Ilo llevaron a cabo el operativo Contrabando 2018.  Ante posible delito de contrabando, se procedió a la incautación de la mercadería en abandono, encontrada en el interior de un ómnibus, consistente en chompas y chalecos sintéticos y ropa de segundo uso valorizada en 6.220 soles', 2, 2, 1, '0', '0', 0),
(12, '2018-01-05', 1, 'Incautan autopartes por  700 mil soles', 'Un cargamento consistente en autopartes usados e importados de Asia, fue intervenido por personal de Deprove y luego internado en el almacén de la Intendencia de Aduana de Tacna, al detectarse irregularidades en los documentos que tenía el presunto dueńo. Ruben Sosa Jichuńa dijo ser propietario de la mercancía pero la DUA estaba a nombre de Alfredo Caso Fierro y la guía de remisión indicaba que la mercadería debía ser movilizada de Ilo a Lima.', 1, 7, 1, '0', '0', 0),
(13, '2018-01-08', 1, 'Intervienen a varón por intentar ingresar al país 25 mil dolares', 'Por el delito de lavado de activos es investigado Richard Willians Michel Cuitpa por intentar  ingresar al país 25 mil 550 dólares sin declarar y adheridos al cuerpo. El detenido provenía de Santiago de Chile. Se determinó que los billetes incautados tenías adherencia de cocaína y por ende se tendrá que determinar si el dinero proviene del tráfico ilícito de drogas.', 4, 1, 1, '5', '0', 0),
(14, '2018-01-09', 1, 'Hallan 12 kilos de alcaloide de cocaína', 'Policías del Departamento de Investigación Criminal en Moquegua, realizaron un operativo de identidad en hoteles. En uno de los locales lograron intervenir a dos hombres, quienes tenían entre sus pertenencias 12 paquetes tipo ladrillo de droga. Se comprobó que eran 12.300 Kg de alcaloide de cocaína. Se tiene información de inteligencia sobre que los narcotraficantes estarían utilizando esta ruta para llegar a Chile.', 1, 1, 1, '0', '0', 0),
(15, '2018-01-11', 1, 'Taxista intervenido con droga líquida en Chile', 'Chofer limeńo es intervenido en la frontera Perú - Chile por presunto delito de tráfico de drogas. Se le descubrió más de 3kg de cocaína líquida en su bolso de equipaje. Declaró que se dirigía a chile para hacer turismo.', 1, 1, 1, '0', '0', 0),
(16, '2018-01-12', 1, 'Cae narcotraficante de la lista de los más buscados', 'En operativo "Requisitorias 2018" fue capturado Jhair Túpac Amaru Ramos, requisitoriado por tráfico ilícito de drogas, quien se hallaba en la lista de los más buscados del Ministerio del Interior. ', 1, 1, 1, '0', '0', 0),
(17, '2018-01-16', 1, 'Peruanos iban a Chile con droga en salsas y prendas de vestir', 'Tres peruanos pretendían ingresar a Chile con droga fueron intervenidos. El primer caso fue protagonizado por el limeńo J.J.C.N. a quien un can puso al descubierto en su maleta 15 envases de distintas salsas que contenían cocaína líquida.', 1, 1, 1, '0', '0', 0),
(18, '2018-01-16', 1, 'Peruanos iban a Chile con droga en salsas y prendas de vestir', 'Tres peruanos pretendían ingresar a Chile con droga fueron intervenidos. En el segundo caso un chef peruano J.S.R.R. fue fiscalizado y en su ropa interior y zapatillas hallaron 5 paquetes con 1.460 kg de clorhidrato de cocaína.', 1, 1, 1, '0', '0', 0),
(19, '2018-01-16', 1, 'Peruanos iban a Chile con droga en salsas y prendas de vestir', 'Tres peruanos pretendían ingresar a Chile con droga fueron intervenidos. Finalmente interceptaron a un estudiante limeńo B.R.W. también con droga en su ropa interior y zapatillas, por 1.465 kg de  clorhidrato de cocaína.  Todos viajaban en taxis colectivos.', 1, 1, 1, '0', '0', 0),
(20, '2018-01-17', 1, 'En vehículo de Grupo 5 hallan licores importados sin declarar', 'Camión que transportaba los instrumentos de la orquesta Grupo 5 de Tacna a Ilo fue intervenido en el control aduanero Vila Vila con licores importados por la ZOFRA Tacna, pero sin el pago de impuestos. El vehículo quedó inmovilizado y tras la incautación de los licores prosiguió su viaje.', 1, 1, 1, '0', '0', 0),
(21, '2018-01-18', 1, 'Cae requisitoriado acusado de narcotráfico ', 'Robert Calderón fue capturado por la Policía Judicial por tener requisitoria por narcotráfico, además integraba la lista de las personas más buscadas a nivel nacional y era parte del Programa de Recompensas del Mininter.', 1, 1, 1, '0', '0', 0),
(22, '2018-01-19', 1, 'Cae mujer que abastecía droga a menores y adultos', 'Una mujer seńalada como la principal abastecedora de droga al menudeo entre los adultos y menores de edad en el sur del país, fue intervenida durante un operativo de la Policía Judicial. Delia Capaquera, que sería integrante de la banda de micro comercializadores de estupefacientes "Los Capaqueras". La mujer tenía dos requisitorias, una por delito de promoción o favorecimiento al tráfico ilícito de drogas solicitado por Juzgado Penal Supraprovincial de Tacna y la otra por el mismo delito solicitado por el Tercer Juzgado Supraprovincial de Arequipa.', 1, 1, 1, '0', '0', 0),
(23, '2018-01-20', 1, 'Hallan 17 kg de droga en bus de la ruta Lima-Santiago', 'Aduanas Chile y la Policía de Investigaciones intervinieron a un bus de la empresa Cruz del Sur, que cubría la ruta Lima - Santiago, con un cargamento de 17.360 kg de clorhidrato de cocaína. La droga estaba en 15 paquetes oculta en un compartimento tipo caleta del vehículo. Miembros de la tripulación quedaron con prisión preventiva.', 1, 1, 1, '0', '0', 0),
(24, '2018-01-21', 1, 'Incautan camión con contrabando por millón de soles cuando iba a Juliaca', 'Personal del Grupo Terna intervino un camión con presunto contrabando. La incautación se efectuó en la carretera Panamericana Norte. La mercadería tenía como destino la ciudad de Juliaca. La mayoría de los bienes contaba con el sello de la ZOFRATACNA pero que no había sido declarado. La mercadería fue ingresada al almacén de aduanas.', 1, 1, 1, '0', '0', 0),
(25, '2018-01-26', 1, 'Hallan contrabando de licores por S7. 15 mil ', 'Un cargamento de licores importados, que al parecer iban a ser llevados a Puno o Bolivia, fue abandonado en la carretera Tacna-Tarata. Agentes de3 la policía fiscal encontraron el cargamento al costado de la pista. Se incautó licores valorizados aproximadamente en S/. 15 mil y fueron enviados a los almacenes de Aduana de Tacna.', 1, 1, 1, '0', '0', 0),
(26, '2018-01-27', 1, 'Trasladan a requisitoriado por drogas', 'Agentes de Radiopatrulla intervinieron a Fabian Contreras, requisitoriado por el delito de tráfico ilícito de drogas en Ayacucho. Fue ubicado en el control policial de Camiara, tenía orden de captura en Ayacucho.', 1, 1, 1, '0', '0', 0),
(27, '2018-01-28', 1, 'Capturan a colombianos que llevaban droga camuflada', 'Dos colombianos fueron detenidos cuando trasladaban droga camuflada en dos coolers. Ambos se encontraban a bordo de un bus con destino a la ciudad de Chiclayo.', 1, 1, 2, '8', '0', 0),
(28, '2018-02-01', 1, 'Detienen a tres peruanas con droga cuando viajaban a Chile', 'Tres peruanas fueron intervenidas en  Chacalluta, cuando viajaban a Chile portando tarros de leche, donde ocultaron cocaína líquida. Las tres peruanas viajaban en distintos vehículos. Fueron intervenidas gracias al uso de perfiles de riesgo y tecnología no invasiva como la máquina de rayos X. La estudiante tacneńa llevaba 9 tarros de leche con 4.15 kg de cocaína, la comerciante limeńa poseía 12 tarros con 5.730 kg de cocaína, y la joven cusqueńa  con 12 tarros con 5.730 kg de cocaína.', 1, 1, 1, '0', '0', 0),
(29, '2018-02-02', 1, 'Cae con 4kg de cocaína en frascos de champu ', 'Un ciudadano peruano fue intervenido en Arica transportando droga en envases de champú, cuando pretendía viajar a Santiago. El presunto burrier llevaba equipaje de de mano, donde se halló 5 envases de champú, al revisar el interior de los envases, se encontró bolsas de nylon transparente conteniendo 4.310 kg de clorhidrato de cocaína.', 1, 1, 1, '0', '0', 0),
(30, '2018-02-07', 1, 'Hallan  24kg de droga en caleta de taxi ', 'Un cargamento de droga fue incautado por la Aduana de  Chile, tras la revisión de un taxi de servicio turístico que había partido desde Tacna con destino Chile. La mercancía consistente en 24 kilos de marihuana, estaba oculta en la estructura del vehículo en la modalidad "caleta".  El hallazgo se realizó con el uso de un can detector de droga, estableciéndose la presencia de 43 paquetes ocultos.', 1, 1, 1, '0', '0', 0),
(31, '2018-02-09', 1, 'Chilena pretendía llevar 4 kg de droga adherida a su cuerpo', 'La ciudadana chilena Carla Andrea Aranguiz Valenzuela fue capturada por agentes del Depanpro por presunto tráfico ilícito de droga, tras ser descubierta con más de 4 kg de alcaloide de cocaína oculta en su cuerpo, cuando se aprestaba a viajar a su país junto a la peruana Nathaly Angulo Palmeira. La intervención se realizó en el terminal terrestre Manuel A. Odría.', 1, 1, 1, '0', '0', 0),
(32, '2018-02-09', 1, 'Agentes incautaron dos vehículos y bultos con ropa usada traída desde Chile', 'Durante un operativo de represión al contrabando realizado por la Policía Fiscal en el sector Hospicio, presuntos contrabandistas arremetieron contra los agentes para tratar de recuperar vehículos y mercancía incautados. Loa agentes interceptaron un camión sospechoso, al momento de pedir los documentos al conductor, hasta la zona llegaron 10 vehículos para obstaculizar la labor policial lanzando piedras. Después de varios minutos de resistencia, los contrabandistas fugaron. En la zona se intervino un station wagon cargado de ropa usada y la camioneta ford con tres fardos de cachina en su tolva.', 1, 1, 1, '0', '0', 0),
(33, '2018-02-10', 1, 'INVESTIGAN COLOMBIANOS POR USO DE DINERO DEL NARCOTRÁFICO', 'La noche del jueves fueron allanadas tres casas, se intervino a 12 colombianos que integrarían la organización criminal "Los colochos", dedicados a prestar dinero con el sistema "gota a gota" en Tacna. Desde el 2015 se realizaron investigaciones para identificar a los presuntos miembros  de una banda que emplearía dinero del narcotráfico en la empresa de fachada "La gran familia", tipificado como lavado de activos.', 1, 1, 1, '0', '0', 0),
(34, '2018-02-13', 1, 'Intervienen balsa con cargamento de droga en triple frontera', 'La Marina de Guerra del Perú, la Dirandro y la Armada Colombiana intervinieron una embarcación con un cargamento de droga en la localidad de Santa Rosa (Loreto), ubicada en la triple frontera Perú - Colombia - Brasil. La balsa contenía 210 paquetes de marihuana. El vigilante colombiano Alberto Correa Ramos fue detenido.', 1, 1, 1, '0', '0', 0),
(35, '2018-02-14', 1, 'Presunto "narco" tenía medio millón de dolares', 'Una investigación por 8 meses de la división contra el narcotráfico de al Armada de Chile y Carabineros de OS-7 de Arica, conllevó a desbaratar una banda dedicada al tráfico de drogas y lavado de activos desde Tacna. Según los investigadores, la banda internacional llevaba droga de Tacna por vía marítima en embarcaciones pequeńas hasta Chile. El seguimiento al peruano que entró a Chile por el complejo Chacalluta, permitió la captura de otras personas. El peruano fue abordado en un vehículo por la playa y en su mochila se halló medio millón de dólares.', 1, 1, 1, '0', '0', 0),
(36, '2018-02-18', 1, 'Chofer y unidad son intervenidos por presunto contrabando', 'En operativo "Motor 2018"del Deprove, se intervino un  vehículo y el conductor Jhonatan Jimy Perez Callata, por el presunto delito de contrabando y contra la fe pública en la modalidad de falsedad genérica. Al solicitar la información de la combi, los efectivos verificaron que el número de serie y motor de la unidad no coincidía con el consignado en la tarjeta de identificación vehicular.', 1, 1, 1, '0', '0', 0),
(37, '2018-02-18', 1, 'En Arica detienen a "Tío Martín" por tráfico de migrantes', 'Un chofer de nacionalidad peruana conocido con el alias de "Tío Martín" fue detenido en el complejo fronterizo Chacalluta tras ser denunciado por una mujer dominicana por tráfico de migrantes. La agraviada aseguró que el Tío Martín la captó en Tacna, donde ella le pagó 200 dólares por ayudarla a cruzar la frontera hacia Chile por pasos no autorizados. Además en su vehículo se encontraron 180 cajetillas de cigarrillos.', 1, 1, 1, '0', '0', 0),
(38, '2018-02-19', 1, 'Camioneta pedida por SUNAT circulaba en Av. Bohemia Tacneńa', 'Personal del Deprove intervino una camioneta que presentaba una orden de captura vigente cuando transitaba por el distrito Gregorio Albarracín. La camioneta Toyota con placa OH-2634 al ser revisada en el sistema de requisitorias dio positivo por orden la SUNAT. El vehículo fue trasladado a la comisaría para las diligencias. ', 1, 1, 1, '0', '0', 0),
(39, '2018-02-20', 1, 'Anciano pretendía entrar a la carcel con droga  oculta', 'Tres papas rellenas con clorhidrato de cocaína fueron incautadas por el personal del INPE al ciudadano Rómulo Anayhuaman Sotelo, cuando pretendía entrar al penal de varones de Pocollay como visitante. El intervenido dijo que iba a visitar a su yerno, sin embargo, en la bolsa que traía se encontró un papel con el nombre del interno Wilson Gonzales Tanchiva, quien cumple condena por el delito de tráfico ilícito de drogas. ', 1, 1, 1, '0', '0', 0),
(40, '2018-02-21', 1, 'Fiscal pide la cárcel para 8 colombianos', 'El fiscal del Cuarto Despacho de Investigación con Sub especialidad en Lavado de Activos y Perdida del dominio de Tacna, en audiencia de prisión preventiva contra los 8 colombianos intervenidos hace unos días por presunto lavado de activos,  reiteró que los extranjeros pertenecerían a una organización criminal dedicada al lavado de activos denominada "Los colochos de Túpac Amaru". La sanción para los procesados podría ser entre 8 a 15 ańos de prisión efectiva.', 1, 1, 1, '0', '0', 0),
(41, '2018-02-21', 1, 'Encuentran celulares, droga y otros objetos prohibidos en el penal', 'Tras la intervención de un hombre  que intentó ingresar papas con  droga al penal; se realizó un operativo de prevención y control. Representantes del INPE inspeccionaron las instalaciones del penal donde hallaron equipos de comunicación, droga y objetos prohibidos.', 1, 1, 1, '0', '0', 0),
(42, '2018-02-21', 1, '7 dominicanos intervenidos por ilegales', 'Siete dominicanos fueron intervenidos  en Arica tras salir del Perú por la pampa y evadiendo el control migratorio del domingo por la noche. Las autoridades chilenas dijeron que los extranjeros fueron entregados a la policía peruana.', 1, 1, 1, '0', '0', 0),
(43, '2018-02-22', 1, 'Contrabando de licores y prendas iba de Tacna a Arequipa', 'En operativo realizado por la IA de Ilo y la Policía de Carreteras en el control de SENASA Ilo, fue intervenida una camioneta transportando mercadería de contrabando. En ella viajaban Jorge Ramos Mamani y Maximina Mamani Quispe, quienes seńalaron ser dueńos de la mercadería valorizada en S/.250 mil soles. Por investigaciones realizadas se supo que dicho vehículo había iniciado viaje en Tacna y tenía como destino Arequipa. La mercadería fue depositada en el almacén de Aduana de Ilo. ', 1, 1, 1, '0', '0', 0),
(44, '2018-02-25', 1, 'Bus lleva contrabando de equipos médicos por 10 mil soles', 'Personal de la Policía Fiscal intervino un ómnibus de transporte interprovincial de la empresa Comotex al interior del terminal Manuel A. Odría por presunto contrabando de equipos médicos. Los bienes se encontraban ocultos en la unidad de pasajeros que no acreditaba la procedencia lícita de compra y estaba valorizado en 10 mil soles.', 1, 1, 1, '0', '0', 0),
(45, '2018-02-26', 1, 'Detienen a mujer por llevar 1.6 kilos de droga adheridos al cuerpo', 'Por el delito de tráfico ilícito de drogas fueron intervenidos Katherine Leydi Quincho Flores y Juan Carlos Barrueta Guerra, luego de que a la mujer se le encontrara adheridos al cuerpo paquetes que contenian 1.637 kg de clorhidrato de cocaína . La intervención la realizó personal de la Sección Antidrogas de la Policía, en el interior del terminal Manuel A. Odria. ', 1, 1, 1, '0', '0', 0),
(46, '2018-02-27', 1, 'Limeńo trasladaba a Chile cocaína oculta en bolso', 'Agentes de la Aduana de Chile intervinieron en el complejo fronterizo Chacalluta a un ciudadano limeńo identificado como José Luis Santana Dorregaray, cuando intentaba pasar 1.115 kg de clorhidrato de cocaína escondida en un bolso deportivo. ', 1, 1, 1, '0', '0', 0),
(47, '2018-02-27', 1, 'Pareja que cayó con droga será investigada por 15 días', 'Los investigados Katherine Quincho Flores y Juan Barrueta Guerra continuaran detenidos durante 15 días en el Departamento Antidrogas de la Policía de Tacna mientras duren las diligencias luego de ser descubiertos con droga que pretendían llevar a Chile. Indicaron que un hombre les entregó la droga en Lima y en Arica otro contacto iba a recibir la mercadería ilegal.', 1, 1, 1, '0', '0', 0),
(48, '2018-02-28', 1, 'Incautan productos "bamba"valorizados en 185 mil soles ', 'Gran cantidad de productos "bamba" por un valor de 185 mil soles incautó la Policia Nacional en el centro poblado Yorocco (Ilave). Se intervino un vehículo perteneciente a la empresa de transporte de carga Grael S.A.C. conducido por Arnold Jimmy Otazu Paricahua, proveniente de Lima. Se encontró prendas de vestir sin la documentación respectiva para su fabricación, traslado y/o comercialización.', 1, 1, 1, '0', '0', 0),
(49, '2018-02-28', 1, 'Peruana detenida con celulares de contrabando', 'Mientras realizaban una vigilancia en el interior del terminal internacional de Buses Arica - Tacna, agentes de la Sección de Investigación Policial de Chile, intervinieron a una ciudadana peruana con celulares valorizados en 10 millones de pesos. La intervenida no contaba con los documentos sustentatorios de la compra y origen de los celularesm, además argumentó que tenía como destino Tacna para la comercializacion de los mismos. ', 1, 1, 1, '0', '0', 0),
(50, '2018-03-01', 1, 'Dos dominicanos y un colombiano detenidos en la frontera con Chile ', '\nTres extranjeros fueron sorprendidos la noche del martes en el Hito 9 de la frontera con Chile, cuando pretendían salir del país burlando el control fronterizo Santa Rosa. Agentes los detectaron transitando de norte a sur por la pampa, a inmediaciones de la línea férrea del tren Tacna – Arica. En la sede policial se identificó a las dos dominicanas Alba Estrella Estrella y Yomaira de León,   y al colombiano Milton Suarez Riasco.\n\n', 1, 1, 1, '0', '0', 0),
(51, '2018-03-01', 1, 'Incautan 91 kg de droga camuflados en camionetas\n', 'Un cargamento de 91 kg de cocaína fue detenido por agentes de la Policía de Carreteras de Andahuaylas cuando era transportada oculta en tres vehículos en la vía entre Ayacucho y Apurímac. Las incautaciones se realizaron de manera indistinta. La primera incautación se hizo a una camioneta conducida por Freddy Ccoicca Martinez; la segunda se registró también a una camioneta conducida por Edwin Maucaylle Ayala, y el tercer vehículo conducido por Joel Ancco Morccolla. \n', 1, 1, 1, '0', '0', 0),
(52, '2018-03-02', 1, 'Colectivero cae con celulares por 240 mil', 'Un chofer de colectivo que cubría la ruta Arica Tacna fue intervenido por Agentes de la Policía Fiscal en el Complejo Fornterizo Santa Rosa tras ser descubierto ingresando celulares de contrabando al país. Se intervino a Lucio Salamanca Alanoca, conductor del colectivo. Personal de la Aduanas se percató de la existencia de un agujero en el asiento posterior del auto, lugar donde ocultaba celulares y accesorios valorizados en 240 mil soles. ', 1, 1, 1, '0', '0', 0),
(53, '2018-03-02', 1, 'En Arica detienen a mujer por contrabando de cigarillos', 'Una mujer fue intervenida en el terminal internacional de Arica tras ser sorpresdida ingresando a Chile cigarrillos de contrabando ocultos en una bolsa. En total la policía chilena contabilizó 17 cartones de cigarrillos Carnibal Silver, 10 cajas de  Canibal Blue y 5 de la marca Pine Green, de los cuales la mujer no sustentó su procedencia legal. Además refirió que en Arica iba a comercializar la mercadería valorizada en 7500.00 pesos.', 1, 1, 1, '0', '0', 0),
(54, '2018-03-03', 1, 'Cae camioneta con autopartes de contrabando', 'Agentes policiales del Puesto Fronterizo Francisco Bolognesi capturaron a un contrabandista cuando ingresaba al Perú por un paso no habilitado conduciendo una  camioneta, donde llevaba gran cantidad de partes de automóviles presuntamente robadas. El conductor fue identificado como Edwin Crisólogo Aguilar Aguilar quien no pudo explicar ni justificar con documentos la procedencia de la mercadería valorizada en 20 mil soles.  ', 1, 1, 1, '0', '0', 0),
(55, '2018-03-04', 1, 'Incautan contrabando de ropa y zapatillas por 95 mil soles', 'Personal de la Policía Fiscal intervino una cochera, donde decomisaron prendas de vestir  y zapatillas de contrabando. Los efectivos hicieron el seguimiento al taxi de placa Z2C-619 que conducía Juan Marca Condori que ingresó a una cochera ubicada en la calle Hipólito Unanue. En el interior se encontró pares de zapatillas, fardos de ropa, mochilas, y bultos con ropa usada, todo esto valorizado en 95 mil soles. \n', 1, 1, 1, '0', '0', 0),
(56, '2018-03-06', 1, 'Ocultan droga en desierto chileno', 'Una banda dedicada al tráfico de drogas se tomó el tiempo de ocultar en pleno desierto camino a Codpa, 90.920 kg de marihuana tipo cripy, equivalentes a más de 900 millones de pesos. Toda esta mercancía fue encontrada por detectives de la Brigada Antinarcóticos y contra el Crimen Organizado de la PDI. EL jefe de la Brianco seńaló que esta investigación permitió desvincular una organizción que internaba importantes remesas de drogas a Colombia y Perú. ', 1, 1, 1, '0', '0', 0),
(57, '2018-03-06', 1, 'Intervienen vehículo con maquinaria sin documentos en Tripartito', 'Policías del Puesto de Vigilancia Fronterizo Tripartito intervinieron un vehículo transportando maquinarias y herramientas sin documentación y que iban a ser vendidas en la feria dominical Tripartito. Los agentes  observaron a la camioneta de placa AHG-822 en actitud sospechosa y al alcanzarla encontraron dos grupos electrógenos, una motobomba y dos rotomartillos, Se intervino a Juan Zea Ccopa y Gilbert Cuba Barrera quienes no contaban con la documentacion sustentaria.', 1, 1, 1, '0', '0', 0),
(58, '2018-03-07', 1, 'Cuatro cubanos pretendía ingresar ilegalmente al país', 'Personal policial del puesto de vigilancia fronterizo Francisco Bolognesi intervino la noche del lunes a cuatro ciudadanos cubanos que pretendían ingresar ilegalmente al país. \nLos extranjeros fueron detenidos cuando caminaban sigilosamente por el hito 9. Fueron identificados como Liddy Vila Ramirez, Indira Bravo Schuwiep, Yaleima Hernández Vila, Rafael Bravo Schuwiep.\n', 1, 1, 1, '0', '0', 0),
(59, '2018-03-08', 1, 'Cae comerciante con baterías de contrabando', 'Personal policial intervino a un comerciante, mientras realizaba patrullaje en inmediaciones del óvalo Cristo Rey. La combi de placa Z2H-747 conducida por Edgar Flores Ninaja, al percatarse de la presencia policial tomó otra ruta rápida para huir de la zona, los agentes siguieron al vehículo y encontraron a bordo 60 baterías de segundo uso valorizadas en 2 mil soles. Además en las pertenencias del varón se halló la suma de 10,270.00 soles y 10 mil pesos chilenos.\n(Sin Fronteras, página 7)\n', 1, 1, 1, '0', '0', 0),
(60, '2018-03-10', 1, 'En frontera incautan cocaína por 725 mil dólares', 'Agentes de aduaas del control fronterizo chileno de Chacalluta descubrieron un auto blanco con 41 paquetes de clorhidrato de cocaína escondidos en compartimentos secretos que ingresaban a territorio chileno desde Tacna. La droga contaba con un peso de 21, 980 kg y esta valorizada en unos 725 mil dolares. El conductor chileno M.A.M.N (40) fue detenido y trasladado al Juzgado de Garantía de Arica.', 1, 1, 1, '0', '0', 0),
(61, '2018-03-10', 1, 'Incautan contrabando de cigarros por 194 mil soles en Tacna', 'Por el presunto delito de contrabando en la modalidad de receptación aduanera fueron detenidos Efraín Paucar Rojas, Miguel Huaman Zambrano y Pedro Quispe Mamani luego de ser encontrados con 2415 display con cajas de cigarros valorizados en 194 mil soles. La primera acción policial se efectuó el 9 de marzo en un local de la calle Uruguay, mientras que la segunda intervención se dió el 10 de marzo en la carretera Tacna a Tarata. ', 1, 1, 1, '0', '0', 0),
(62, '2018-03-11', 1, 'Capturan a cinco cubanos intentando salir del país hacia Chile', 'La policía intervino a cinco ciudadanos cubanos por intentar salir de manera irregular del país con destino a Chile. Fueron identificados como José Pérez Roque (24), Sandro Arzola Espinosa (34), Pedro Najarra Espinosa (22), Rusbisnel López Abreus (22), Osmany Velasquez Cautín (34), quienes estaban de ilegales en el Perú. Personal del puesto fronterizo Santa Rosa ubicó a los extranjeros a la altura de una antena de tefefonía.  ', 1, 1, 1, '0', '0', 0),
(63, '2018-03-11', 1, 'Capturan a banda peruana que intentaba ingresar droga a Chile', 'En una operación conjunta agentes chilenos lograron desbaratar una banda criminal dedicada a internar importantes cantidades de droga en territorio chileno. Se logró la incautación de 36.520 kg de cannabis sativa, droga que era trasladada en formato de ladrillos macados con "caritas felices" para identificarlos, y se detuvo a 6 peruanos. La banda ingresaba la droga por pasos no habilitado, la trasladaban y acopiaban en el Valle de Lluta, lugar donde los agentes detuvieron a los involucrados. Ladroga estaba valorizada en  $182.600.000. ', 1, 1, 1, '0', '0', 0),
(64, '2018-03-12', 1, 'Capturan a banda con 83 kg de droga en pampa ', 'Un nuevo método para ingresar droga quedó al descubierto por Carabineros, luego de sorprender a burriers en plena pampa cerca de la frontera con el Perú, a pocos minutos del Complejo Fronterizo Chacalluta, tres colombianos escondidos con trajes de mimetismo en la arena. Se logró incautar 83.553 kg de marihuana.', 1, 1, 1, '0', '0', 0),
(65, '2018-03-13', 1, 'Incautan 10 kilos de cocaína en la frontera', 'Detectives del PDI lograron la detención de dos individuos de nacionalidad chilena, quienes burlando todo control de ingreso a Chile por pasos no habilitados, internaban clorhidrato de cocaína proveniente de Bolivia. Con ello se logró el decomiso de 10.215 kg de cocaína base, la cual era trasladada hasta la ciudad para ser distribuída para su comercialización. ', 1, 1, 1, '0', '0', 0),
(66, '2018-03-13', 1, 'Los atrapan tratando de sacar autos por frontera', 'Dos ciudadanos bolivianos fueron detenidos por Carabineros, en un paso no habilitado cerca la comuna de General Lagos, cuando intentaban salir del país con dos vehículos sin placas patentes y con documentos adulterados. El procedimiento se desarrolló en horas de la madrugada, en el marco de un patrullaje preventivo por el sector, donde los uniformados observaron dos Station Wagon, los extranjeros fueron fiscalizados, intentando darse a la fuga. ', 1, 1, 1, '0', '0', 0),
(67, '2018-03-13', 1, 'PNP incauta a colombiano con marihuana destinada a Bolivia y Chile', 'Agentes policiales del Departamento Antidrogas en Tacna logró un duro golpe al narcotráfico internacional, incautando 51 kilos de marihuana camuflada al interior de un vehículo conducido por un ciudadano colombiano identificado como César Augusto Gaytan Serna. La diligencia se realizó en Tomasiri con el hallazgo de 130 paquetes tipo ladrillo que, según pesquisas, tenían como destino Bolivia y Chile.', 1, 1, 1, '0', '0', 0),
(68, '2018-03-14', 1, 'Caen colombianos con droga cerca a Chacalluta', 'Un total de cinco sujetos, tres colombianos y dos chilenos, fueron sorprendidos por la policía chilena caminando en plena pampa cerca del complejo de Chacalluta, en la ruta 5 Norte del vecino país. Cada uno portaba una mochila que al ser revisada llevaba en su interior "ladrillos" de marihuana con un total de 83 kg. Los extranjeros habrían ingresado por pasos no autorizados desde Tacna.', 1, 1, 1, '0', '0', 0),
(69, '2018-03-14', 1, 'Colombiano se dirigía a Puno con 51 kilos de droga ', 'Un duro golpe al narcotráfico dio la tarde de ayer la Sección Antidrogas de la Policía tras incautar en el control aduanero de Tomasiri más de 51kilos de marihuana de tipo "creepy" que eran trasladados a bordo de un vehículo conducido por Cesar Augusto Gaitán Serna de nacionalidad colombiana. El hombre intentó cruzar el control de Tomasiri, luego de haber ingresado por Tumbes el martes 6 de marzo. Tras la revisión del vehículo se halló una "caleta". La policía procedió a desarmar la carrocería del vehículo halllando la droga en paquetes tipo ladrillo.', 1, 1, 1, '0', '0', 0),
(70, '2018-03-15', 1, 'Operación Júpiter en Chile captura peruanas con productos falsificados', 'la Operación Júpiter llevada a cabo  Chile por detectives de la Brigada Investigadora de Delitos Económicos, busca detectar productos ilícitos, falsificados y de contrabando. Producto de esta diligencia detectaron en el sector céntrico de la ciudad a dos mujeres peruanas que ofrecían prendas de vestir falsificadas. En la investigación, se determinó que las mujeres ingresaban la mercancía de forma ilegal al país para luego comercializarlas. El operativo dejó como saldo a las dos mujeres detenidas y la incautación de un total de 196 prendas de vestir, valorizadas en más de 5 millones de pesos.', 1, 1, 1, '0', '0', 0),
(71, '2018-03-15', 1, 'Comerciantes caen con prendas de contrabando', 'Gran cantidad de prendas de vestir y zapatillas fueron incautadas por Radiopatrulla entre la noche del martes y mańana de ayer. La primera intervención se realizó en la Av. Jorge Basadre Grohmann, cuando el  vehículo conducido por Ronald Mamani Percca y su acompańante Mariela Chipana Chura fue interceptado. tras la revisión vehicular se halló un total de 339 zapatillas. Por otro lado en el óvalo Tarapacá se intervino un vehículo con fardos de ropa de segundo uso.', 1, 1, 1, '0', '0', 0),
(72, '2018-03-15', 1, 'Cae hombre con droga en estación ferroviaria', 'Personal policial de la Sección Antidrogas intervino em la estación ferroviaria a un sujeto, identificado como Roy Rojas Sánchez, que pretendía llevar droga de Tacna a la ciudad de Arica escondida en una mochila. Al momento de abrir la mochilla se halló nueve planchas plastificadas con cocaína con un peso total de 2.445 kg.', 1, 1, 1, '0', '0', 0),
(73, '2018-03-15', 1, 'Detectan a dos peruanos  llevando celulares de contrabado en vehículo', 'La policía chilena intervino a dos peruanos por contrabando de celulares en Arica. Al intervenir el vehículo se encontró un total de 920 celulares de distintas marcas y modelos. La mercancía se hallaba en el asiento posterior del vehículo y carecían de documentes que acrediten su compra. La mercancía valorizada en 80 millones de pesos fue entregada a la Aduanas Chile.', 1, 1, 1, '0', '0', 0),
(74, '2018-03-15', 1, 'Golpe a traficantes de migrantes que usaban pasaportes falsificados', 'Policías del Departamento Contra el crimen Organizado, Inteligencia, Suat y Use, la madrugada de ayer en operativos simultaneos en Lima, Callao y Tacna capturaron a 8 miembros de la organización criminal "Los traficantes del sur", que falsificaban pasaportes chilenos para enviar personas a Estados Unidos. La policía allanó el inmueble N°782 de la calle Uruguay, quedando intervenida Nuria Martha Quiliano Boza por el delito de tráfico de migrantes internacional y lavado de activos. La mujer era nexo con otros miembros de la organización en Chile. ', 1, 1, 1, '0', '0', 0),
(75, '2018-03-16', 1, 'Peruanas vendían en Arica ropa "bamba" ', 'Durante un operativo para combatir los delitos de infracción a la propiedad intelectual, indrustrial y contrabando, la Policía en Arica intervino a dos peruanas que ofrecían ropa de conocidas marcas las cuales eran falsificadas. Las prendas eran ingresadas a Chile de manera ilegal para luego ser ofrecidas en la vía pública. Se incautó un total de 196 prendas de vestir con un avalúo fiscal de 5 millones de pesos. ', 1, 1, 1, '0', '0', 0),
(76, '2018-03-16', 1, 'Hallan contrabando abandonado en Panamericana', 'Gran cantidad de mercadería de procedencia extranjera, valorizada en aproximadamente 25 mil soles, fue hallada abandonada por agentes del Departamento de la Policía Fiscal, en el cruce de las carreteras Panamericana Sur y Binacional, al ingreso de Moquegua. El hallazgo se projudo durante el operativo "Patrimonio Fiscal"en las carreteras de mayor transitabilidad que interconectan las regiones de Tacna, Moquegua y Puno. Prendas de vestir, zapatillas, mochilas, batidoras, entre otros fueron incautados y trasladados a la Aduana de Ilo.', 1, 1, 1, '0', '0', 0),
(77, '2018-03-16', 1, 'Detienen a dos sujetos en posesión de "ketes" de droga', 'Agentes del Departamento Antidrogas de la Policía Nacional detuvieron a dos sujetos en posesión de "ketes" conteniendo pasta básica de cocaína cuando realizaban un operativo en puntos críticos de la ciudad de Moquegua. Uno de ellos identificado como Carlos Antonio Cabello Rivera, acusado de microcomercializador de drogas, a quien se le encontró una bolsa con 14 envoltorios.', 1, 1, 1, '0', '0', 0),
(78, '2018-03-16', 1, 'Intervienen a mujer que portaba 1300 soles falsos', 'Una mujer fue intervenida en Ilo por llevar entres sus pertenencias billetes falsos por 1300 soles. Agentes de la policía encontraron en su poder 8 billetes de 100 soles y 10 billetes de 50 soles, los mismos al parecer son falsos. Según informó la Policía Nacional, la mujer llegó a Ilo procedente de Tacna. No se descarta que forme parte de una banda dedicada a la falsificación de billetes de diferentes denominaciones.', 1, 1, 1, '0', '0', 0),
(79, '2018-03-19', 1, 'Cae banda que vendía pasaportes falsos en Perú', 'El caso donde la Fiscalía peruana desarticuló una organización que vendía documentos chilenos a extranjeros comenzó en Arica luego de que la Fiscalía iniciara una investigación de estos hechos que derivó a aportar antecedentes que le permitieron al vecino país (Perú)  desbaratar esta organización. La Fisalía de Arica el ańo pasado logró condenar a dos integrantes de esta banda.', 1, 1, 1, '0', '0', 0),
(80, '2018-03-19', 1, 'Autos estuvieron a punto de irse a Bolivia', 'Tres personas de nacionalidad boliviana fueron detenidas por el delito de usurpación de identidad y contrabando de vehículos  por carabineros de la Comisaria de Chacalluta. Tras un operativo detectaron dos vehículos que se trasladaban con destino a Bolivia sin contar con documento algino que acredite la contra de los móviles.', 1, 1, 1, '0', '0', 0),
(81, '2018-03-19', 1, 'Camiones de "la culebra" traían mercancía boliviana', 'Dos vehículos pertenecientes a la caravana de contrabandistas " Culebra del sur" fueron intervenidosla noche del jueves por la policía fiscal durante un operativo de represión al contrabando en la carretera Tacna a Tarata. En dos camiones se halló gran cantidad de maíz y soya de procedencia boliviana valoriazada en 200 mil soles. La mercadería habría ingresado al país burlando los controles fronterizos. Los conductores lograron escapar, abandonando los camiones con la mercadería,  la cual  fue enviada a los depósitos de la Aduana de Tacna.', 1, 1, 1, '0', '0', 0),
(82, '2018-03-19', 1, 'Incautan contrabando en Estique Pampa', 'Durante un operativo de prevención del delito la policía de Estique Pampa logró incautar gran cantidad de mercadería de contrabando. La miniván de la empresa de transportes 1 de Septiembre fue intervenida tras verificar la existencia de caletas con sacos y bolsas con productos cuya procedencia legal no supieron acreditar. Entre los productos se halló dvd''s, planchas, pelotas, zapatillas y camisas , todo valorizado en 20 mil soles. ', 1, 1, 1, '0', '0', 0),
(83, '2018-03-20', 1, 'Intentaron ingresar 37 kilos de droga a Chile', 'Detectives de la Brigada Antinarcóticos y Contra el Crimen Organizado desbarataron una organización criminal conformada por extranjeros, estos se encontraban coordinando el ingreso a Chile de una gran cantidad de marihuana tipo cripy, avaluada en 150 millones de pesos. Entre los detenidos se encuentran un ciudadano boliviano y un colombiano quienes ocultaban los 64 paquetes de marihuana en sus mochilas.', 1, 1, 1, '0', '0', 0),
(84, '2018-03-20', 1, 'Intervienen a estudiante que llevaba a Chile 15 kilos de marihuana en auto', 'Aduaneros chilenos intervinieron un vehículo conducido por joven que transportaba 15 kilosde marihuana acondicionada en "caletas". Con la ayuda de tecnología no invasiva y un can detector los fiscalizadores lograron hallar 15 paquetes de diferentes tamańos con un total de 15 kilos 155 gramos de marihuana, valorizada en 75 millones de pesos chilenos. El Servicio Nacional de Aduana de Chile informó que durante los meses de enero y febrero del presente ańo las aduanas de Arica, Iquique y Antofagasta han incautado 480 kilos 894 gramos de droga en 141 intervenciones.', 1, 1, 1, '0', '0', 0),
(85, '2018-03-20', 1, 'Intervienen a requisitoriada por tráfico de drogas', 'Celia Capaquera Pilco fue nuevamente capturada por la PNP en Tacna, en esta ocación al ser sindicada de desfigurar el rostro de Rogelio Lima Maldonado usando el pico de uina bottella rota.  Capaquera quedó en calidad de detenida al tener una requisitoria vigente por delito de tráfico de drogas. Por este mismo caso fue llevada ante las instancias respectivas el 18 de enero del 2018 ya que el Ministerio del Interior la incluyó en la lista de Los Más Buscados ofreciendo una recompensa de 10,000 soles por su paradero; sin embargo, estuvo en libertad siendo nuevamente apresada', 1, 1, 1, '0', '0', 0),
(86, '2018-03-21', 1, 'Mafia italiana sacaba droga de Tacna a Chile ', 'Autoridades chilenas desarticularon una banda de 5 italianos que ocultaban 103 kilos de cocaína en dos motos de agua que pretendían ingresar a la ciudad de Arica por el complejo fronterizo de Chacalluta. Los ciudadanos italianos Luca Quagliuolo y Doménico Ángelo Vorro conducian una camioneta que transportaba dos motos acuaticas. Tras hacer la revisión se descubrió que dentro de las motos se trasladaba la droga valorizada en 22 millones de soles. Diligencias posteriores permitieron la captura de Massimiliano Beltrami,  Paola Vorro y Nicholas Tassone quienes tambien integraban la organización.En Tacna cargaban y ocultaban la droga para posteriormente llegar a Santiago de CHile y por vía aérea enviar la droga a Italia.', 1, 1, 1, '0', '0', 0),
(87, '2018-03-21', 1, 'Intervienen a joven con droga oculta en mochila', 'Personal de la Policía intervino a un joven de 18 ańos que cargaba con el droga oculta en una mochila. Se halló 20 ketes de marihuana envueltos en papel periodico, una bolsa plástica con 388 gramos de marihuana, dinero y un celular.', 1, 1, 1, '0', '0', 0),
(88, '2018-03-21', 1, 'Incautan contrabando en casa por más de 600 mil soles', 'La Policía Fiscal de Moquegua incautó el pasado lunes mercadería de contrabando valorizada en más de 600 mil soles. Toda esta mercadería fue hallada en un inmueble del centro poblado San Antonio (Moquegua), siendo la propietaria la seńora Margarita Alave Chambilla. En total se incautaron 25 sacos de polietileno conteniendo ropa de diferentes tipos, 41 bolsas de chompas de mujer, 50 cajas de 12 bolletas de whisky y 30 cajas de 12  botellas de tequila', 1, 1, 1, '0', '0', 0),
(89, '2018-03-22', 1, 'Incautan contrabando de celulares y relojes en auto que iba a Arequipa', 'Agentes de la Policía de Carreteras y de la Aduana de Ilo realizaron un operativo en la carretera Costanera e intervninieron al automóvil Toyota Corolla Rojo de placa F70-443 que transportaba mercadería ilegal de Tacna a Arequipa en compartimentos tipo "caletas". La intervención se efectuó en el control de la Senasa, siendo intervenidos Juan Arias Choque y Daniel Rodrigo Mamani Machaca, ambos con residencia en Tacna. Se incautó la mercancía consistente en teléfonos celulares, chompas de lana y relojes,  con un valor de 300 mil soles aproximadamente.', 1, 1, 1, '0', '0', 0),
(90, '2018-03-23', 1, '', '', 1, 1, 1, '0', '0', 0),
(91, '2018-03-23', 1, 'Intervienen a estudiante con  3 kilos de marihuana', 'Un estudiante de 25 ańos fue intervenido por el personal de la policía del Departamento Antidrogas en posesión de estupefacientes. Tras realizar el registro domiciliario del joven, agentes de la Policía habrian encontrado más de 3 kilos de marihuana en su habitación. El estudiante identificado como Jimmy Jared Huamán Cuadros fue trasladado a la dependencia policial . Además se le halló una bolsa con 100 gramos de pasta básica de cocaína y otra con 50 gramos de clorhidrato de cocaína', 1, 1, 1, '0', '0', 0),
(92, '2018-03-26', 1, 'Capturan camión con 900 mil en contrabando', 'Un camión de la "Culebra del Sur" con un cargamento de ropa de contrabando valorizado en unos 900 mil soles fue capturado en el centro poblado Alto Perú por agentes del Departamento de la Policía Fiscal. En el operativo realizado en la carretera Kollpa-La Paz, los agentes divisaron una caravana compuesta por cuatro vehículos, los persiguieron pero 3 lograron escapar, capturando un camión que fue abandonado por el chofer. La mercadería consiste en 20 fardos de ropa usada, 1352 bolsas de sandalias y 242 bolsas de ropa que tenían stickers de la Zona Franca de Iquique.', 1, 1, 1, '0', '0', 0),
(93, '2018-03-26', 1, 'Policía incauta fardos de "cachina" por 15 mil', 'Más de 20 fardos de ropa de segundo uso fueron incautados por agentes de la Subunidad de Acciones Tácticas de la Policía Nacional en Tacna en la Carretera Panamericana Sur. Inicialmente los policías  observaron una combi de color negro, que circulaba con dirección  a Tacna, que al notar su presencia cambió de rumbo y escapó de la vista de los agentes. Por el sector, lograron ubicar un station wagon conducido por Domingo Ninaja Calizaya. A un costado encontraron fardos de ropa de "cachina" que estaban ocultos entre esteras, todo valorizado en 15 mil soles.', 1, 1, 1, '0', '0', 0),
(94, '2018-03-26', 1, 'Cayó la reuina del contrabando de los cigarros', 'Detectives de la Brigada  Investigadora de Delitos Económicos de la PDI, lograron detener a una ciudadana peruana que compraba cajas  de cigarrillos en el comercio ilegal en Bolivia, para luego pagar a camioneros extranjeros para que ingresaran dentro de sus cargas ocultas los cigarros, una vez en Chile, acopiaba toda su mercancía en un domicilio. Luego contrataba un furgón para trasladar los cigarrillos hasta Antofagasta. Se logró la incautación de 14580 cajetillas de cigarros importados con un valor comercial de 30 millones de pesos.', 1, 1, 1, '0', '0', 0),
(95, '2018-03-27', 1, 'Policía fiscal incauta contrabando por más de 19 mil  soles', 'Moquegua. Agentes de la Policía Fiscal incautaron gran cantidad de mercadería de procedencia extranjera por un monto ascendente a 19 500 soles. La intervención se produjo durante un operativo a los buses que cubren la ruta de Puno - Tacna. Se trata de un total de 199 pares de zapatillas de conocidas marcas, las cuales fueron halladas al interior de sacos y abandonados en la carretera Binacional. No se logró ubicar al propietario de la mercadería, la que fue trasladada a los almacenes de la Aduana de Ilo.', 1, 1, 1, '0', '0', 0),
(96, '2018-03-27', 1, 'Detienen en Arica a transportista con 215 millones de pesos en contrabando', 'Un transportista y su acompańante, ambos ciudadanos bolivianos, fueron detenidos por Carabineros con 215 millones de pesos en contrabando, cuando intentaban salir del país por un paso no habilitado. El hecho ocurrió en el kilometro 185 de la Ruta 11 Ch, cuando agentes fiscalizaron un camión, encontrando 1280 celulares, 32 laptops, accesorios para vehículos, como radios, amplificadores y parlantes, y fardos de ropa; los cuales no tenían documento alguno y eran llevados a Bolivia para su comercialización.', 1, 1, 1, '0', '0', 0);
INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(97, '2018-03-28', 1, 'Decretan expulsar del país a hombre condenado por tráfico de drogas', 'El tribunal de Juicio Oral en lo Penal de Arica condenó a Luis Antonio Inca Guerrero a la pena de 5 ańos de presidio en calidad de autor del delíto de tráfico de drogas. Ilícito perpetrado en mayo pasado en el complejo fronterizo de Chacalluta.  Asimismo decretaron la expulsión del pais para el ciudadano colombiano que no podrá reingresar a Chile por el término de 10 ańos. Luis Inca fue intervenido el 6 de mayo del 2017 cuando pasaba el control manejando un vehículo,  se reviso el auto por advertencia del perro detector de drogas. Tras la revisión se encontró  39 kilos de cannabis y  4 kilos de cocaína. ', 1, 1, 1, '0', '0', 0),
(98, '2018-03-28', 1, 'Investigan a estudiantes por posesión de drogas', 'A raíz de una denuncia anónima, el Ministerio Público y la Policía Fiscal a la institución educativa Rafael Díaz, donde dos estudiantes de 14 y 15 ańos de edad fueron intervenidos en posesión de droga, la misma que correspondería a marihuana por un peso de 5.1 gramos. El caso se maneja con suma reserva por parte de la fiscalía de la Familia por tratarse de menores de edad.', 1, 1, 1, '0', '0', 0),
(99, '2018-04-02', 1, 'Intervienen camión de la culebra en Tarata', 'Un camión de la llamada "culebra" repleto de contrabando fue intervenido la mańana de ayer por la policía en la provincia de Tarata. Los agentes se encontraban realizando un patrullaje en la carretera que conduce a Tacna, cuando se percataron de la presencia de un camión; tras verificar la tolva del vehículo, se encontró 400  sacos de maíz, valorizados en 30 mil soles,  que habrían sidos trasladados de Bolivia. La mercadería no contaba con ningun tipo de documento.', 1, 1, 1, '0', '0', 0),
(100, '2018-04-02', 1, 'Incautan artefactos', 'Agentes de la Policía Fiscal intervinieron en la Av. Bohemia Tacneńa a una camioneta conducida por Freddy Trujillo Muńoz y a su acompańante Ruth Alicia Allauca Huallpa. En la tolva de la camioneta, la policía halló un cargamento de artefactos domésticos, ollas, una motosierra, una hidrolavadora, mochilas de fumigación y dos martillos.', 1, 1, 1, '0', '0', 0),
(101, '2018-04-02', 1, 'Incautan ropa de contrabando ', 'Agentes del puesto de vigiancia fronterizo Santa Rosa, observaron una camioneta que circulaba con las luces apagadas. Al percatarse de la presencia policial, el chofer huyó del lugar abandonando el vehículo. Se halló un total de once fardos de ropa de segundo uso que habrían sido ingresados desde Chile.', 1, 1, 1, '0', '0', 0),
(102, '2018-04-02', 1, 'Incautan licores de contrabando por 15 mil soles', 'Durante el operativo contrabando 2018, realizado por agentes de la Policía Fiscal en los distritos de Pachía y Alto de la Alianza, se invertino dos vehículos que trasladaban cajas con licor de contrabando. La primera intervención se llevó a cabo en La esperanza, donde Tomasa Yufra Tapia manejaba sospechosamente, hallando en el carro 15 cajas de whisky. En la segunda intervención, en Pachía, se intervino a un minibus de la empresa de transportes Artemio Pilco E.I.R.L. conducido por Fredy Carlos Flores Ayca, donde se halló 14 cajas de ron y 16 cajas de whisky.', 1, 1, 1, '0', '0', 0),
(103, '2018-04-03', 1, 'En Chile cae peruano con 60 ovoides de cocaína en estómago', 'Con 80 ovoides de cocaína en el estómago fue detenido un ciudadano peruano que viajaba en un bus por la carretera de Cuya (Chile), donde personal policial realizaba labores. La fiscalización del bus se llevó a cabo en la comuna de Camarones, donde un can detectó bajo unos asientos una bolsa con ovoides de cocaína. Se logró identificar al propietario, quien transportaba en su estómago más ovoides con cocaína. ', 1, 1, 1, '0', '0', 0),
(112, '2018-04-06', 1, 'Incautan licor de contrabando por 25 mil soles', 'Durante el operativo Contrabando 2018 realizado la madrugada de ayer en la vía Tacna - Tarata, por agentes de la Policía Fiscal, se incautó gran cantidad de licores de contrabando. El hallazgo se realizó en el km. 12 de la carretera, cuando los agentes observaron varios bultos al costado de la vía, que al parecer estaban en estado de abandono. Tras la verificación, se halló 95 cajas de  licores, con un valor de 25 mil soles aproximadamente. La mercadería fue trasladada a los almacenes de Aduana en Tomasiri.  ', 1, 1, 1, '0', '0', 0),
(113, '2018-04-06', 1, 'Sorprenden a turista con marihuana y cocaína en su cuerpo ', 'Arica. Más de 50 millones de pesos en droga escondía en su cuerpo un chileno que viajó a Tacna por vacaciones. Al regresar a Chile fue perfilado y revisado en Chacalluta por agentes de Aduanas, quienes encontraron 1 kilo 345 gramos de marihuana y 2 kilos 180 gramos de clorhidrato de cocaína. El hallazgo se realizó gracias al apoyo de los canes y la tecnología no invasiva. El chileno fue identificado como A.G.L.V. de 31 ańos de edad, quien es de Santiago y viajó hasta Tacna para adquirir la droga. ', 1, 1, 1, '0', '0', 0),
(115, '2018-04-09', 1, 'Hombres fueron sorprendidos en pampa con más de 38 kilos de droga', 'Chile. Carabineros del OS-7 Arica, lograron la detención de 3 burriers de nacionalidad peruana, cargando mochilas con droga. Los sujetos fueron detectados tras un patrullaje preventivo, donde personal de esta sección especializada realizaba controles en aquellos sectores y pasos no habilitados. Entre los detenidos, se encontraban dos menores de apenas 17 ańos, quienes fueron sorprendidos cerca de las 02.45 de la madrugada del sábado, a la altura del Hito 17. Tras la inspección a las mochilas se logró incautar un total de 35 paquetes de marihuana, con un peso de 38 Kilos 835 Gramos, avaluadas en aproximadamente 233 millones de pesos.\n', 1, 1, 1, '0', '0', 0),
(116, '2018-04-09', 1, 'Incautan zapatillas y lentes de contrabando por 160 mil', 'Tacna. En la parte posterior de mercado Grau, agentes de la Depincri detuvieron a dos comerciantes que trasladaban presunta mercancía de contrabando consistente en lentes y zapatillas sin documentación por un valor de 160 mil soles. La intervención se produjo a las 22.30 h del jueves cuando los policías patrullaban la zona. Edwin Mamani Mamani y Jesús Alberto Salas Pacheco fueron detenidos.\n', 1, 1, 1, '0', '0', 0),
(117, '2018-04-09', 1, 'Aduaneros incautan 22 kilos de oro y 5 kilos de droga', 'Puno. Tras una rápida intervención, personal de Aduanas logró incautar 5 kg de cocaína y 22 kg de oro en el distrito de Cabanillas. Se detuvo a una minivan que se dirigía de Arequipa con destino a Juliaca. Durante la revisión del equipaje de Paúl Cunya Huamán  se halló tres paquetes de tipo "ladrillo". Asimismo en el equipaje de Paulino Sucasaca Collanqui y Walther Chaińa Chaińa se encontró 22 kg de oro, quienes no contaban con documentación que sustente la legalidad del material que portaban.                     \n', 1, 1, 1, '0', '0', 0),
(118, '2018-04-09', 1, 'Aduanas intervienen camión de la "culebra" en Tarata', 'Tarata. Gran cantidad de mercadería de contrabando incautaron la tarde del sábado agentes de la Aduana de Puno cerca del penal de Challapalca, en la vía Puno - Tarata, en la zona denominada Chivatería. Según fuentes policiales, se trata de un camión de la "culebra" que se dirigía de Desaguadero a Tacna. Lo incautado fue internado en los almacenes de Aduanas Puno.\n', 1, 1, 1, '0', '0', 0),
(119, '2018-04-10', 1, 'Almohadas de viaje venían con más de 1 kilo de marihuana', 'Fiscalizadores de Aduanas Chile sorprendieron a dos extranjeros cuando trataban de ingresar con más de 11 millones de pesos en marihuana. El procedimiento se registro en el complejo fronterizo Chacalluta. Los venezolanos de iniciales J.D.M.R y L.A.T.D. fueron intervenidos tras intentar pasar la droga oculta en cojins cervicales. El primero de ellos escondía 1 kilo 140 gramos de marihuana, mientras que el segundo llevaba 1 kilo y 80 gramos de la misma droga. ', 1, 1, 1, '0', '0', 0),
(120, '2018-04-12', 1, 'Intervienen vehículo de placa chilena que habría ingresado ilegalmente', 'Personal de la policía fiscal intervino a un conductor y una camioneta por el ingreso presuntamente ilegal del vehículo. Esto ocurrió cuando los agentes se encontraban en medio de la ejecución del operativo " Contrabando 2018", y se percataron de la presencia de un vehículo con lunas polarizadas en la urbanización "Los Ediles". El vehículo de marca Suzuki, de placa de rodaje chilena FYK W97, era conducido por un varón que no tenía documentos de identidad y que responde al nombre de Celedonio Mendoza Lina de 26 ańos de edad. \n', 1, 1, 1, '0', '0', 0),
(121, '2018-04-12', 1, 'Sentencian a investigado por lavado de activos', 'Mediante terminación anticipada, el Primer Juzgado de Investigación Preparatoria de Tacna sentenció al imputado Fred Javier Pérez Jones a 6 ańos y 8 meses de prisión preventiva por el delito de lavado de activos en la modalidad de ingreso al país y al pago de una reparación civil de 15 mil soles. El investigado fue detenido en el 2017 en el complejo Fronterizo Santa Rosa con 50 mil dólares adheridos al cuerpo. Luego que se allanara su vivienda y se encontrara evidencia de que estaba vinculado al tráfico ilícito de drogas\n', 1, 1, 1, '0', '0', 0),
(122, '2018-04-12', 1, 'Combi trasladaba baterías de contrabando en La Yarada', 'Baterías de contrabando y bienes de segundo uso fueron incautados por agentes de Radio patrulla tras intervenir una combi que circulaba por La Yarada - Los Palos. Se trata del vehículo de placa Z1W -746 conducido por el comerciante Edgar Flores Ninaja, quien se dio a la fuga pero fue interceptado en la avenida Litoral. En la combi se encontraron 80 baterías sin la documentación correspondiente al igual que dos sacos con peluches y cubrecamas de segundo uso.\n', 1, 1, 1, '0', '0', 0),
(123, '2018-04-13', 1, 'Comerciante tacneńo  fue sorprendido en Chacalluta con dólares falsos', 'Agentes de la Aduana de Chile sorprendieron en el complejo fronterizo Chacalluta a un comerciante tacneńo de iniciales W.I.L.T. con 182100 dólares falsificados, quien ingresaba como turista y pretendía llegar a Santiago. El hombre fue seleccionado en base a perfiles de riesgo, luego de inspeccionar su equipaje y entrevistarlo, le solicitaron ver la chaqueta que llevaba puesta y encontraron un doble fondo con 1821 billetes que imitan el papel moneda norteamericano. Todos los billetes eran de cien dólares. EL hecho fue notificado al Ministerio Público de Chile. ', 1, 1, 1, '0', '0', 0),
(124, '2018-04-16', 1, 'Incautan calzado de contrabando por 40 mil soles', 'Dos contrabandistas con tres vehículos y un cargamento de zapatillas de segundo uso por 40 mil soles fueron capturados en Magollo tras una tenaz persecución policial. Agentes del grupo Terna detectaron un vehículo sospechoso que circulaba a excesiva velocidad por la carretera Panamericana, procediendo a realizar una sigilosa persecución hasta el punto del paso de la mercadería ilegal. El vehículo se detuvo en la parcerla 6 de Magollo, donde además habian otros dos vehículos. En el lugar los agentes procedieron a la intervención y redujeron a Edgar Pongo Tarqui, Diego Armando Pongo Quispe. Asu vez se incautaron las tres camionetas donde habíansacos con zapatillas de segundo uso. La mercadería estaría valorizada en unos 40 mil soles. ', 1, 1, 1, '0', '0', 0),
(125, '2018-04-16', 1, 'Decomisan contrabando por más de 13 mil soles', 'Gran cantidad de mercadería de licores y prendas de vestir, valorizada en 13 mil 900 soles, fue incautada en un operativo realizado en la carretera Panamericana, en el valle de Moquegua. Durante el operativo fueron intervenidos varios vehículos particulares y de transporte público procedentes de Tacna e Ilo. Al momento del registro se halló licores como vinos y whisky, así como prendas de vestir de segundo uso. En total se logró contabilizar 125 botellas de licor, 132 pantalonetas y 130 kilos de ropa usada. La mercadería era trasladada a Moquegua y Arequipa.', 1, 1, 1, '0', '0', 0),
(126, '2018-04-16', 1, 'Disminuyen viajes a Tacna y peruanos quieren conocer el mall', 'La apertura del Mall Plaza de Arica ha causado revuelo y muchos tacneńos se animaron a conocerlo este fin de semana. Las cifras así lo muestran, y los testimonios tambien. Este fin de semana salieron menos personas desde Arica a Tacna e ingresaron más desde la ciudad de Tacna, lo que se podría inferir como unos de los efectos de la apertuura del mall. De acuerdo a infromación de la Gobernación Provincial de Arica, entre el viernes 6 y sabado 7 de abril se registró un total de 22,486 salidas hacia Tacna. Este fin de semana hubo menor salida de personas alcanzando las 16,997.', 1, 1, 1, '0', '0', 0),
(127, '2018-04-17', 1, 'Contenedor completo venía cargado con 400 mil cajetillas de cigarros', 'Más de 1 millón 437 mil en impuestos pretendía evadir una banda internacional de contrabandistas que fue interceptada por funcionarios del Servicio Nacional de Aduanas Chile y Carabineros en Arica . El procedimiento involucró el trabajo de red de analistras de las aduanas de Panamá, Chile y Bolivia, quienes lograron identificar un contenedor con 400 mil cajetillas de cigarrillos que tenía como destino el mercado chileno.El Director Regional de la Aduana de Arica explicó que gracias al trabajo en red de las Aduanas del mundo se alertó a la Unidad de Análisis de Riesgos en Arica sobre un cargamento que utilizaría el puerto nortino como plataforma de internación al continente. " El modus operandi era un contenedor en libre transito desde Arica a La Paz, por lo cual se coordinó con la Aduana de Bolivia para la trazabilidad e interceptarlo en Tambo Quemado. Fueron 4 los detenidos, el boliviano J.J.E.CH. y los peruanos L.H.A., B.A.A. y J.C.H.A. ', 1, 1, 1, '0', '0', 0),
(128, '2018-04-17', 1, 'Estudiante ariqueńi traía 12 kilos de marihuana ocultos en la estructura de su vehículo', 'En prisión preventiva quedó un estudiante que fue interceptado en Chacalluta por la Aduana de Chile. El joven ariqueńo identificado como H.L.A.M. de 26 ańos, que venía desde Tacna,  ocultó en su automovil 12 kilos 650 gramos de marihuana y su detección se logró gracias al uso de perfiles de riesgos y la revisión mediante tecnología no invasiva. Los fiscalizadores intervinieron el vehículo y sacaron los paquetes que estaban sellados en un plástico blanco, el cargamento tiene un valor que puede superar los 63 millones de pesos en el mercado ilícito. ', 1, 1, 1, '0', '0', 0),
(129, '2018-04-18', 1, 'Menos chilenos visitan Tacna tras la inauguración de mall en Arica', 'La inauguración del Mall Plaza en Arica, el jueves 12 de abril, propició la disminución de visitantes extranjeros a la ciudad informó el jefe de Migraciones Tacna, Percy Pisfil Gonzáles. El  funcionario detalló que la disminución más notoria se presentó el último sábado 14 de abril en que ingresaron a Tacna 6 mil 975 extranjeros a diferencia de los 8 mil 386 visitantes que lo hicieron el sábado 7 de abril, es decir hubo un aproximado de mil 400 chilenos que se quedaron en Arica. "Estamos hablando de un poco más de 10%  de extranjeros que ingresan un sábado", seńaló.  Pisfil aseguró que se analizará el comportamiento del flujo  de personas los próximos fines de semana para determinar la verdadera magnitud  de la disminución y si las cifras continúan disminuyendo.', 1, 1, 1, '0', '0', 0),
(130, '2018-04-18', 1, 'Incautan fardos con "cachina" por 15 mil soles', 'Durante el operativo Contrabando 2018 realizado por agentes de la Policía Fiscal, se incautó la madrugada de ayer gran cantidad de calzado y prendas de segundo uso en calidad de abandono.  Los agentes que hacían patrullaje en la asociación de vivienda VIlla Cenepa observaron  en una de las calles varios bultos aplilados. De inmediato se corroboró que se trataba de fardos que habían sido abandonados, por lo que fueron trasladados a las oficinas de la Policía Fiscal. En total se contabilizaron 14 fardos de polietileno, los cuales fueron internados en los almacenes de Aduanas en el Control Tomasiri.', 1, 1, 1, '0', '0', 0),
(131, '2018-04-19', 1, 'Hasta droga Tusi fue incautada en operativo', 'Allanamientos a distintas casas de la población Cerro Chuńo, 8 extranjeros detenidos y la incautación de droga fue el saldo de un operativo que realizó personal del OS-7. Esta investigación se inició en el límite fronterizo con Perú donde agentes se encontraban verificando el ingreso de migrantes por pasos habilitado, cuando detectaron a tres personas escondidas y que portaban mochilas con marihuana. Un total de 13 kilos de cannabis se les fue incautado. Dos colombianos y un peruano quedaron detenidos. Las diligencias continuaron en la ciudad , ya que se tenía información que otras personas apoyaban a esta banda , la cual estaba integrada por colombianos, venezolanos, peruanos y chilenos. Tambien se incautó 4 gramos de droga Tusi cuyo valor comercial es  de 20 mil pesos el gramo.', 1, 1, 1, '0', '0', 0),
(132, '2018-04-19', 1, 'Decomisan 280 baterías de procedencia ilegal valorizadas en 20 mil ', 'Como parte del operativo "Contrabando 2018" de la PNP, se intervino un inmueble ubicado en la Yarada. Al interior de la vivienda se halló 280 baterias de segundo uso de diferentes marcas y tamańos, cuyos propietarios no pudieron sustentar su procedencia legal. Fueron detenidos WIlber QUilahuanca Pacco y Gloria Ccallomamani Ccallomamani por estar presuntamente inmerson en el delito de contrabando. La mercancía tendría un valor comercial de 20 mil soles aproximadamente. ', 1, 1, 1, '0', '0', 0),
(133, '2018-04-19', 1, 'Presidentes inaugurarán control fronterizo en Desaguadero', 'El sábado 28 de abril los gobiernos del Perú y Bolivia inaugurarán el nuevo Centro Binacional de Atención en Frontera CEBAF en Desaguadero, destinado a agilizar el transito de personas, vehículos y mercancías entre ambos países. Así lo confirmó este miercoles el presidente boliviano, Evo Morales, quien explicó que acudirá ese día junto con el presidente del Perú, Martín Vizcarra a esta  inauguración. Las nuevas instalaciones ocupan unas siete hectáreas, en las qe se invirtieron  cerca de 40 millones de dólares con el fin de agilizar el tránsito, para evitar las largas colas de camione.. El CEBAF agilizará el ingreso de 100000 camiones de carga y 8800 vehículos de turismo que se desplazan cada ańo.', 1, 1, 1, '0', '0', 0),
(134, '2018-04-19', 1, 'Incautan contrabando por más de 46 mil soles', 'Gran cantidad de mercadería de contrabando valorizada en 46 milsoles fue incautada la madrugada  de ayer por agentes de la Policía Fiscal, en un operativo realizado en la carretera Binacional. La mercancía fue hallada al interior de las bodegas del ómnibus de placa B6V-956 de la empresa de transportes Copacabana que cubre la ruta Puno - Tacna, la mercadería consistía en zapatillas, prendas de vestir y carteras. ', 1, 1, 1, '0', '0', 0),
(135, '2018-04-23', 1, 'Intentó trasladar a Santiago 2 kilos de cocaína', 'Apoyados por un ejemplar canino, detectives de la Brianco, quienes realizaban un control carretero, detectaron en un bus interprovincial que se dirigía a Santiago, a un ciudadano peruano escondiendo entre sus piernas y resto del cuerpo 1.821 kg de cocaína. El nerviosismo del sujeto y la detección del  can llamó la atención de los detectives quienes procedieron a realizarle un control más exhaustivo bajnándolo del bus, logrando indentificar la droga que escondía en su cuerpo. El ciudadano fue detenido por los oficiales y puesto a disposición del Tribunal.', 1, 1, 1, '0', '0', 0),
(136, '2018-04-23', 1, 'Detienen a Los cannabis del bosque', 'Tres integrantes de una organización criminal dedicada al tráfico ilícito de drogas en Tacna fueron capturados la mańana de ayer tras un trabajo coordinado entre el personal  policial de inteligencia y agentes de la sección antidrogas. La policía hizo segumiento a un taxi, el cual se estacionó cerca del cauce del río Seco en Gregorio Albarracín. Del vehículo descendieron una mujer y un varon, este último caminó hasta un basural donde rebuscó y sacó una bolsa de plástico para luiego  retornar al radiotaxi que se dirigió al centro poblado Leguía, donde los agentes prodecieron a intervenir. El pasajero fue identificado como Hítalo Peńa Mamani, a quien se le encontró la bolsa plástica con 4 paquetes tipo ladrillo con 2 kilos de marihuana. En el mismo sector, la policía ubicó a otros dos integrantes de la banda denominada " Los canabis del bosque; Edmundo López Huerta y Marcelo Humberto Cabrera Lizarazo. ', 1, 1, 1, '0', '0', 0),
(137, '2018-04-23', 1, '"Reducción de chilenos es regular por temporada baja"', 'La presidenta de la Asociación de Emprendedores y Empresarios de Turismo, Milka Vasquez, desestimó que la reducción de visitantes chilenos a Tacna se deba a la apertura de un mall en la vecina ciudad de Arica, si no más bien a la temporada baja que ocurre tras los meses de verano. " No es para alarmarse, porque ese mall no ha sido creado para el turista chileno, sino para el peruano, el boliviano, además que quieren impulsar el desarrollo comercial de Arica ", explicó Vásquez. ', 1, 1, 1, '0', '0', 0),
(138, '2018-04-24', 1, 'Incautan 23 kilos de cocaína', 'Personal de la Brianco de la PDI  logró incautar 23 kilos 910 gramos de clorhidrato de cocaína, los que estaban distribuidos en 49 paquetes al interior de un vehículo que pretendía llegar a Chile por el Complejo Fronterizo Chacalluta. Según informó la policía, el avalúo del  alcaloide alcanzó los 478 millones 200 mil pesos en caso de llegar a ser comercializada directamente a la capital, donde estaba destinada.', 1, 1, 1, '0', '0', 0),
(139, '2018-04-24', 1, 'Intervienen vehículo que transportaba 29 paquetes de marihuana', 'Un vehículo fue intervenido en la Av. Bohemia Tacneńa en el distrito Gregorio Albarracín. Dentro de la maletera del auto, la policía antidrogas halló 29 paquetes conteniendo marihuana. La policía en un trabajo de inteligencia realizó el seguimiento del auto, teniendo previo conocimiento que transportaría la sustancia ilegal. El conductor intervenido fue identificado Luis Crecencio Valdivia Paredes.', 1, 1, 1, '0', '0', 0),
(140, '2018-04-24', 1, 'Baja e 40 % ingreso de chilenos por terrapuerto', 'Los transportistas que brindan el servicio de autos colectivos  en el terminal internacional Manuel A. Odría vienen sufriendo las consecuecias de la disminución de turistas chilenos. El vicepresidente de la Agrupación de autos colectivos Tacna - Arica, Javier Cabrera, informó que el número de visitantes a  Tacna disminuyó en 40 %, haciendo cada vez más dificil que los transportistas puedan completar el viaje de ida y vuelta. El movimiento está lento en comparación con otros ańos, expresó. El problema de los transportistas ocurre primordialmente al retorno de Arica, debido a la falta de pasajeros. Por el contrario, los viajes de ida se han logrado mantener debido al paso de gran cantidad de venezolanos a Chile. ', 1, 1, 1, '0', '0', 0),
(141, '2018-04-25', 1, 'Incautan camión con más de 12 kilos de droga', ' Una pistola y doce paquetes con cocaína y marihuana ocultaba en la cabina de su camión un transportista que fue fiscalizado por funcionarios del Servicio Nacional de Aduanas en la avanzada El Loa. Mediante los Rayos X se detectaron objetos ocultos en la cabina. Al inspeccionar ese sector se halló 7 paquetes con un total de 7 kilos  336 gramos de marihuana y 5 paquetes con 5 kilos 476 gramos de clorhidrato de cocaína. El camionero fue identificado como G.A.O.J. de 42 ańos, quien fue formalizado por el delito de tráfico ilícito de drogas en calidad de autor y grado consumado.', 1, 1, 1, '0', '0', 0),
(142, '2018-04-25', 1, 'Comerciantes se enftrentan a policías para impedir decomiso de prendas "bamba"', 'En un accidentado operativo contra la propiedad industrial realizado en el Centro Comercial Feria 28 de Julio, agentes de la Policía Fiscal estuvieron a punto de quedar secuestrados, cuando decenas de comerciantes se les enfrentaron para evitar la incautación. Esto tras l incursion en 3 tiendas dedicadas a la venta de prendas de dudosa procedencia, ya que un representante de las casacas americanas the North Face hizo la denuncia sobre el expendio de productos bamba. La operación contra los productos ilegales o piratas se inició a las 13 h, cuando un contingente policial llegó al establecimiento. Se incautó los artículos ilegales, casacas y polos,  en varios sacos, con un valor aproximado de medio millon de soles.', 1, 1, 1, '0', '0', 0),
(143, '2018-04-27', 1, 'Incautan mercadería valorizada en 50 mil soles', 'Durante el operativo Contrabando 2018, agentes de la Policía Fiscal incautaron la madrugada de ayer gran cantidad de mercancía de dudosa procedencía "caleteada" en una camioneta que circulaba en la intersección de la avenida Luis Basadre Flores y prolongación Blondell. La policía intervino la camioneta Toyota de placa V7H-849, conducida por Amed Ale Holanda. En el vehículo se halló cajas y bultos con licores, prendas de vestir y calzado que no contaban con documentación que los respalde. El total de lo uncautado incluído el vehículo fue valorizado en 50 mil soles. Según investigaciones la mercadería tenía como destino la ciudad de Puno.', 1, 1, 1, '0', '0', 0),
(144, '2018-04-27', 1, 'Incautan contrabando por más de 40 mil soles', 'Gran cantidad de mercadería de contrabando valorizada en 40 mil soles fue incautado por agentes del Área de la Policía Fiscal, en operativo realizado en la carretera Binacional. En el lugar se intervino el ómnibus de placa de rodaje Z9A-961, de la empresa de transportes Pacífico Pullman, entre cuyos asientos del segundo piso se halló prendas de vestir. Además se encontró mercadería en calidad de abandono consistente en zapatillas. Otro vehículo intervenido fue el station wagon de placa Z4X-616, donde sehalló zapatillas de la marca Puma. Toda la mercadería fue incautada previo levantamiento del acta respectiva por encontrarse inmerso en el presunto delito de contrabando en agravio del Estado peruano.', 1, 1, 1, '0', '0', 0),
(145, '2018-04-30', 1, 'Con identidad falsa detienen a peruano en la frontera', 'Personal de la Policía de Investigaciones de Arica detuvo a un ciudadano peruano en el control fronterizo de Chacalluta por presentar un documento de identidad que no le correspondía. El peruano intentaba salir de Chile, donde residía de manera ilegal y para no ser detectado presentó el documento de identidad de un chileno como si fuera suyo, pero fue descubierto por las diferencias morfológicas entre él y la persona de la fotografía. El varón confesó y fue detenido por el delito de usurpación de nombre y fue trasladado al Juzgado de Garantía.', 1, 1, 1, '0', '0', 0),
(146, '2018-04-30', 1, 'Incautan cigarros de contrabando por 4 mil soles', 'Durante el operativo "Contrabando 2018" agentes de la Policía Fiscal incautaron la noche del viernes un cargamento de cigarrillos de contrabando que fueron abandonados en un vehículo en el km 20 de la carretera Tacna-Tarata. El hecho ocurrió cuando la Policía observó el auto de placa Z2I-459, cuyo conductor al notar la presencia policial no tuvo mejor idea que darse a la fuga. De inmediato se procedió al registro vehícular hallandose en toral 500 displays de cigarrillos de diferentes marcas, con un valor de 4 mil soles. ', 1, 1, 1, '0', '0', 0),
(147, '2018-04-30', 1, 'Antes del mall y después del mall los viajes a Tacna bajaron  un 17%', 'Números de Migraciones Tacna detallaron leve descenso de visitantes desde Chile a Perú entre antes y después del Mall Plaza. Migraciones Tacna entregó las cifras de antes y después de la apertura en Arica del Mall Plaza, las que arrojaron que por lo menos por Chacalluta, el nivel de ingreso de turistas disminuyó un 17 %. Así lo informó el jefe zonal de Migraciones en Tacna, Percy Pisfil Gonzáles, quien confrimó que el sábado 7 de abril, previo a la inauguración del mall, ingresaron 8386 extranjeros; esta cifra cambió el sábado 14 de ese mismo mes, cuando solo 6977 personas ingresaron a Tacna. La autoridad agregó que el pasado fin de semana hubo un aumento, aunque no alcanzó a llegar a las más de 8 mil personas, como ocurrió el sábado antes de la apertura del mall.', 1, 1, 1, '0', '0', 0),
(148, '2018-05-05', 1, 'Incautan 500 libros falsificados en locales de Dos de mayo', '', 1, 1, 1, '0', '0', 0),
(149, '2018-05-06', 1, '"Jaladores" implicados en venta de droga a turistas', 'El 2 de mayo por la noche agentes de Turismo alertaron a una patrulla sobre 4 varones y una mujer que hacían venta o "pase" de droga a las afueras de una cebicheria de la calle Francisco Cornejo (detrás del Mercado Central ) quienes al darse cuenta de la presencia de la policia quisieron fugar por la Avenida Bolognesi. Se intervino a  Samir Delgadillo Burga de  25 ańos con 13 bolsitas de marihuana en su mochila, Alejandro Perez Ancajicama de Piura, Angel Tarrillo y Juan Arroyo.', 1, 1, 1, '0', '0', 0),
(150, '2018-05-06', 1, 'Hallan encomienda con  15 kilos de cocaina ', 'Un cargamento de droga enviado como encomienda fue interceptado por los efectivos del Departamento Antidrogas de la PNP en coordinacion con el Ministerio Público. La detención se produjo en el control aduanero Tomasiri. La droga fue acondicionada en una cajade carton con esponjas, consistente en paquetes precintados tipo "ladrillo" con un peso de 15 .050 kg de alcaloide de cocaina.', 1, 1, 1, '0', '0', 0),
(151, '2018-05-06', 1, 'Incautan ropa “cachina” valorizada en 60 mil soles', 'Agentes de la Policía Fiscal intervinieron una vivienda donde incautaron 47 de fardos de ropa usada que era almacenada en el inmueble ubicado en el jirón San Salvador con Lambayeque en Juliaca. La Fiscalía Especializada en Delitos Aduaneros de la ciudad de Puno dispuso el internamiento de la mercadería en Aduanas Puno, ninguna persona fue detenida o intervenido.', 1, 1, 1, '0', '0', 0),
(152, '2018-05-06', 1, 'Decomisan contrabando por más de 40 mil soles', 'Gran mercaderia que estaria involucrada en el delito de contrabando valorizada en 41 mil 400 soles fue decomisada por agentes de la Policia Naciona y Aduanas en buses de servicio de transporte interprovincial durante operativos realizados en la carretera binacional. En el lugar se incautó celulares marca Huawei , Sony Xperia, Zapatillas de conocidas marcas y cigarrillos de la marca Carnival. Lo incautado fue internado en Aduanas Ilo.', 1, 1, 1, '0', '0', 0),
(153, '2018-05-06', 1, 'Cae sujeto en posesion de "ketes" con droga', 'Policías del Departamento Antidrogas (Depandro) de Ilo, Grupo “Alfa” al tener conocimiento que en la zona de la plaza Primero de Mayo de Miramar se estaría microcomercializando drogas. A las 16:10 horas del 4 de mayo, intervinieron a Cristian Yermain Pandia Farfan (19) a la altura de la iglesia de Miramar en la avenida principal. No portaba DNI, siendo trasladado a las instalaciones de DEPANDRO, donde fue plenamente identificado. En su poder se le halló 5 envoltorios pequeńos de papel conteniendo en su interior sustancia blanquecina pulverulenta, pasta básica de cocaína.\n', 1, 1, 1, '0', '0', 0),
(154, '2018-05-06', 1, 'Es intervenido con marihuana cerca a colegio de Ciudad Nueva', 'Policías realizaban patrullaje motorizado en la Av. Internacional “frontis del colegio Mariscal Cáceres”,  distrito Ciudad Nueva, interviniendo a un varón  quien merodeaba en actitud sospechosa. No portaba su documento de identidad por lo que fue trasladado a la comisaría de la jurisdicción, siendo identificado como Juan Ticona Ticona (28). \nSe le encontró dos envoltorios plásticos conteniendo hierbas secas, tallos y semillas que eran marihuana. El caso está en investigación para determinar posible microcomercización de droga.', 1, 1, 1, '0', '0', 0),
(155, '2018-05-07', 1, 'Lo detuvieron en el bus con 800 gramos de cocaína', 'Su objetivo era trasladarse a Valparaíso sin imaginarse que terminaría detenido por tráfico de drogas. Este hecho se registró en el control carretero de Cuya. Los efectivos apoyados por la can detector de drogas Beatrice alertaron de un pasajero de un bus interprovincial de Arica-Valparaiso que tenia oculto 845 gramos de cocaína entre sus vestimentas.', 1, 1, 1, '0', '0', 0),
(156, '2018-05-07', 1, 'Masivo operativo dejó a 23 detenidos', 'Carabineros del OS-7 realizó en los ultimos 13 días una intensa labor de fizcalizacion que se concentraron en tres lineas de control, con el resultado de 9 domicilios allanados, 23 personas detenidas (11 peruanos, 8 chilenos, 3 colombianos y 1 venezonalo) . La incautación fue de 8 kilos 969 gramos de clorhidrato de cocaína, 83 kilos 575 gramos de Marihuana y 11 plantas de Cannabis, además de 2.165.000 pesos chilenos, 750 dolares americanos y 120 soles peruanos.', 1, 1, 1, '0', '0', 0),
(157, '2018-05-07', 1, 'Dos detenidos con droga en Chacalluta', 'El chileno F.B.P.C. (19) y la dominicana A.E.R.F.(36) fueron intervenidosen el completo fronterizo Chacalluta tras ser descubiertos con contenedores plásticos con marihuana ocultos debado de sus prendas de vestir. El varón llevaba consigo 7 paquetes plasticos y la mujer uno. Ambos retornaban a Chile de Tacna.', 1, 1, 1, '0', '0', 0),
(158, '2018-05-07', 1, 'Aduanas Chile morderniza trámite de viajeros', 'Para hacer más expedito los trámites aduaneros de admisión o salida temporal de productos que no están contemplados en el equipaje de viajero, el Servicio Nacional de Aduanas implementó un nuevo sistema online que beneficia a aquellos viajeros que portan herramientas especiales, implementos deportivos para competencias o hobbies, instrumentos musicales o equipos de televisión o cine. Esta nueva herramienta, que entró en vigencia en abril, permite emitir anticipadamente una solicitud identificando correctamente las mercancías que no está comprendida en el concepto de equipaje, debiendo ingresarlas o retornarlas al exterior posteriormente sin pagar derechos aduaneros. En este trabajo es clave la colaboración entre las unidades de Aduanas, como los desarrolladores de la Subdirección Informática, que concretaron la solución.', 1, 1, 1, '0', '0', 0),
(159, '2018-05-08', 1, 'Conductor ofreció dinero a un carabinero para evitar la detención por delito de contrabando al interior de Iquique', '30 mil pesos ofreció un conductor de nacionalidad boliviana a un carabinero de la Tenencia Huara para que dejara sin efecto un procedimiento de contrabando, lo que le implicó quedar detenido además por cohecho.', 1, 1, 1, '0', '0', 0),
(160, '2018-05-08', 1, 'Policía interviene camión con camisetas deportivas por S/ 700 mil procedente de Puno', 'El operativo contra los delitos de contrabando y contra la propiedad industrial se efectuó a la noche del sabado 5, en el sector de Acovire Ruta 38,  en el Anexo Challapalca(Tarata) donde se intervinó un camion marca Volvo de placa V5K-712, conducido por Esmildo Tesillo Choque. Policias reportaron la incautación de varios bultos con prendas sin documentación, cuyo valor comercial fue estimado en S/. 700 mil. Segun diligencias preliminares de la PNP, al parecer se trasladaba de Puno a Tacna por esa vía peligrosa, con el fin de burlar a las autoridades.', 1, 1, 1, '0', '0', 0),
(161, '2018-05-09', 1, 'Intervienen camión con 3 mil kilos de cobre', 'Durante el operativo Contrabando 2018 realizado la noche del lunes por agentes  de la Policía Fiscal se intervino un vehiculo entre el km 4 y 6 de la vía Costanera, que trasladaba un cargamento de planchas de cobre. Tras realizar la revisión vehicular, se encontró en la tolva del camión 60 planchas de cobre y 10 sacos de polietileno que contenian cables y restos de cobre, todo con un peso total de 3 mil kilos, el material incautado fue valorizado en 96 mil soles y fue interado en los almacenes de Aduana.', 1, 1, 1, '0', '0', 0),
(162, '2018-05-09', 1, 'Erradican más de 9,200 hectáreas de coca ilegal', 'El Proyecto Especial de Control y Reducción de Cultivos Ilegales en el Alto Huallaga (Corah) ha erradicado 9,213.70 hectáreas de plantas de coca ilegal en las regiones de Ucayali, San Martín y Pasco.\nLa destrucción de los cultivos ilegales se efectuó del primero de febrero al 6 de mayo, de acuerdo con lo previsto en el Plan Anual de Reducción del Espacio Cocalero 2018.\nLas zonas intervenidas fueron los ejes operacionales de Santa Lucía, San Martín, donde se erradicaron 3,459.13 hectáreas; de Ciudad Constitución, Pasco, con 5,161.82 hectáreas; de Aguaytía, Ucayali, se destruyeron 592.75 hectáreas.', 1, 1, 1, '0', '0', 0),
(163, '2018-05-09', 1, 'Mujer investigada por encomienda de droga', 'Magali Méndez Delgado (25) fue capturada en Juliaca luego que acudiera a recoger una carga de droga que llegaba desde Tacna en un bus de la empresa Julsa Ángeles Tours SAC. de placa B3T-968. Méndez desconocía que se trataba de un seńuelo colocado por la Policía Antidrogas en Tacna. Y es que, la carga fue interceptada, el viernes (4 de mayo) en el control de Tomasiri quedando al descubierto 16 paquetes tipo ladrillos acondicionados en una caja de cartón que al peso arrojó 15 kilos y medio de alcaloide de cocaína. La droga en calidad de encomienda llegó por error a Tacna procedente de Cusco, siendo enviada por Huamán Eddy Alberto. Al advertir la equivocación es que la empresa, enviaba la caja a su destino inicial en Juliaca-Puno.\nA fin de atrapar a la persona que debía recibir la droga, es que la PNP ante la presencia de la fiscal Betty Zapana Vargas, colocaron un seńuelo que fue enviado a Puno, dando resultados positivos.La detenida llegó a Tacna durante la madrugada de este martes, siendo custodiada por agentes del Departamento Antidrogas en coordinación con sus pares de Juliaca. Será sometida a investigación para determinar la implicancia de más personas, pues no se descarta que se trate de una organización dedicada al tráfico ilícito de drogas.', 1, 1, 1, '0', '0', 0),
(164, '2018-05-10', 1, 'Cocinero pretendia ingresar a chile con droga pegada al cuerpo', 'En prisión preventiva quedó un cocinero de nacionalidad peruana que fue detectado por el Servicio Nacional de Aduanas cuando trataba de ingresar a Chile con cocaína escondida entre su cuerpo. El hallazgo se registró en el complejo fronterizo de Chacalluta durante las labores de control para evitar el ingreso todo tipo de mercancía ilícita. El Director Regional de la Aduana de Arica, Hugo Yávar Ońate, relató el sujeto se identificó como chef internacional y que viajaba con destino a Santiago a un evento. Sin embargo, al revisarlo hallaron que escondía un paquete con una sustancia blanca en su interior. Fiscalizadores realizaron una prueba de campo al contenido del paquete, determinando que se trataba de 2 kilos 155 gramos de clorhidrato de cocaína. El control de detención se realizó en el Juzgado de Garantía de Arica y el cocinero tacneńo, A.S.C.CH., de 21 ańos de edad, fue formalizado por tráfico de drogas.. La droga incautada puede alcanzar un valor que supera los 43 millones de pesos chilenos en el mercado ilícito.', 1, 1, 1, '0', '0', 0),
(165, '2018-05-10', 1, 'Carga con 6400 chocolates vencidos llegó a Tacna', 'Agentes policiales intervinieron en camión de placa BAW-092 que era conducido por Lázaro Fernando Quezada Machado. El vehículo transportaba cuarenta cajas conteniendo 6400 chocolates de la marca "Toblerone of Switzerland". La mercadería estaba vencida atentando contra la salud de los futuros consumidores. Según la PNP, la carga de importación – previa consulta con la página web de Digesa- tenía fecha de emisión 25 de junio de 2010 y fecha de vencimiento 25 de junio de 2015. Lo incautado fue valorizado en 50 mil soles.', 1, 1, 1, '0', '0', 0),
(166, '2018-05-10', 1, 'sunat inicia atención en renovada sede central', '', 1, 1, 1, '0', '0', 0),
(167, '2018-05-10', 1, 'Decomisan contrabando por S/. 2700', 'Agentes de la Policia Fiscal y de Carreteras hallaron dos bolsas de rafia y un maletin conteniendo ropa extranjera de segundo uso abandonados en la Panamericana Sur, a 100 metros del control cuarentenario de Senasa. El peso fue de 120 kilos con un valor aproximado de 2,700 soles.', 1, 1, 1, '0', '0', 0),
(168, '2018-05-11', 1, 'Desarticulan primera organización dedicada al tráfico de armas desde Estados Unidos', 'Operación Aduanas - PDI - Fiscalía terminó con 12 detenidos y desbarató red de tráfico de armas. El arribo al puerto de Arica de un inocente contenedor con equipos musicales, radios y reproductores de DVD provenientes desde la soleada ciudad-puerto de Miami, fue el final de una investigación que arrojó que lo que finalmente venía dentro del contenedor, era armamento; caso no aislado que llevó a la detención de 12 personas, quienes mantenían una conexión entre Estados Unidos y Chile con la idea de internar armamento a las calles del país.', 1, 1, 1, '0', '0', 0),
(169, '2018-05-11', 1, 'Decomisan mercancia por S/. 65 mil soles', 'Durante un operativo de represión al contrabando los agentes de policia fiscal la noche del miercoles 9 en el distrito de Alto de la Alianza, se interceptó un vehiculo C8X-872 estacionado y cargado de mercaderia importada sin documentación, que sería de procedencia ilegal. El detalle de la mercancia fue de 12 costales conteniendo casacas, carteras y zapatillas nuevas e importadas con un valor total estimado de S/.65 mil.', 1, 1, 1, '0', '0', 0),
(170, '2018-05-11', 1, 'Gobierno sube impuesto a combustibles, licores, gaseosas y cigarrillos.', 'El MEF seńala que medida aumentará la inflacion por alza de precios, mientras SIN advierte que se incrementará el contrabando.', 1, 1, 1, '0', '0', 0),
(171, '2018-05-14', 1, 'Sunat multará a contribuyentes que no lleven libros electronicos', '', 1, 1, 1, '0', '0', 0),
(172, '2018-05-14', 1, 'Sunat tras 17,036 empresas por inconsistencias en ingresos y gastos', '', 1, 1, 1, '0', '0', 0),
(173, '2018-05-14', 1, 'IGV: Registros de ventas de empresas arrojan S/1775 millones en inconsistencias\n', '', 1, 1, 1, '0', '0', 0),
(174, '2018-05-14', 1, 'Lo detienen por venta de estupefacientes', '', 1, 1, 1, '0', '0', 0),
(175, '2018-05-14', 1, 'capturan a hombre que tenia cinco requisitorias por trafico ilicito de drogas', '', 1, 1, 1, '0', '0', 0),
(176, '2018-05-14', 1, 'en operativo incautan 78 kilos de tolina', '', 1, 1, 1, '0', '0', 0),
(177, '2018-05-14', 1, 'exportadores preocupados por el ISC a combustibles', '', 1, 1, 1, '0', '0', 0),
(178, '2018-05-15', 1, 'Decomisan mercancía por S/. 60 mil', 'Gran cantidad de mercadería de procedencia extranjera inmersa en el delito de contrabando valorizado en mas de 50 milsoles, fue decomisado por los agentes de la Policia Fiscal en las ultimas horas en operativos realizados a buses de servicio interprovincial que transitan en la carretera Binacional. La primera intervención se producto en el sector El Común donde se encontrol abandonado  al costado de la carretera tres bultos con cierres y yardas de cierre, por un valor de 31500 soles. En la misma zona se intervino el onmibus de la empresa Pacifico Pulman de placa Z4F-968, donde hallo cigarrillos de la marca Lucky Strike, por 18 mil soles. En otro operativo se intervino el bus de la empresa Sol Andino de placa A6T-957, en cuya cabina se hallaron mas de 15 mil cigarrillos de diferentes marcas.', 1, 1, 1, '0', '0', 0),
(179, '2018-05-15', 1, 'Peruano y tres chilenos implicados en tráfico de 44 kilos de cocaína', 'Escondidos en el piso de un vehículo, efectivos de la Brigada Antinarcóticos y Contra el Crimen Organizado (Brianco) de la PDI encontraron un total de 44 kilos y 660 gramos de clorhidrato de cocaína que iba con destino a Santiago. El hallazgo permitió la detención de tres chilenos y un ciudadano peruano, luego de seis meses de investigación. El jefe regional de la PDI, prefecto inspector Leonardo Torres, explicó que el decomiso realizado por la institución, se hizo en forma conjunta con la Fiscalía del Ministerio Público. La autoridad policial detalló que la droga fue internada por el Complejo Fronterizo Chacalluta. Al ser detectada, se realizó un monitoreo del vehículo hasta su detención en la localidad de Cuya, ubicada a 110 kilómetros al sur de Arica. El avalúo de esta incautación, en caso de haberse logrado su comercialización, supera los 160 millones de pesos.', 1, 1, 1, '0', '0', 0),
(180, '2018-05-15', 1, 'Incautan centenar de prendas de vestir en Pocollay', 'PNP intervino camión que transportaba 4 bultos con prendas de vestir nuevas con marcas registradas. Al no ser justificada la legalidad de la carga, fue incautada y trasladada a las instalaciones de POLFIS para las diligencias de ley.', 1, 1, 1, '0', '0', 0),
(181, '2018-05-16', 1, 'Detienen a peruano con droga liquida en bolsas de leche', 'Ocho bolsas plásticas con cocaína líquida fueron decomisadas por fiscalizadores del Servicio Nacional de Aduanas en el complejo fronterizo Chacalluta. Es la primera vez que se detecta este tipo de ocultamiento, puesto que hasta la fecha los narcotraficantes habían utilizado recipientes de vidrio o plásticos termoestables para tratar de ocultar la droga. El hallazgo se registró en la Isla N° 1 del complejo fronterizo, donde los aduaneros entrevistaron a Heyssen Flores Alvildo de 25 ańos, por el motivo de su viaje. Debido a su evidente nerviosismo, el equipaje fue sometido a una revisión especial con tecnología no invasiva y se ratificaron las dudas de los fiscalizadores. Las 8 bolsas contenían un total de 3 kilos 670 gramos de clorhidrato de cocaína de alta pureza, cuyo valor supera los $73 millones en el mercado ilícito. Heyssen Flores Arvildo en el ańo 2014 cayó en Tacna como parte de una banda de nharcos y estuvo en el penal de Pocollay.', 1, 1, 1, '0', '0', 0),
(182, '2018-05-17', 1, 'Cosmeticos y alimentos podran ingresar a la zona comercial', '', 1, 1, 1, '0', '0', 0),
(183, '2018-05-17', 1, 'Incautan 11 fardos con ropa de segundo uso', 'Durante un operativo vehicular por control de identidad y posible requisitoria en la calle Daniel Alcides Carrion, personal policial  de la comisaria de  Ciudad Nueva incautó la noche del martes gran cantidad de fardos con prendas de vestir de segundo uso y algunas prendas nuevas  valorizado en S./15 mil. Como pasajeros y dueńos de la mercaderia fueron identificados los comerciantes Benjamin Ayala Toma 66 y Maria Choque Llanos. Se conoció que las prendas de vestir fueron internadas en los almacenes de Aduanas por la Policia Fiscal, para el aforo y avalúo respectivo. ', 1, 1, 1, '0', '0', 0),
(184, '2018-05-17', 1, 'Intervienen a dos varones con marihuana', '', 1, 1, 1, '0', '0', 0),
(185, '2018-05-17', 1, 'Descubren alcaloide de cocaína que llegaba en encomienda a Tacna', 'Agentes del Departamento Antidrogas detuvieron a Ruth Jelhen Botton Sotomayor (21) y  Cristian Taype Loayza (24) en circunstancias que recogían dos encomiendas que contenían diversos paquetes con alcaloide de cocaína.La detención se realizó luego de que el personal de Aduanas del control de Tomasiri al efectuar el control y revisión de las encomiendas de un bus de la empresa de transporte Civa, encontró dos encomiendas conteniendo 5 y 6 paquetes tipo ladrillo contenido la droga en mención. Los agentes al coordinar con el fiscal de turno permitieron que dichas encomiendas lleguen hasta la oficina de la empresa de transportes y así montaron una intensa vigilancia, logrando así la  detención del hombre y la mujer.', 1, 1, 1, '0', '0', 0),
(186, '2018-05-18', 1, 'Más de 19 kilos de droga llegaron a Tacna en encomienda', 'Las diligencias se iniciaron el día miércoles cuando la Policía fue alertada por el personal de Aduanas en Tomasiri sobre el hallazgo de droga como encomienda en un bus de la empresa Turismo Civa de placa BAA-105. En la bodega del vehículo se halló una caja que contenía seis paquetes tipo ladrillo que dio positivo a cocaína con un peso de 6 kilos 357 gramos, que tenía como remitente a Cristofer Velásquez Yaranga y como destinatario a Ruth Helen Bottoni Sotomayor. Otra caja contenía 5 paquetes rectangulares también con cocaína con un peso total de 5 kilos 650 gramos que tenía como remitente a Jhan Carlos Huayanay Tapie y como destinatario a Cristian Taype Loayza. De inmediato la Policía se dirigió al terminal Manuel A. Odría donde se intervino en horas de la noche a la pareja que figuraba como destinatarios de la droga cuando se apersonaron a recoger las encomiendas. Los agentes montaron un operativo la madrugada de ayer a las 9 horas ingresaron a la habitación donde se hospedaba la pareja, en la habitación encontraron una nueva encomienda con el nombre de Ruth Helen Bottoni Sotomayor, en donde se encontró 7 paquetes tipo ladrillo con un peso de 7 kilos 295 gramos de cocaína. En total la Policía antidrogas incautó más de 19 kilos de cocaína que tenía como destino Chile.', 1, 1, 1, '0', '0', 0);
INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(187, '2018-05-18', 1, 'Chilena trasladaba droga en vehículo desde Tacna', 'En prisión preventiva quedó la comerciante ambulante ariqueńa Carolina Castilo tras ser interceptada en Chacalluta por funcionarios del Servicio Nacional de Aduanas con 13 kilos 685 gramos de marihuana que llevaba ocultos en la estructura de su automóvil. Según perfiles de riesgo, los fiscalizadores intervinieron el vehículo de patente chilena que regresaba de Tacna. Su conductora indicó que solo llevaba artículos de cumpleańos y el automóvil fue inspeccionado con el camión escáner. Tras detectarse irregularidades en las estructuras  del vehículo, se desarmo la unidad y se halló un total de 24 paquetes forrados en papel aluminio y plástico en el interior del tanque de combustible.', 1, 1, 1, '0', '0', 0),
(188, '2018-05-18', 1, 'Encuentran 80 sacos con algas marinas ocultos cerca de la carretera Costanera', 'Depredadores de algas marinas acumularon 80 sacos de la especie Lessonia Nigrescens, tras ser extraídas del litoral tacneńo. La tarde del miércoles se halo 80 sacos con aproximadamente 40 kilos cada una, en estado de abandono. La policía de carreteras indicó que los sacos con la especia marina estaban debajo de un puente, al costado de esa vía, en la ladera de un cerro y también sobre la arena. Al lugar acudieron representantes del Produce quienes luego procedieron a llevarse los productos.', 1, 1, 1, '0', '0', 0),
(189, '2018-05-19', 1, 'Harán desvío en complejo fronterizo  de Santa Rosa', 'En el marco de la segunda sesión descentralizada "Desarrollo e integración Fronteriza" de la comisión de Relaciones exteriores del Congreso de la República, el Gobernador Regional Omar Jimenez anunció que se viene elaborando el expediente técnico de un desvío vial que descongestionará el tránsito de vehículos en el complejo fronterizo de Santa Rosa. El proyecto conocido como "oreja de Santa Rosa" comprende un desvío de 1.3 kilómetros de extensión con una inversión de 2 millones 940 mil soles y estará a cargo de Provias , se espera que para el segundo semestre  se tenga el desvío vial', 1, 1, 1, '0', '0', 0),
(190, '2018-05-19', 1, 'Instalan comisión mixta que modificará ordenanza edil\n', 'Luego de varias conversaciones, ayer en la municipalidad de Ciudad Nueva se instaló la comisión mixta conformada por regidores y comerciantes de ropa y calzado de segundo uso, cuya finalidad será proponer la derogatoria o modificación de la ordenanza municipal que regula el comercio ambulatorio.\nEsta comisión sesionará el 25 y 30 de mayo, donde elaborarán un dictamen que modifique la referida ordenanza. \n', 1, 1, 1, '0', '0', 0),
(191, '2018-05-21', 1, 'Mercadillos acuerdan paro por mercancías restringidas. Presionarán al Congreso para que apruebe proyecto de Ley\n', 'Los comerciantes afiliados en la AJU Zotac, vienen evaluando acatar un paro de 24 horas para lograr la aprobación en el pleno del proyecto de ley que les permitiría la comercialización de mercancías restringidas en la zona comercial de Tacna.\nSe seńaló que el proyecto de ley podría ser debatida por el parlamento el 15 de junio, fecha en la que un nutrido grupo de dirigentes estarán en Lima para lograr el voto favorable de los parlamentarios. El regidor provincial y ex-dirigente de la AJU Zotac Pascual Chucuya, resaltó como otro punto favorable del proyecto de ley, la ampliación de la franquicia turística para los ciudadanos que tienen DNI de Tacna, así como la vigencia de la Zofratacna hasta el 2048.\n', 1, 1, 1, '0', '0', 0),
(192, '2018-05-22', 1, 'Aju Zotac evalúa convocar a marcha de "concientización"\n', 'Luis Chino, presidente de la Aju Zotac informó que, en reunión de dirigentes, se verá la posibilidad de convocar a una marcha el 15 de junio. El mismo día, el Congreso debatirá el proyecto de ley 27688.\nAdemás, Chino manifestó que en la primera semana de junio se convocará a todos los presidentes y delegados para programar una marcha de concientización para que el Pleno del Congreso apruebe el mencionado proyecto de ley.\nAsí mismo, el presidente de la Aju Zotac manifestó que el proyecto de ley trae muchos beneficios como: las franquicias para tacneńos, la ampliación de partidas arancelarias y, a nivel general de Zofra Tacna, posibilitará la inversión extranjera.\n', 1, 1, 1, '0', '0', 0),
(193, '2018-05-24', 1, 'No pudo ingresar ex - testaferro de Escobar', 'Un individuo de nacionalidad colombiana, de 53 ańos, identificado como William González Pineda, de profesión ingeniero industrial, el cual vivía hace mas de 15 ańos en Perú y a quién se le sindica haber sido el testaferro del traficnte mas poderoso del mundo como es Pablo Escobar, intentó ingresar por el Complejo Fronterizo Chacalluta a Chile, sin embargo el personal de la PDI pudo detectar de que se trataba de un individuo con un amplio prontuario delictual, tanto en Suiza como en Perú y en su país de origen, Colombia, donde la prensa lo sindica como un integrante del otrora cartel de Medellin. Según sus antecedentes, liederaba una mafia de traficantes de armas en Perú, contaba con un amplio prontuario por delitos contra la seguridad pública, narcotrafico, homicidio, tenencia ilegal de armas de fuego y falsificación de documentos, entre otros. Cumplió condena en Suiza por 3 ańos por el delito de lavado de activos  y en Perú cumplió una condena de 4 ańos por el delito de falsificación de documentos, creando una identidad ficticia con la cual vivió en dicho país.', 1, 1, 1, '0', '0', 0),
(194, '2018-05-24', 1, 'Licores incautados fueron trasladados a Aduanas', 'La mańana del 23/5/2018, el personal de Aduanas acudió a la comisaría 24 de Junio para trasladar las mas de mil cajas de licores que incautó la Policía Fiscal el día lunes en una trocha carrozable en la vía Camiara - Toquepala. Se conoció que nadie habría acudido a la comisaría para reclamar los vehículos y el personal policial ańadió que en estos casos no es seguro dar con el dueńo de la mercancía.', 1, 1, 1, '0', '0', 0),
(195, '2018-05-25', 1, 'El ingreso ilegal superó en 5 meses todo el 2017', 'El ingreso de extranjeros a Arica por pasos no habilitados va en franco aumento. Un gran porcentaje de ellos es sorprendido en la línea del tren Arica-Tacna, donde Carabineros realiza una permanente labor de vigilancia.\n\nDurante este 2018, de enero a mayo, Carabineros de la Cuarta Comisaría Chacalluta (F) ha detectado un total de 1.467 personas que ingresaron por distintos pasos no habilitados a Chile, comparado con los 1232 que ingresaron de manera ilegal durante todo el 2017, es decir, de enero hasta diciembre. Esto equivale a un aumento del 19% en los cinco primeros meses, respecto al total del ańo pasado.\nEl mayor, también mencionó que un gran porcentaje de estas personas fueron sorprendidas en el Hito 9 a la altura de la línea del tren Arica-Tacna, otras cerca del borde costero en el Hito 1 y por el Hito 14. Allí han sorprendido a familias completas que traen a sus hijos menores de edad, caminando por la frontera. La mayoría ingresa de noche.\n\nComentó que la mayoría de los casos, vienen con información sobre en qué región del país se van a quedar y lo están esperando familiares directos.', 1, 1, 1, '0', '0', 0),
(196, '2018-05-25', 1, 'Vizcarra da S/100 millones para obras de Tacna', 'La Presidencia del Consejo de Ministros y el mandatario Martín Vizcarra Cornejo arribaron ayer a Tacna y se reunieron con el gobernador regional Omar Jiménez, los alcaldes provinciales y distritales, en el evento denominado "Muni Ejecutivo". Tras analizar los proyectos locales en marcha, se determinó que este ańo el Ejecutivo transfirió a municipios y ha financiado obras nuevas por un valor de más de 100 millones de soles. \nVizcarra explicó que entre los diversos temas se abordaron la carretera Tacna-Collpa-La Paz, la Zona Franca y el nuevo hospital regional. \n\nSobre la vía a Bolivia detalló que solo dos de los tres tramos están en ejecución. Se indicó que el tramo 2 está paralizado por el rompimiento del contrato con la compańía Aldesa. Ordenó al ministro de Transportes, Edmer Trujillo Mori, agilizar la nueva licitación de este componente.', 1, 1, 1, '0', '0', 0),
(197, '2018-05-27', 1, 'Bolivia concluirá tercer tramo de vía Tacna-Collpa', 'Tacna. El embajador de Bolivia, Gustavo Rodríguez Ostria, informó que el Gobierno de su país concluirá la vía que unirá la ciudad de La Paz con Tacna. Esta carretera tendrá en el país altiplánico una extensión de 377 kilómetros.\n\nEl proyecto binacional se denomina Tacna-Collpa-La Paz. En el lado peruano, el Gobierno ya tiene en ejecución dos de los tres tramos. En Bolivia también se tiene tres tramos y los dos primeros ya han sido concluidos al 100%.\nRodríguez sostuvo que la vía permitirá a los bolivianos trasladarse en cuatro horas a territorio tacneńo, en auto. En el 2020 ocurriría ello. ', 1, 1, 1, '0', '0', 0),
(198, '2018-05-27', 1, 'Cubanos transitaban entre Tacna y Chile usando como paso el Hito 9', 'Policías del puesto de vigilancia Bolognesi, al efectuar patrullaje por hitos que colindan con Chile intervinieron al cubano Lázaro Guerrero Padrón (32). Fue sorprendido por el personal policial cuando intentaba ingresar a Perú por el Hito Nro.9.\nAl ser intervenido fue derivado a las instalaciones de seguridad del Estado a fin de que el personal realice las diligencias correspondientes.\nAsí mismo, a las 21 horas, otros cuatro cubanos fueron intervenidos. Tres hombres y una mujer trataban de abandonar Tacna para lo cual ya estaban a punto de cruzar el mencionado Hito Nro. 9.\nYordi Castro Arévalo (34), Gian Peńa Rodríguez (23), Esteban Garcés García (25) y Mey Beatriz Salava Abran (21).\nEllos contaban con ingreso por Puerto Maldonado por lo que, fueron conminados a retirarse del sector, más no fueron detenidos. La PNP los trasladó a inmediaciones del complejo fronterizo Santa Rosa a fin de que puedan retirarse del paso no habilitado.', 1, 1, 1, '0', '0', 0),
(199, '2018-05-28', 1, 'Reglamento de Comercio prohibe labor de cachineros', 'Tacna. El vicepresidente de la Federación de Comerciantes de Ropa y Calzado de Segundo Uso Tacna Heroica (FECONCUTACH), Mario Alanoca Blanco, dijo que encontró vacíos y contradicciones en el reglamento de comercio ambulatorio aprobado por la Municipalidad Distrital de Ciudad Nueva, tales como que no se permite el comercio ambulatorio a cien metro de colegios y recintos deportivos, sin embargo la feria se realiza detrás del colegio Manuel A. Odría y alrededor del estadio, por lo que hay una contradicción pues se les autoriza trabajar en ese lugares. Asimismo, cuestionó que dentro de la tabla de sanciones se incluya sanciones a todo lo que atenten contra lo que es legal y la industria nacional. El dirigente manifestó que, la municipalidad se comprometió a realizar un  nuevo capitulo en la norma que se específicamente para los feriantes de la "cachina", el cual sería expuesto este jueves 31 de mayo en la reunión de la comisión', 1, 1, 1, '0', '0', 0),
(200, '2018-05-29', 1, 'Detuvieron a persona en el aeropuerto fajado con 2 kilos de cocaina', 'Un ciudadano chileno pasó por el detector de metales del aeropuerto de Chacalluta y este se activó. Tal situacion llevo que un funcionario de Aeronautica civil procediera la fiscalizacion encntrando en la zona del estomago un bulto de gran tamańo.  Personal de la OS7 procedió a revisar al pasajero, encontrando bajo sus vestimentas 2 kilos 195 de cocaina en la modalidad de fajado. ', 1, 1, 1, '0', '0', 0),
(201, '2018-05-29', 1, 'Decomisan contrabando por más de S/ 20 mil ', 'Gran cantidad de mercaderia que estaria involucrada en el delito de contrabando, valorizada en mas de 20 mil soles fue decomisada por agentes de la Policia Fiscal en operativos realizados a buses de transporte interprovincial que transitan por la carretera Binacional y Panamericana. En bodegas de un omnibus de la empresa Sol Andino de placa A1-959 se halló mercadería de procedencia extranjera que carecia de documentacion por un valor aproximado de 10 mil soles. Otra incautación de mercaderia de contrabando se dio en el Sector Montalvo en la carretera Panamericana donde se decomisó diversos productos por un monto de S/. 10.500 que eran transportados de manera ilegal.', 1, 1, 1, '0', '0', 0),
(202, '2018-05-29', 1, 'Policia incauta 768 kilos de marihuana "creepy" en Tumbes', 'Agentes policiales del grupo Orión, pertenecientes a la Dirandro de la Policía Nacional, dieron un duro golpe al narcotrafico al incautar 768,700 kilos de marihuana tipo "creepy", los cuales fueron camuflados en 5 rollos de alambre en Tumbes. El hecho se produjo cuando un grupo de sujertos trasladaban la mercaderia de un camión a otro. Al momento de realizar la revisión, los agentes hallaron la droga, la cual esta valorizada en siete millones de dolares, segun información policial. Se lograron intervenir a 10 personas y dos vehiculos de placa AGG-0674 y B4A-808, el primero de matricula ecuatoriana. El pasado 25 de mayo, agentes de la PNP descubrieron el ilegal cargamento escondido en un camión que tenía como destino final ingresar a Chile. ', 1, 1, 1, '0', '0', 0),
(203, '2018-05-30', 1, 'Detienen a ciudadana chilena intentando trasladar droga de Arica a Santiago', 'El hecho se registró cerca de las 3 de la madrugada de ayer cuando carabineros del OS-7 al fiscalizar un bus, con itinerario Arica - Santiago, detectó que una pasajera de nacionalidad chilena mantenia abultada la zona abdominal, estableciendo que mantenia adosada en su cuepo una faja artesanal en la que transportaba droga, logrando incautar 2 kilos 250 gramos de clorhidrato de cocacina.', 1, 1, 1, '0', '0', 0),
(204, '2018-05-30', 1, 'A balazos detienen a contrabadista en Arequipa', 'Agentes del destacamento de la PNP de Carreteras Reparticion evitaron que una camioneta ingrese con ropa de contrabando hacia el mercado de Arequipa. Tras ocho disparos, intervinieron ayer en la madrugada al vehiculo BOS-820, por el sector San José. La persecucion empezo cerca al peaje Matarani, debidoo a la excesiva velocidad y maniobras temerarias que realizaba el conductor. Se incautó 60 chompas y 9 fardos de ropa con un valor aproximado de 3 mil dolares.  A la vez Policia Fiscal tuvo información del ingreso de dos vehiculos de placa V3B-578 y V2S-422  a Evitamiento donde se incauto ropa valorizada en S/ 19 mil 900', 1, 1, 1, '0', '0', 0),
(205, '2018-05-30', 1, 'Fiscalía incauta más de una tonelada de droga con fotos de Pablo Escobar', '', 1, 1, 1, '0', '0', 0),
(206, '2018-05-31', 1, 'Fajado con droga lo detuvieron en Cuya ', 'En esta oportunidad fue sorprendido en estas circunstancias un hombre de nacionalidad peruana. El extranjero fue sorprendido por carabineros del OS7 en la ruta 5 norte kilómetro 1968 del control carretero cuya. Los hechos se registraron ayer cerca de las 3 de la madrugada donde se fiscalizó un bus con itinerario Arica - Santiago. Uno de los funcionarios detectó que un pasajero mantenia abultada la zona abdominal de maner anormal, estableciendo que mantenia adosada a su cuerpo una faja artesanal que transportaba droga, logrando incautar 2 kilos 145 gramos de marihuana. Este es el tercer caso de fajado que se registra en menos de una semana.', 1, 1, 1, '0', '0', 0),
(209, '2018-06-04', 1, 'Hombres caen con droga tratando de ingresar a  Chile', 'Personal policial de investigaciones de Chile intervino a dos varones de nacionalidad peruana que pretendian cruzar la frontera trasladando droga. Los sujetos fueron identificados como Sergio Luis Pacari Cama(20) y Juan Jose Gutierrez Cama(19), siendo interceptados por el hito N°14. Ambos llevaban puestos atuendos de camuflaje militar, probablemente para mimetizarse con el desierto. Además, se les hallo un total de 31 kilos de marihuana. ', 1, 1, 1, '0', '0', 0),
(210, '2018-06-04', 1, 'Se incautaron 2480 cajetillas de cigarrillos en Arica', 'Arica. Un nuevo contrabando de cigarrillos, avaluado en 3 millones 720 mil pesos, decomisó Carabineros de la Sección de Investigación Policial, (SIP) de la Cuarta Comisaría Chacalluta, esta vez en el sector del Terminal Internacional, donde resultaron detenidos un chileno y un ciudadano peruano, entre ellos, un taxista, quien era el encargado de trasladar desde el recinto del terminal de buses, las cajas hasta un domicilio donde eran acopiados. Se logró incautar un total de 248 cartones, lo que hace un total de 2.480 cajetillas, avaluadas en la suma de $ 3 millones 720 mil pesos.\nSegún lo informado, de enero al 29 de mayo del presente ańo, Carabineros de las distintas unidades de la Prefectura, han logrado decomisar un total de 438 mil 635 cajetillas, con 69 casos de contrabando y un total de 65 detenidos. Una cifra que va al alza.\n', 1, 1, 1, '0', '0', 0),
(211, '2018-06-05', 1, 'Incautan más de 30 mil cajetillas de cigarrillos acopiados en domicilios de Arica', 'Como parte del trabajo operativo coordinado constante que existe entre el Servicio Nacional de Aduanas Chile y Carabineros, el miércoles se ejecutó la denominada Operación “Tornado” que tuvo como objetivo combatir el tráfico ilícito de mercancías que se genera en el Norte Grande de Chile. Aduaneros y carabineros intervinieron un total de 12 inmuebles y lograron incautar 30.329 cajetillas de cigarrillos y 1.175 prendas de vestuario falsificado que fueron trasladados desde Perú. Todas estas mercancías pretendían eludir impuestos por más de US$ 124 mil. El director regional de Aduanas de Arica, Hugo Yávar, refirió que este tipo de productos ingresan a Chile tanto por pasos habilitados como no habilitados. “Lamentablemente muchos viajeros internacionales hacen mal uso de su franquicia e ingresan por el paso fronterizo de Chacalluta con dos cartones de cigarrillos, los cuales después entregan a terceros para acopiarlos y enviarlos al sur”, seńaló. ', 1, 1, 1, '0', '0', 0),
(212, '2018-06-05', 1, 'Decomisan contrabando por más de 62 mil soles', 'Moquegua. Gran cantidad de mercadería inmersa en el delito de contrabando valorizada en aproximadamente 62 mil 400 soles, fue decomisada por agentes de la Policía Fiscal en operativos realizados en la carreteras Panamericana y Binacional, a los buses de servicio de transporte interprovincial que cubren la ruta Puno-Tacna. La primera intervención se produjo en la Panamericana a la altura del km 1.152, en el sector conocido como “La Bodeguilla”. A bordo del ómnibus de la empresa Moquegua de placa ZAQ-959, se halló mercadería de procedencia extranjera consistente en 180 pares de zapatillas para adultos. ', 1, 1, 1, '0', '0', 0),
(215, '2018-06-07', 1, 'Sorprenden a mujer con 10 kilos de droga en una maleta', 'Personal del Departamento Antidrogas de la Policia Nacional en Arequipa detuvo, este miercoles a las 9:30 horas, a una mujer que llevaba más de 9 kilos de droga. La intervención se realizó en el Terminal Terrestre cuando Marcelina Leche Quispe(38) llegó desde Ayacucho y fue aborada por los agentes, quienes ya tenian conocimiento de que llevaba droga. Cuando revisaron su maleta, entre su ropa, encontraron 10 paquetes tipo ladrillo. Al ser analizados dieron positivo para pasta basica de cocaina. La mujer fue detenida y llevada a la sede del Departamento Antidrogas de Policía.', 1, 1, 1, '0', '0', 0),
(216, '2018-06-07', 1, 'Microcomercializacion de drogas', '', 1, 1, 1, '0', '0', 0),
(217, '2018-06-08', 1, 'Evalúan liberación de tres peruanas que habrian tragado ovoides de droga', 'La defensora Penal Pública, Sofía Makaus, presentó un recurso de amparo solicitando la libertad inmediata de tres mujeres de nacionalidad peruana ( Norinarda López Vidal (24), María Ortega Herrera (27) y Nora Escalante Mendoza (28) ) que fueron detenidas por la PDI en el Complejo Fronterizo Chacalluta por haberse tragado ovoides antes de ingresar a Arica, debido que los supuestos ovoides no fueron evacuados a pesar de haber transcurrido 12 horas. El fiscal Daniel Valenzuela expuso que las imputadas fueron revisadas por un body scan donde se detectó la presencia de cuerpos extrańos en su estomago y lo mismo reflejó una radiografia en el Hospital. La jueza Leticia Rivera rechazo el recurso y las mujeres siguen detenidas.', 1, 1, 1, '0', '0', 0),
(218, '2018-06-08', 1, 'Incautan en Lima 230 celulares de contrabando que iban a mafias de extorsionadores en el Norte del País', 'Lima. La  Dirección de la Policía Fiscal detuvieron ayer a Juan Jesús Palacios Valencia (48) intersección de las avenidas 28 de Julio y Manco Cápac, en La Victoria, con 230 celulares de alta gama, adquiridos de contrabando, presuntamente para entregarlos a organizaciones criminales -en prisión y en libertad- dedicados a la extorsión, estafa, chantaje, y robo agravado. Estos equipos móviles iban a ser distribuidos en Chiclayo, Piura y Tumbes, indicó el coronel PNP Segundo Mejía. Palacios Valencia, natural de Arequipa, ingresó por Bolivia 100 celulares Huawei P20 Lite, 30 Huawei Mate 10 Lite y 100 celulares Samsung Galaxy J2 Prime valorizados en el mercado nacional en S/ 700 mil. “Estos celulares no están registrados en la lista blanca, pero como no son robados tampoco están en la lista negra. Es por eso que van a parar a distintas mafias de extorsionadores”, explicó a la prensa el coronel Mejía. El oficial aseguró que los operativos que viene realizando esta unidad policial apuntan principalmente a desbaratar el negocio de contrabandistas y ladrones de celulares.', 1, 1, 1, '0', '0', 0),
(219, '2018-06-08', 1, 'Liberan a chilena que trasladaba armas de fuego por el complejo Fronterizo Chacalluta', 'Tras permanecer 24 horas detenida en el Departamento de Investigacion (Depincri) Tacna, por tratar de ingresar a Tacna con dos armas de fuego y municiones escondidas debajo de sus prendas de vestir, la ciudadana chilena Veronica Supo Alvarez(37) fue dejada en libertad por disposicion fiscal. La Policía habria determinado que las armas era efectivamente de fogueo(réplicas). Ademas la mujer termino por confesar que, por necesidad, aceptó la propuesta de un varón en Arica de trasladar a Tacna a cambio de 300 soles. ', 1, 1, 1, '0', '0', 0),
(220, '2018-06-08', 1, 'Cubanos volvían de Chile por la pampa', 'Cuatro cubanos fueron intervenidos a las 23h del miercoles en el Hito 9 de la frontera con Chile, tras ingresar del vecino pais al Perú de forma ilegal. Se trata de Leuman Sanchez Castillo(24), Raul Casa Brito(48), Sucel Pato García(48), Yenedit Sierra Barrera(34), quienes fueron interceptados por agentes del puesto Francisco Bolognesi y entregados a Seguridad del Estado.', 1, 1, 1, '0', '0', 0),
(221, '2018-06-09', 1, 'Decomisan licores por S./ 300 mil en la carretera Tacna-Tarata', 'Raúl Alanoca Mamani (31), Noé Mamani Colque (32), David Juculaca Quispe (34) y Olga Sonia Perca Alanoca (27), quedaron en calidad de detenidos en las instalaciones de la comisaría 24 de junio, distrito Gregorio Albarracín. Los cuatro están implicados en el delito de contrabando al ser intervenidos junto a una carga de 492 cajas de licor valorizadas en de 300 mil soles, todo ello transportado en un camión que fue valorado en 50 mil dólares. El operativo se realizó en el kilómetro 7 de la carretera Tacna-Tarata a las 09:00 horas del 08 de Junio, cuando al parecer la mercadería ilegal iba a ser transportada a Puno o Bolivia. Se conoció que Mamani Colque, presenta antecedentes por caso similar. Él fue intervenido el 25 de noviembre del 2015 con un cargamento de licor. En aquella oportunidad, la policía fiscal tuvo que realizar disparos al aire para detenerlo. El hecho ocurrió en la carretera Tacna-Tarata.El jefe del Depincri, comandante PNP Jesús Montesinos Carpio, indicó que el camión habría sido despojado de la placa para no ser identificado, pero de todas formas verán el código del motor.', 1, 1, 1, '0', '0', 0),
(222, '2018-06-09', 1, 'Detienen a requisitoriado por contrabando', 'Alto de la Alianza. Agentes de la comisaria de Alto de la Alianza detuvieron a Hans Huayaba Chujandama(40), natural de Ucayali, quien tenia una requisitoria por el delito de contrabando, solicitada por el Juzgado Penal Supraprovincial de Tacna mediante oficio Nro. 92-2018. Huayaba fue detenido en medio de un operativo de control de identidad la noche del jueves en el distrito de Alto de la Alianza.', 1, 1, 1, '0', '0', 0),
(223, '2018-06-09', 1, 'Aduanas declara viable la donación de 7 toneladas de ayuda humanitaria para zonas andinas', 'El jefe de la oficina de Defensa Nacional, Julio Gil dio a conocer que solicitó a la Superintendencia Nacional de Aduanas y de Administración Tributaria(SUNAT), la donación de más de 7 toneladas de ayuda humanitaria para distritos de la zona andina de la región con el objetivo de enfrentar las bajas temperaturas, heladas y nevadas.Gil seńalo que la respuesta ha sido positiva. “El expediente que enviamos se recibió y lo declararon viable, a más tardar el miércoles debe estar la resolución para que al dia siguiente sea la entrega. Esta ayuda se dará a los distritos que no fueron atendidos los que se ubican por debajo de los 3 mil 500 metros sobre el nivel del mar”.', 1, 1, 1, '0', '0', 0),
(224, '2018-06-10', 1, 'Cultura recuperó 70  piezas arqueologicas en Vińani', 'Tacna. Cerca de 70 piezas arqueológicas fueron recuperadas este viernes por la Dirección Desconcentrada de Cultura y la Policía Nacional en Vińani. Los restos, entre textiles, vasijas y huesos, estaban en poder de Alex Maquera Catacora. El hallazgo se suscitó durante la tarde, cuando ciudadanos alertaron a funcionarios de la Dirección Desconcentrada de Cultura que un usuario de Facebook estaba ofreciendo los bienes culturales de origen prehispánico en el grupo denominado “Tacna libre – compra y venta”.  Enterados de la oferta, los funcionarios de Cultura contactaron con el usuario “Alex Maquera” de Facebook, quien los citó a la asociación de vivienda La Unión I etapa, manzana 138 lote 07, en el sector de Vińani, distrito Crnl. Gregorio Albarracín Lanchipa. Por ello los funcionarios convocaron a personal policial para la constatación. ', 1, 1, 1, '0', '0', 0),
(225, '2018-06-10', 1, 'Incautan 175 celulares valorizados en 305 mil soles', 'En un operativo, la Policía y personal de Aduanas incautaron 175 celulares de gama alta de las marcas Huawei y Samsung valorizados en más de 305 mil soles. La intervención se realizó a la altura del peaje Montalvo (Moquegua) en la Panamericana Sur al bus de la empresa de transportes "Moquegua". Los suboficiales y representantes de Aduanas revisaron el salón de pasajeros y la bodega, hallando los equipos que presuntamente eran transportados por el ciudadano John Meliton Ponce Padilla de 62 ańos. El bus interprovincial se trasladaba de Tacna hacia Arequipa. Meliton fue intervenido por el presunto delito de contrabando. La mercadería es de procedencia extranjera.', 1, 1, 1, '0', '0', 0),
(226, '2018-06-10', 1, 'Arica. Transportista mantenia una boutique rodante de contrabando', 'Arica. “La Pestańa” es el nombre del camino no habilitado por donde intento salir del país un transportista chileno de 49 ańos, quien fue sorprendido por Carabineros de la Tenencia de Visviri que al ser fiscalizado le hallaron distintas prendas de vestir, avaluadas en 43 millones de pesos, de contrabando.', 1, 1, 1, '0', '0', 0),
(227, '2018-06-11', 1, 'Se exporta mas de 3.800 cebolla al ańo', 'Tacna. Como parte del crecimiento agroexportador que se despliega en Tacna, el Ministerio de Agricultura y Riego(MINAGRI), informó que más de 3,800 toneladas de cebollas se exportaron con destino a Chile durante la primera parte del ańo que se cultiva en La Yarada Los Palos, Locumba e Ite. ', 1, 1, 1, '0', '0', 0),
(228, '2018-06-11', 1, 'Gobierno chileno alerta ante posible llegada de ilegales por mar', 'Arica. Según la Armada de Chile, ya se han detectado dos modalidades de ingreso ilegal vía marítima al país. El aumento de vigilancia en la frontera terrestre y la exigencia de visas de turista a ciudadanos haitianos. Esos serían los dos principales factores que incrementarían la llegada de inmigrantes ilegales en precarias embarcaciones. Si bien en Arica, las autoridades explicaron que aún no registran este tipo de fenómeno en la zona, desde el nivel central de la Armada detallaron que a nivel país ya han detectado dos modalidades de ingreso: por medio de embarcaciones que zarpan desde países limítrofes -Perú en concreto- con destino a puertos de la zona macronorte del país y por polizones a bordo de naves más grandes, de diferentes partes del mundo. ', 1, 1, 1, '0', '0', 0),
(229, '2018-06-11', 1, 'Camion tipo optimus traía cigarrillos de contrabando debajo de 22 mil kilos de soya', 'Arica. 22 toneladas de torta de soya a granel en forma de pellets fue lo único que declaró como carga, un transportista boliviano que ingresaba a Chile por el Complejo Fronterizo Chungará. Por lo mismo y ante las sospechas, personal de Aduanas utilizó fibroscopios para determinar si algo más había aparte de ese cargamento, lo que finalmente fue descubierto, luego de hallar y decomisar 75 cajas de cigarrillos y 99 cartones sueltos de la marca paraguaya Mill Blue. Tras el procedimiento, el conductor, quien venía de Santa Cruz con destino al puerto, fue denunciado por contrabando y se presentará una querella. En tanto, el director regional de Aduanas, Hugo Yávar Ońate, detalló "que el total decomisado fue de 38.490 cajetillas y los impuestos dejados de percibir llegan a más de 84 millones de pesos".', 1, 1, 1, '0', '0', 0),
(230, '2018-06-12', 1, 'Piden cárcel para cuatro presuntos contrabandistas de licores', 'Cuatro personas intervenidas el viernes 8 en el kilometro 7 de la carretera Tacna-Tarata, junto a un camion sin placas que transportaba licores importados sin documentacion por un valor de 300 mil soles. Tres de los cuatro acusados por el delito de contrabando fueron enviados a prisión de forma preventiva este lunes por el sexto juzgado de investigación preparatoria. Los imputados fueron detenidos el viernes de la semana pasada con cajas de licores, por un valor económico de 300 mil soles. Con esta decisión, Noé Raúl Alanoca Mamani de 31 ańos, David Mamani Colque de 32 ańos y David Juculaca Quispe de 34 fueron trasladados a la cárcel de Pocollay. El fiscal Percy Maquera Lupaca sustentó el peligro de fuga de estas tres personas debido a que no tienen arraigo familiar en Tacna. La cuarta persona acusada fue Olga Sonia Perca Alanoca de 27 ańos. La jueza impuso contra la ciudadana la comparecencia restringida y una caución económica.', 1, 1, 1, '0', '0', 0),
(231, '2018-06-12', 1, 'PDI incauta 1.459 kilos de droga y detuvo 6 personas ', 'En el procedimiento se recuperó el total de 1.459 kilos de clorhidrato de cocaína, cocaína base y cannabis sativa; narcóticos avaluados en más de 20 mil 200 millones de pesos, según proyecciones ofrecidas por la misma PDI. El decomiso récord de la operación es el de mayor cantidad registrado en Tarapacá hasta la fecha, superando la tonelada incautada en el ańo 2015. La organización conformada por 6 integrantes, tenía como líder a un ciudadano de nacionalidad boliviana, el mismo fungía como financista. El resto de los miembros son chilenos, la mitad de ellos residentes en Tarapacá y el resto en la Región de Coquimbo. La PDI haciendo uso de unidades aeropoliciales hizo un seguimiento a la banda de narcotraficantes por las rutas de ingresos internacionales, rutas alternativas a la 5 norte hasta la cuarta región. Allí fueron intervenidos logrando el decomiso. Todos los imputados fueron formalizados por tráfico de drogas y asociación ilícita y quedaron en prisión preventiva por los 120 días que dure la investigación.', 1, 1, 1, '0', '0', 0),
(232, '2018-06-13', 1, 'UPROVE interna en aduanas vehículo sospechoso', 'Agente de la Unidad de Protección Vehicular (UPROVE) internaron el vehículo de placa V6F-792 en las instalaciones de Aduanas, por haber ingresado ilegalmente al país con partes adulteradas.', 1, 1, 1, '0', '0', 0),
(233, '2018-06-13', 1, 'Incautan celulares y ropas de contrabando en Carreteras', 'En operativos de la Policía Fiscal de la Región Moquegua se incautó equipos y ropa de contrabando por más de 300 mil soles en los buses que circulaban por las carreteras provenientes de Tacna pero con destino a Arequipa y Puno. La Policía Fiscal y personal de Aduanas incautaron 175 celulares de gama alta valorizados en mas de 305 mil soles a la altura del peaje Montalvo en la panamericana sur en un bus de la empresa transportes Moquegua, con placa de rodaje B7D-967 transportados por el ciudadano John Meliton Ponce Padilla de 62 ańos. También se logró intervenir el bus interprovincial de placa de rodaje A2K-951 de la empresa de transportes Sol Andino, procedente de la ciudad de Tacna con destino a Puno, donde al realizar el registro en el salón de pasajeros del segundo nivel se encontró distribuidos por distintos sitios mercancía de procedencia extranjera, sin que ningún pasajero se identifique como propietario de dicha mercadería, el monto de la mercancía asciende aproximadamente en 7,890 soles', 1, 1, 1, '0', '0', 0),
(234, '2018-06-14', 1, 'Auto entraba al país por la pampa y lo abandonan', 'Efectivos del puesto de vigilancia fronterizo Francisco Bolognesi la noche del martes vieron un vehículo motorizado en forma sospechosa ingresaba por la pampa fronteriza, y su conductor al notar la presencia policial se bajó de la unidad y corrió al territorio chileno, aprovechando la oscuridad.  En el lugar se encontró un auto negro de placa chile WL-3135 que fue abandonado después de ser visto desplazándose del sur del Perú al norte de Chile. ', 1, 1, 1, '0', '0', 0),
(235, '2018-06-14', 1, 'Lo fiscalizaron por andar con luces apagadas y le encontraron cigarrillos', 'Arica. Un control vehicular, terminó con un conductor detenido por dos delitos; un desacato y contrabando de cigarrillos. Todo ocurrió cuando carabineros de la Tercera Comisaría observaron que un camión se trasladaba con sus luces apagadas, por tal motivo procedieron a fiscalizarlo. El personal policial le solicitó al conductor su licencia y la documentación del vehículo, manifestando éste que no las mantenía, como asimismo se le solicitó la guía de libre tránsito para ver la mercancía que portaba consigo, respondiendo no mantenerla indicando a la vez que transportaba cigarrillos. A raíz de lo anterior, los funcionarios consultaron a la unidad policial los antecedentes del chofer, arrojando que este mantenía su licencia de conducir suspendida por un periodo de dos ańos, tras ser condenado por un manejo en estado de ebriedad, el 15 de noviembre del 2017, por lo que procedieron a su detención. En el procedimiento se le incautaron 2.787 cartones de cigarrillos de diferentes marcas, avaluados en 12 millones de pesos, los que quedaron a disposición del Servicio Nacional de Aduanas Chile. El conductor, de 34 ańos, ayer fue formaliza por el fiscal Carlos Eltit por los delitos de desacato y contrabando. Quedó en libertad.', 1, 1, 1, '0', '0', 0),
(236, '2018-06-14', 1, 'Mujer volvió de Chile con 11 mil dólares ocultos', 'Tacna. Dinero fue incautado y la intervenida la comerciante puneńa Dora Ramos Copa(29) en el Complejo Fronterizo Santa Rosa el martes por la tarde, cuando la mujer retornaba de Chile en  un colectivo por presunto lavado de activos dijo que dinero era producto de la venta de artículos para el reciclaje ya que la fuerte suma de dinero no fue Declarada a la SUNAT. ', 1, 1, 1, '0', '0', 0),
(237, '2018-06-18', 1, 'Exportación pesquera', 'La exportación pesquera para consumo humano, en los primeros cinco meses del 2018, habría crecido  80%, respecto al similar periodo de 2017, estimó el nuevo Presidente del Comité de Pesca y Acuicultura de la Sociedad Nacional de Industrias(SIN), Carlos Milanovitch. De acuerdo a esta proyección, los envíos superarían los 900 millones de dólares en dicho periodo del 2018. ', 1, 1, 1, '0', '0', 0),
(238, '2018-06-18', 1, 'Detienen a “burrier” peruano que llevaba 97 capsulas de droga', 'Control Fronterizo Chacalluta. Un ciudadano peruano intentó el sábado cruzar el  Control Fronterizo  Integrado llevando en sus entrańas un cargamento de droga que tenia como destino Chile.  Sin embargo, los carabineros descubrieron su ilegal mercadería.  Jesús  Walter Llachi Monasterio de aproximadamente 27 ańos fue traicionado por su nerviosismo cuando estaba apunto de cruzar el control de Chacalluta, parte custodiada por los chilenos. Los carabineros  intervinieron a Llachi, a quien conminaron a que pase el “body scan”,  el cual alertó sobre la presencia de unos objetos extrańos en su estomago. Según los interventores, el peruano tenia los ojos brillosos y expelía un fuerte olor a látex en su boca. Tras interrogarlo el joven peruano aceptó ante las autoridades chiles haber tragado un total de 95 capsulas de droga que dieron positivo a Clorhidrato de cocaína con un peso total de  un kilo 195 gramos. ', 1, 1, 1, '0', '0', 0),
(239, '2018-06-19', 1, 'Hombre es detenido por robar cartera en Tomasiri', 'Tacna. En el control aduanero de Tomasiri, personal policial de Sama Inclán intervino a Anthony Gutiérrez Quispe(23) tras ser acusado por una mujer que viajaba a bordo de un bus interprovincial de haberle robado su cartera que contenía 1000 soles, 122 dólares y 103 mil pesos chilenos. El sujeto aceptó el hurto y fue trasladado a la comisaria del sector. La mujer formalizó la denuncia por el delito contra el patrimonio.', 1, 1, 1, '0', '0', 0),
(240, '2018-06-19', 1, 'Decomisan contrabando por más de S/. 39 mil', 'Moquegua. Gran cantidad de mercadería de contrabando valorizada en 39 mil 400 soles, fue decomisada por agentes de la Policía Fiscal cuando realizaban un operativo  policial en la carretera Panamericana, a la altura del sector La Bodeguilla. La Policía halló en el lugar mercadería ilegal en bultos, consistente en 22 casacas para nińos, 12 conjuntos de buzos para nińos, 187 chompas para damas,  12 casacas para adultos, 10 pantalones para damas, 12 chalecos para nińos, 52 chompas para varón y 5 chompas para nińas.', 1, 1, 1, '0', '0', 0),
(241, '2018-06-20', 1, 'Policía incauta licores por 700 mil soles', 'Tacna. Tras realizar labores de inteligencia, personal policial del grupo Terna, incautó gran cantidad de cajas con licores de contrabando  valorizados por 700 mil soles que eran almacenados en un inmueble ubicado en la vía Tacna-Tarata. La Policía habría tomado conocimiento sobre la existencia de esta vivienda destinada como almacén de la ilegal mercadería.  El chofer y su acompańante, al darse cuenta de la presencia policial, emprendieron la fuga, perdiéndose de la vista por la neblina. Se logró incautar 240 cajas de finos licores entre ellos ron Abuelo, Bacardi, Red Label, Amarula y otros en la vivienda ubicada en la Mz. E lote 16 de la Asociación Las Vegas la noche del último lunes 18. ', 1, 1, 1, '0', '0', 0),
(242, '2018-06-20', 1, 'Mal aliento delató a joven de 21 ańos que venía con 95 ovoides de cocaína', 'Arica.  Un fuerte hálito a látex, típico de la goma que emanan los envoltorios ovoidales, por parte de un hombre de 21 ańos, fue lo que esta vez llamó la atención al OS-7 en Cuya, en medio de la fiscalización en un bus que partía a Santiago. Fue ahí que entre conversa y conversa, el extranjero evidenció cierto nerviosismo y terminó por el olor correspondía a los 95 ovoides que llevaba en su interior. Según el teniente coronel Claudio Hermosilla, en total fueron 95 ovoides con cocaína, equivalentes a un kilo 195 gramos de droga. Jesus Walter Llachi fue formalizado y quedó en prisión preventiva. ', 1, 1, 1, '0', '0', 0),
(243, '2018-06-20', 1, 'Recaudación tributaria creció en mayo', 'SUNAT informó que la recaudación ascendió a S/8199 millones en mayo, monto superior en S/1539 millones respecto del periodo del ańo pasado;  ello representa un crecimiento de 22%. Asimismo, este aumento se debe a la recuperación de las actividades económicas, destacando el consumo y la inversión, como también la aplicación de medidas de política tributaria', 1, 1, 1, '0', '0', 0),
(244, '2018-06-21', 1, 'Decomisan 160 mil soles en ropa de contrabando', 'Puno. Cerca de 163 mil soles en mercadería de contrabando y un vehículo valorizado en 260 mil 800 soles fueron incautados en el control aduanero de Ojherani por personal de la Policía Fiscal de la provincia de Puno. La mercadería consta de miles de unidades de medias, brasieres, mantas para bebé, audífonos de teléfono, cierre de prendas, leggins y guantes, los cuales estaban siendo trasladados a bordo de dicho vehículo desde Bolivia. El total de la mercadería no tenia documento alguno que acredite su origen y su comercialización licita, indicaron fuentes policiales. Además fueron detenidos, Elmer Hermógenes Cruz Nina de 37 ańos y Fernando Paye Quispe de 30, conductor y copiloto, respectivamente. El vehículo incautado tenía la placa D3M891/Z1K-978 marca Volvo Modelo FH12', 1, 1, 1, '0', '0', 0),
(245, '2018-06-21', 1, 'Intervienen a 5 requisitoriados que pretendían ingresar al país', 'Personal policial detuvo a 5 requisitoriados que pretendían ingresar a nuestro país por el control fronterizo Santa Rosa, el martes 19 de junio. Los sujetos detenidos identificados como: Dora Julca Romero (39), quien tenía cinco denuncias por tráfico ilícito de drogas, Irma Choque Ramos(44) por uso de documentos falsos , Efraín Huanca Poma(33), solicitado por tenencia ilegal de armas. Además de otros dos detenidos por el delito de omisión a la asistencia familiar. ', 1, 1, 1, '0', '0', 0),
(246, '2018-06-21', 1, 'Aduanas Chile rematará de un Audi a una bolsa de golillas', 'Arica. Aduanas Chile  comenzará a exhibir desde hoy artículos que serán subastados el próximo 1 de julio.  ', 1, 1, 1, '0', '0', 0),
(247, '2018-06-21', 1, 'Ofreció $4 millones a un carabinero: cifra récord', 'Arica. Un conductor ofreció nada menos que la suma de 4 millones 480 mil pesos al jefe de un retén de Carabineros para que dejara sin efecto un procedimiento por un delito de contrabando en la comuna de General Lagos, siendo la primera vez en la región que ofrecen una cifra tan alta a un funcionario policial. El hombre terminó detenido por el delito de cohecho.  ', 1, 1, 1, '0', '0', 0),
(248, '2018-06-22', 1, 'FF. AA. lucharán contra el narcotráfico', 'El Congreso de la República oficializó la Ley N° 30796 , que autoriza la participación de las Fuerzas Armadas en acciones de interdicción contra el tráfico ilícito de drogas en zonas declaradas en estado de emergencia. ', 1, 1, 1, '0', '0', 0),
(249, '2018-06-22', 1, 'Camionero : “No sabía que era un delito ofrecer dinero”', 'Arica. Es el tercer camionero de nacionalidad boliviana detenido en menos de una semana por el delito de cohecho. El  imputado fue fiscalizado por Carabineros en la ruta 11CH, el cual no tenía la documentación de la carga. El hombre ofreció 5 mil pesos al funcionario policial para dejar sin efecto el procedimiento. En la audiencia  el imputado seńaló que no sabía que ofrecer dinero era un delito. La jueza Paulina Zúńiga le manifestó que en Chile ofrecer dinero a un carabinero está sancionado. Quedó en libertad.', 1, 1, 1, '0', '0', 0),
(250, '2018-06-22', 1, 'Contrató “coyotes” para ingresar a su hijo a Chile', 'Arica. Una mujer venezolana, contrató en Tacna los servicios de los denominados "coyotes" para ingresar a su hijo de 3 ańos a Chile de manera ilegal. La mujer no contaba con la documentación correspondiente del menor para que entrara al país. Su objetivo era reunirse con su pareja, quien llegó antes a Chile en búsqueda de trabajo. Ayer, el fiscal Manuel González formalizó a los ciudadanos peruanos Shirley Pacori (20) y Michael Verasatégui (26) por el delito de tráfico de migrantes. El persecutor expuso que los hechos se registraron a las 20 horas, cuando la mujer llegó al control de Chacalluta, realizó el trámite con una documentación que indicaba que viajaba sola y luego se retiró, ingresó a otra isla y luego la vieron con un menor de edad. "Acordó con los imputados la facilitación de medios con la finalidad de ingresar al país de manera irregular a su hijo con fines de lucro; una vez detectados la víctima declaró", expuso el fiscal, quien solicitó como cautelar la prisión preventiva, argumentando que este delito, al tener como víctima a un menor de edad, la pena se eleva al nivel de crimen.  ', 1, 1, 1, '0', '0', 0),
(251, '2018-06-23', 1, 'Caen “coyotes” peruano llevando a nińo venezolano', 'Arica. Una pareja de “coyotes” fue detenida en el complejo fronterizo de Chacalluta, en Arica(Chile), cuando llevaban a un nińo venezolano de tres ańos con documentos falsos para dejarlo en Arica con su familia. Los peruanos Shirley Pacori(20) y Michael Verástegui(26) quedaron con una medida de prisión preventiva por el presunto tráfico de migrantes. El modus operandi de los “coyotes” fue trasladar al menor como parte de su familia con documentos falsos ya que no poseía la documentación necesaria. Mientras que la madre venezolana, quien sí tenía documentos, viajaba cerca de ellos. El plan resultó para los “coyotes” y la mujer, sin embargo, miembros de la PDI notaron que luego de pasar los controles migratorios la mujer venezolana se llevaba al nińo, por lo que fue interrogada y terminó confesando y revelando esta nueva modalidad de tráfico de migrantes. ', 1, 1, 1, '0', '0', 0),
(252, '2018-06-23', 1, 'Carabineros incautó en furgón 88 baterías usadas', 'En el sector del Hito 9, por la Ruta 5 Norte, personal de la Cuarta Comisaría Chacalluta, detectó un contrabando de baterías que transportaba un furgón a la altura del kilómetro 2.091, lugar donde realizaban un patrullaje preventivo nocturno por los pasos no habilitados y que son utilizados con el propósito de evadir todos los controles migratorios. Según lo informado por el comisario de la unidad, los efectivos policiales recorrían la ruta cerca de las 01.15 de la madrugada, donde fiscalizaron un vehículo utilitario con patente peruana, en cuyo interior se trasladaban dos personas de la misma nacionalidad, cuando intentaban salir del país por un paso no habilitado. Tras ser interceptado y controlado el furgón, se logró ubicar en el interior un total de 88 baterías automotrices usadas, de diferentes marcas, sin ninguna documentación mercantil ni permisos para el traslado de esta carga altamente nociva para el medioambiente, razón por la cual fueron detenidos los ocupante. El jefe de la Sección de Drogas O.S.7, teniente coronel Claudio Hermosilla, resaltó que dentro de estos cargamentos, se encuentran altas cantidades de químicos como el ácido sulfúrico, que es un precursor esencial para la elaboración de drogas como la pasta base de cocaína y clorhidrato de cocaína.', 1, 1, 1, '0', '0', 0),
(253, '2018-06-25', 1, 'Hombre con requisitoria quiso viajar a Chile', 'En el Complejo Fronterizo Santa Rosa fue capturado el viernes Ricardo Manrique Meléndez(24), quien tenía una requisitoria por violación sexual en perjuicio de una menor de 13 ańos de edad.  Manrique fue esposado y llevado a la carceleta del Poder Judicial para las diligencias de ley.  ', 1, 1, 1, '0', '0', 0),
(254, '2018-06-25', 1, 'Productores de Huanuara exportan cinco toneladas de orégano hacia Suiza', 'Un cargamento de cinco toneladas de orégano procedente del distrito de Huanuara será exportado al país europeo de Suiza, siendo la tercera entrega que realizan los productores de la zona andina. El acto se realizó  ayer como parte de las actividades por el Día del Campesino. Los exportadores son 25 socios de la Asociación de Productores de Orégano “La Muralla”, quienes cultivan 20 hectáreas en Huanuara.  Contó que son 20 las toneladas exportadas en tres ocasiones y esperan continuar sacando el producto al mercado internacional. ', 1, 1, 1, '0', '0', 0),
(255, '2018-06-25', 1, 'Exportaciones regionales crecen 21.8 % en periodo enero-abril 2018', 'Las exportaciones regionales, sin contar Lima y Callao, sumaron más de 10 mil 147 millones de dólares entre enero a abril de este ańo, monto mayor en 21.8% respecto al similar periodo del 2017. De las 23 regiones, 16 tenían el sector tradicional como el más importante por monto exportado(Arequipa, Ancash, Cusco, Ica, Apurímac, Moquegua y Puno principalmente), precisa el boletín regional de Área de  Inteligencia comercial de Adex.  Mientras que otras siete resaltaban por su oferta con valor agregado(Piura, La Libertad, Lambayeque, Tacna, Tumbes, San Martín y Huanuco),  seńala el documento. A diferencia de ańos anteriores, este ańo solo cinco regiones registraron descensos en sus envíos en el primer cuatrimestre, Apurimac(-4.4%), Tacna(-21.5%), Huancavelica(-40%), Ucayali(-6.8 %) y Huanuco(-59.6%).', 1, 1, 1, '0', '0', 0);
INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(256, '2018-06-26', 1, 'Intervienen camiones con mercadería de contrabando', 'Juliaca. Un operativo policial realizado en la vía Conima-Tintali, culminó con la incautación de 25 kilos de hoja de coca y 52 pares de zapatillas de contrabando.El operativo se realizo a las 06:30 horas del domingo en el lugar denominado “Y” de la referida vía, en donde se intervino el camión con placa de rodaje Z5F-846.  Una vez que los agentes lograron verificar el cargamento de la unidad, hallaron cinco paquetes en los cuales se llevaban 25 kilos de hoja de coca. Asimismo, en la unidad con número de matrícula D9D-2012, encontraron dos cajas de cartón en las cuales escondían 52 pares de zapatillas que fueron valorizadas en un aproximado de 3 mil soles.', 1, 1, 1, '0', '0', 0),
(257, '2018-06-26', 1, 'En tres casos Aduanas Chile incautó 76 kilos de droga en Chacalluta', 'Más de 76 kilos de cocaína incautaron en cuatro procedimientos los fiscalizadores del Servicio Nacional de Aduanas en el complejo fronterizo Chacalluta. La droga venía oculta en dos autos, un bus e incluso era transportada por una persona que simuló un embarazo. Se trata del ingeniero pesquero Enrique Távara Tanfuńay(42), quien viajaba en su auto desde Tacna a Santiago de Chile. Al momento de ser revisado, un can detector de Aduanas alertó sobre la presencia de droga, por lo que se activó el protocolo de inspección que consideró el uso del camión escáner. De esta forma se hallaron en el tablero del auto 29 paquetes forrados en cinta adhesiva de color plomo y envueltos en bolsas de color negro. El conductor chileno Mario de la Cruz Friz Valenzuela(46) fue interceptado en la barrera de salida cuando pretendía regresar a Tacna sin controlarse en Chile, por lo cual fue derivado a los pozos de inspección de un can detector y el camión escáner identificaron elementos que no correspondían a la carrocería. Los fiscalizadores desarmaron el vehículo y hallaron 47 paquetes de distintos tamańos y formas que en total contenían 45 kilos 870 gramos de clorhidrato de cocaína. De la misma manera, una mujer boliviana fue intervenida con dos kilos de droga que tenia adheridos al abdomen a bordo de un bus que partió de Tacna', 1, 1, 1, '0', '0', 0),
(258, '2018-06-27', 1, 'Burriers peruanos caen en la frontera al ingerir 43 ovoides con\ndroga\n', 'Control Fronterizo Chacalluta. En una acción conjunta entre detectives de la Avanzada Antinarcóticos Chacalluta y funcionarios de Aduanas, dos extranjeros de nacionalidad peruana, fueron detenidos por tratar de ingresar cerca de dos kilos de clorhidrato de cocaína en formato líquido bajo la modalidad de ingesta de ovoides. Un total de 15 ovoides los intentaron ingresar escondidos bajo sus vestimentas y los 43 restantes los ingirieron envueltos en preservativos, totalizando 58 unidades con un peso de 1.988, 15 gramos, droga que habían adquirido en Tacna y que debían entregar en Arica a un sujeto desconocido, recibiendo un pago monetario por este servicio. Los sujetos intentaron ingresar la droga por el Complejo Fronterizo de Chacalluta siendo detectados por funcionarios de la PDI y de Aduanas, quienes tras una revisión exhaustiva de sus vestimentas y posteriormente llevados a la máquina de rayos X "Body Scan", arrojaron la presencia de cuerpos extrańos en su organismos, lo que fue corroborado por el facultativo de turno del Hospital Regional, siendo informado al fiscal de turno. El avalúo de esta droga, en caso de haberse logrado su comercialización, alcanza la cifra de 9 millones 940 mil pesos.\n', 1, 1, 1, '0', '0', 0),
(259, '2018-06-27', 1, 'Analizan aplicación de los estándares contra la evasión', 'Ante 180 delegados de países de la OCDE, el Ministerio de Economía y Finanzas suscribirá en Lima un nuevo lineamiento para combatir la evasión y elusión fiscal.  ', 1, 1, 1, '0', '0', 0),
(260, '2018-06-27', 1, 'Destruyen maquinas de minería ilegal por más de 700 mil soles', 'Sama Las Yaras. Miembros de la Policía del Departamento del Medio Ambiente, Servicios Especiales, entre otras unidades policiales, y Fiscalía, montaron en el distrito Sama Las Yaras un operativo denominado “Minería Ilegal Tacna 2018”. El lunes 25 de junio intervinieron a cinco personas y procedieron a la destrucción de maquinaria valorizada en más de 700 mil soles.  ', 1, 1, 1, '0', '0', 0),
(261, '2018-06-28', 1, 'Policía incauta más de 138 kg de cocaína en vía Cusco-Puno', 'Cusco. Más de 138 kilogramos de pasta básica de cocaína incautó la Policía Nacional en la provincia cusqueńa de Espinar tras detener a cuatro integrantes de una organización dedicada al narcotráfico. La Policía detalló que la intervención se produjo la madrugada del martes  en el sector Puente Q’ero, de la carretera Espinar-Coporaque. En el lugar se interceptó a los ocupantes de las camionetas con placas de rodaje C2J-826 y AHD-832. Los presuntos narcotraficantes fueron identificados como Miquias Antay Bohorquez(36), Elena Vargas Villar(38), Samuel Vargas Villar(33) y Hernán Cruz Luján(44). De acuerdo a las diligencias se hallaron 135 paquetes tipo ladrillo forrados con cinta adhesiva amarilla acondicionados en las puertas, tolva y una llanta con un peso total de 138 kg con 220 gramos. En cada paquete se apreció en bajo relieve la figura de un toro. Preliminarmente se supo que los presuntos integrantes de la organización criminal se dirigían a la ciudad de Juliaca en Puno y desde ahí probablemente su ruta era continuar al vecino país de Bolivia.  \n', 1, 1, 1, '0', '0', 0),
(262, '2018-06-28', 1, 'Hallan millonario cargamento de droga camuflado en carrocería', 'Puno. Un total de 91 kilos con 66 gramos de clorhidrato de cocaína fueron descubiertos en la carrocería de una camioneta que se dirigía a Bolivia y fue interceptada por la Policía de Carreteras Puno en la carretera Panamericana Sur muy cerca al centro poblado Sajo de Pomata. Tal cantidad de droga estaba distribuida el 88 paquetes de droga tipo ladrillo que estaban siendo trasladados por tres limeńos: Juan Cárdenas Chávez(24), Elva Ramirez Huallapa y Pedro Carhuamaca Caja (46) quien conducía el vehículo de placa AVX-645. Ellos fueron detenidos por la policía y, el auto en el que viajaban, trasladado a instalaciones policiales donde se hizo una revisión exhaustiva que permitió dar con los paquetes de droga.', 1, 1, 1, '0', '0', 0),
(263, '2018-06-28', 1, 'Aduana Chile incauta más de tres mil parches térmicos falsificados', 'Iquique. Fiscalizadores del Servicio Nacional de Aduanas incautaron, ayer, en el patio de aforo de la Zona Franca de la comuna de Iquique, un total de 3.456 parches térmicos falsificados, los mismo no tenían la autorización sanitaria pertinente. La mercancía llegó desde China y una importadora pretendía enviarlos a la ciudad de Ovalle. Según explicó el director regional de la Aduana de Iquique, el procedimiento responde al rol de protección a la comunidad que cumple Aduanas al evitar todo tipo de contrabando.  ', 1, 1, 1, '0', '0', 0),
(264, '2018-06-29', 1, '50  embarcaciones peruanas están detenidas en Arica ', '', 1, 1, 1, '0', '0', 0),
(265, '2018-06-29', 1, '“Narcotráfico hormiga” mueve toneladas en 6 rutas  que cruzan la frontera ', 'Mientras el contrabando ingresa al Perú en mochilas y llicllas (tejido usado por mujeres del medio rural para envolver su carga) en la llamada modalidad hormiga, el narcotráfico ha copiado estas mańas y prefiere ingresar droga mediante la misma modalidad hacia Bolivia, desde donde la envía a Europa, Brasil y Chile. Cifras manejadas por el Ministerio del Interior indican que durante el último ańo se decomisaron un total de dos toneladas y 435 kilos de droga en la región Puno. Dicha cifra es ampliamente superior a la del ańo 2012 cuando se incautó 584 kilos. Desde ese ańo, la cantidad de kilos incautados se disparó.', 1, 1, 1, '0', '0', 0),
(266, '2018-07-01', 1, 'Hombre con 8 requisitorias por tráfico ilícito de drogas  jugaba fulbito como si nada ', 'Tacna. Cambio de apariencia pero la Policía capturó  a Diego Fernando Pereyra Perca(46) mientras jugaba desprevenido un partido de fulbito en el distrito de Ciudad Nueva. Según información tenía un record de ocho requisitorias por el delito de tráfico ilícito de drogas y era solicitado por el Juzgado Penal Supraprovincial de Tacna.  Gobierno ofrecía una recompensa de 15 mil soles por su captura.', 1, 1, 1, '0', '0', 0),
(267, '2018-07-01', 1, 'Caminaba con dificultad y le encontraron droga en su cuerpo ', 'Arica. Carabineros de la sección OS-7 detuvo a una mujer de nacionalidad peruana por el delito de tráfico de drogas. El hecho se registró a la una de la madrugada en la ruta 5 norte kilómetro 1968, tenencia carretera Cuya en el momento que personal de esta unidad especializada fiscalizó un bus, itinerario Arica-Santiago y al descender los pasajeros, observaron que uno de ellos mostraba una actitud evasiva al control, sumado a ellos dificultades al caminar, constatando que tenia adosada a su cuerpo cuatro paquetes de diferentes tamańos y un ovoides vaginal con clorhidrato de cocaína, la droga arrojó un meso de 1 kilo 55 gramos. ', 1, 1, 1, '0', '0', 0),
(268, '2018-07-02', 1, 'Cae sujeto buscado  por tráfico de drogas', 'Tacna. Durante un operativo de identificación realizado en la Vía Costanera, se logró la captura de un sujeto con 2 requisitorias vigentes, una de ellas por el delito de tráfico ilícito de drogas. Este  hombre fue identificado como Yair Erick Túpac Amaru Ramos (41), quien al ser identificado por la Policia, se descubrió las dos requisitorias vigentes, emitidas por el Juzgado Penal de Tacna y la Sala Penal Liquidadora de Tacna. Respectivamente. Además de tráfico de drogas, el otro delito por el que era buscado este sujero es de cohecho activo genérico.  ', 1, 1, 1, '0', '0', 0),
(269, '2018-07-02', 1, 'Se incrementó en más de 250% ingreso de carga por muelle peruano en Arica ', 'Durante su participación en la Feria Internacional de Transporte de Carga, Logística y Comercio Exterior, Expo Perú Cargo Week 2018, José Condori, gerente de promoción y desarrollo de la Zona Franca de Tacna(Zofratacna), informó que en el ultimo ańo el ingreso de contenedores por el muelle peruano de Arica aumentó en mas de 250%. Asimismo, expresó que este incrementó se consolida con la alianza estratégica entre la Zofratacna y Terminal Puerto de Arica(TPA), y se plasma con el impulso de la actividad comercial y la reducción de costos logísticos para las empresas. “Hace dos ańos estábamos en 50 contenedores mensuales, ahora vamos entre 200 y 250. Es una cifra importante por que cumple con nuestro objetivo de darle herramientas a los usuarios para que ingresen mercancía de origen que se distribuya a toda Sudamérica, no solo en Perú”, resaltó.  ', 1, 1, 1, '0', '0', 0),
(270, '2018-07-02', 1, 'Cerca de 600 personas llegaron hasta la subasta de Aduanas Chile ', '337 lotes fueron adjudicados tanto por chilenos como por extranjeros en el remate que realizó durante la mańana de ayer Aduanas Chile.', 1, 1, 1, '0', '0', 0),
(271, '2018-07-03', 1, 'Final: remate de Aduanas Chile recaudó más de 450 millones de pesos ', 'Iquique. 451 millones 39 mil pesos fue lo que finalmente recaudó el Servicio Nacional de Aduanas, tras la subasta del domingo realizada en Iquique, pero con gran cantidad de productos que estuvieron en exhibición en el puerto de Arica y la extraportuaria Hansen. Según informaron, hubo 18 lotes sin postor, 18 eliminados, 15 rescatados y 337 adjudicados, entre los cuales está la camioneta de 9 millones 100 que estuvo en vista en Arica, catalogada como lo más costoso y lujoso del remate aduanero, aunque ya anunciaron otro similar, con artículos electrónicos.', 1, 1, 1, '0', '0', 0),
(272, '2018-07-03', 1, 'Incautan camión con cargamento de plomo', 'Tacna. Durante el operativo Contrabando 2018 realizado por agentes de la Policía Fiscal, se incautó un cargamento de plomo que habría ingresado a la ciudad de manera ilegal, burlando el control fronterizo de Santa Rosa. La diligencia se realizó en inmediaciones del óvalo Cusco, donde la Policía intervino el camión de placa Z1P-887 conducido por Vidal Isalas Chipana Lube(36). Tras revisar la tolva del vehículo se halló un total de 40 sacos de polietileno que contenía restos de plomo. Posteriormente se intervino al dueńo de la mercadería, identificado como Raúl Demetrio Flores García(62). La mercadería y el camión fueron entregados a Aduanas. Chofer y propietario quedaron detenidos por el presunto delito de contrabando.  ', 1, 1, 1, '0', '0', 0),
(273, '2018-07-03', 1, 'Detienen a requisitoriado en Control Fronterizo Santa Rosa ', 'Personal policial detuvo a requisitoriado que pretendía ingresar a nuestro país por el control fronterizo Santa Rosa, el pasado domingo.  El sujeto detenido Jorge Abraham Hurtado Carrión(30) presentaba  por el delito de Omisión a la Asistencia Familiar, quien era requerido por el Juzgado Penal de Cajamarca.', 1, 1, 1, '0', '0', 0),
(274, '2018-07-04', 1, 'Continúan detenidos por cargamento ilegal de plomo ', 'En la sección especializada de la Policía Fiscal permanecen detenidos Vidal Isaías Chipana Lube (36), Hugo Cachique Canaya(30), Vicente Mamani Quispe(47) y Raúl Demetrio Flores García(62) por el presunto delito de contrabando. Fuentes policiales informaron que inicialmente se incautó 40 sacos con plomo en un camión que circulaba en inmediaciones del óvalo Cusco. Posteriormente, se conoció que la Policía acudió al lugar donde se acopiaba la mercancía en el Parque Industrial, hallándose un total de 340 sacos con plomo y 25 baterías de segundo uso, todo valorizado en 100 mil soles. ', 1, 1, 1, '0', '0', 0),
(275, '2018-07-04', 1, 'Golpe al narcotráfico en Tacna: colombianos caen con cargamento de marihuana ', 'Tacna. Personal policial antidrogas de Tacna dio un duro golpe al narcotráfico tras intervenir a dos colombianos que se desplazaban a bordo de un vehículo con un cargamento de más de 300 kilos de marihuana de la variedad “cripy”. La diligencia se desarrolló pasadas las 10:00 horas de este martes en inmediaciones de la junta vecinal Villa Hermosa, en el cercado de Tacna. La Policía tras un arduo trabajo de seguimiento, interceptó el automóvil de placa Z5G-044 marca Toyota, en el cual se desplazaban los ciudadanos colombianos identificados como Javier Rodríguez Acuńa(48) y Hermes Eduardo Ortega Vidal(40). Tras el rápido registro del vehículo, se encontraron varias bolsas “matuteras” que contenían gran cantidad de paquetes rectangulares. La Policía contabilizó más de 400 paquetes tipo ladrillo envueltos en cinta de embalaje que tenían impreso una bandera americana.  Se reconoció que la droga tenia como destino Chile y que el precio por kilo en Tacna bordea los 1.200 a 1.500 dólares.  El automóvil que los colombianos utilizaron para trasladar la droga fue alquilado de una empresa que oferta vehículos en alquiler para turistas.', 1, 1, 1, '0', '0', 0),
(276, '2018-07-04', 1, 'SUNAT y SUNARP  podrán identificar rápidamente a empresas de “fachada o fantasmas” ', 'Ambas instituciones públicas suscribieron un convenio que permitirá el intercambio de información y la cooperación técnica entre ambas instituciones', 1, 1, 1, '0', '0', 0),
(277, '2018-07-05', 1, 'Encuentran en bus una caja metálica con 4 kilos de cocaína ', 'Debajo del asiento número 63 de un bus interurbano, Carabineros del OS-7 incautó más de 4 kilos de clorhidrato de cocaína, tras fiscalizar una maquina que se dirigía rumbo a la ciudad de Santiago. La droga que iba oculta en una caja metálica y que simulaba ser parte de la estructura del bus, contenía cuatro paquetes tipo ladrillo, los cuales al ser sometidos a la prueba de campo, arrojaron un total de 4 kilos 300 gramos de clorhidrato de cocaína, logrando retirar de circulación 21.500 dosis de droga, avaluadas en 107 millones de pesos. Tras una exhaustiva investigación a los perfiles de los pasajeros, personal de esta unidad especializada pudo establecer además la identidad del propietario de la caja  metálica, que resulto ser un hombre de nacionalidad peruana quien fue detenido en el control carretero de la localidad de Cuya. ', 1, 1, 1, '0', '0', 0),
(278, '2018-07-05', 1, 'Olor a químico delató al conductor trasladado baterías a Tacna ', 'Arica. El fuerte olor a químicos delató a un extranjero. Que sin documentos ni permisos, trasladaba un total de 35 baterías. El hecho ocurrió en el sector de Puerta de América, cuando Carabineros de la Sección de Investigación Policial SIP de la Cuarta Comisaria de Chacalluta, detuvo a un ciudadano peruano que intentaba salir rumbo a Tacna con su vehículo cargado de baterías en desuso y los cuales expelían liquido y un fuerte olor a químico. Según antecedentes del caso, el hecho quedó al descubierto en el momento que el personal policial realizaba un patrullaje preventivo, y fiscalizó al extranjero, quien portaba en el asiento del copiloto, en los espacios traseros e incluso en el maletero del vehículo, un total de 35 baterías de vehículos, de diferentes marcas y modelos, las cuales pretendía comercializar en la vecina ciudad, razón por la cual fue detenido, quedando a disposición de la Fiscalía, al igual que la carga y el vehículo. ', 1, 1, 1, '0', '0', 0),
(279, '2018-07-05', 1, 'Entre enero y mayo sube la exportación no tradicional ', 'Las exportaciones no tradicionales aumentaron 19.1% entre enero y mayo, al sumar $5277 millones y acumular 22 meses de crecimiento consecutivo, informó el Ministerio de Comercio Exterior y Turismo (Mincetur). ', 1, 1, 1, '0', '0', 0),
(280, '2018-07-05', 1, 'Droga incautada a colombianos será trasladada a Lima ', 'Tacna. La detención de los extranjeros fue posible a una investigación realizada por efectivos de la DIRANDRO de Lima, de manera reservada. Es por este motivo que el cargamento incautado como los extranjeros detenidos será trasladado a la capital de la república para continuar con las diligencias.  ', 1, 1, 1, '0', '0', 0),
(281, '2018-07-06', 1, 'Incautan cargamento de plomo por 150 mil soles', 'Tacna. Durante el operativo Contrabando 2018, realizado por agentes de la Policía Fiscal, se incautó la tarde del jueves en el control aduanero Vila Vila un cargamento de plomo que tenía como destino la ciudad de Lima. Según fuentes policiales la diligencia se desarrolló pasadas las 13:00 horas y durante ella se intervino el camión Volvo de placa VAF-999, conducido por Alejandro Perales Mauricio(39). En la tolva del vehículo se halló un total de 430 sacos que contenían restos de plomo por un total de 30 toneladas. Se conoció que el vehículo tenía autorización para el traslado de residuos y/o materiales peligrosos pero no contaba con documento de amparo legal para trasladar el cargamento de plomo, por lo que la mercadería se inmovilizó. La mercadería y el vehículo fueron llevados a los almacenes de Aduanas. Las 30 toneladas de plomo fueron avaluadas en 150 mil soles.  ', 1, 1, 1, '0', '0', 0),
(282, '2018-07-06', 1, 'Peruano trasladaba a Chile cocaína oculta en una caja ', 'Arica. Debajo del asiento número 63 de un bus interurbano, personal policial de Chile incautó más de 4 kilos de clorhidrato de cocaína, tras fiscalizar una maquina que se dirigía rumbo a la ciudad de Santiago.', 1, 1, 1, '0', '0', 0),
(283, '2018-07-06', 1, 'Intervienen a 3 sujetos con mercadería de contrabando\n', 'Moquegua. Tres sujetos fueron intervenidos por agentes de la Policía Fiscal en el terminal terrestre de Moquegua en posesión de maletas con gran cantidad de polos de marcas extranjeras valorizados en 46.500 soles, los mismos que carecían de documentación y fueron incautados. El operativo se desplegó en el terrapuerto, donde se intervino a Julio César Albán Balarezo(54), quien tenia en su poder dos maletas con 200 polos de algodón de la marca Gucci. Igualmente a Jhonny Romero Pumaylle se le encontraron dos maletas con 210 polos de la misma marca. Otro intervenido fue Charlton Ricaldi Puente, quien tenia en su poder 2 maletas con 220 polos.  ', 1, 1, 1, '0', '0', 0),
(284, '2018-07-06', 1, 'Elmer Cuba : Incremento del contrabando por alza del ISC se verá en 12 meses ', 'Elmer Cuba, economista socio de Macroconsult, manifestó  además que la tasa mínima de IR en nuestro país está muy por encima de los que se aplica en México, Chile y Brasil. ', 1, 1, 1, '0', '0', 0),
(285, '2018-07-07', 1, 'Peruano trasladaba desde Chile baterías de contrabando', 'El fuerte olor a químicos delató a un peruano que sin documentos ni permisos trasladaba a Tacna desde Chile un total de 35 baterías. El hecho ocurrió en el sector Puerta de América, en Arica, cuando carabineros de la sección de Investigación Policial de la Cuarta Comisaría de Chacalluta detuvieron al ciudadano peruano, que intentaba salir rumbo a Tacna con su vehículo cargado de baterías en desuso, las cuales expedían líquidos y un fuerte olor a químico. Se informó que el hecho quedó al descubierto en el momento que el personal policial realizaba un patrullaje preventivo y labores de control de identidad entonces fiscalizó al extranjero, quien portaba en el asiento de copiloto, en los espacios traseros e incluso en el maletero de su vehículo un total de 35 baterías de vehículos, de diferentes marcas y modelos, las cuales pretendían comercializar en Tacna, razón la por la cual fue detenido y quedó a disposición de la Fiscalía, al igual que la carga y el vehículo', 1, 1, 1, '0', '0', 0),
(286, '2018-07-07', 1, 'Incautan 266 kilos de cocaína en automóviles ', 'Iquique. Seis autos deportivos cargados con 266 kilos de clorhidrato de cocaína incautó el Servicio Nacional de Aduanas, durante las últimas semanas, en los pasos fronterizos de la región de Tarapacá. El primer caso fue en la avanzada El Loa, donde un mecánico peruano A.J.S.L. (35) conducía un auto que contenía en su estructura 27 kilos 50 gramos de clorhidrato de cocaína. En el Loa fueron sorprendidos con 39 kilos 700 gramos en la estructura de su auto los albańiles Y.J.C. (25) y W.F.R.J. (29), ambos bolivianos, con destino a Vińa del Mar. En Quillagua hallaron 40 kilos 500 gramos de clorhidrato de cocaína en un auto conducido por los bolivianos F.S.R. (26) y A.Q.H. (19), quienes planeaban ir a Antofagasta. En Colchane interceptaron tres vehículos, en uno viajaban los bolivianos J.R.C. (27) y M.A.C. (29) con destino a Santiago, llevaban 33 kilos 335 gramos de cocaína. Los bolivianos A.S.D.F. (30) y A.CH.B. (38) venían a Iquique con 81 kilos 320 gramos de droga en siete piezas metálicas. Finalmente, con 44 kilos 155 gramos de cocaína sorprendieron a los bolivianos H.T.C. (27) y B.T.CH. (51)', 1, 1, 1, '0', '0', 0),
(287, '2018-07-08', 1, 'Ascienden a mil millones exportaciones no tradicionales peruanas', 'Las exportaciones de productos no tradicionales ascendieron a 1,109 millones de dólares en mayo de este ańo, superior en 15,1% respecto al mismo mes de 2017, por los mayores volúmenes embarcados (6,8%) y los mayores precios (7,8%).  En este comportamiento positivo del mes, observado desde agosto del 2016, se registraron mayores ventas de productos pesqueros (56,4%),  agropecuarios (12,2%), químicos (15,6%) y textiles(16,8), principalmente.  En términos de valor exportado, destacaron las mayores ventas de paltas frescas (12,6%), pota congelada (125,7%),pota en conserva (150,6%), productos de zinc (7,5%), alambrón de cobre (14,6%), banano orgánico (16,5%) y frutas congeladas (15,9%), entre otros. Por regiones de destino. En el mes se registraron mayores ventas a la Unión Europea (41,2%), Asia (54,5%), Países Andinos (16,2%) y Mercosur (23,7%). ', 1, 1, 1, '0', '0', 0),
(288, '2018-07-08', 1, 'SUNAT: Personal de Aduanas interviene más de 70 kilos de cocaína en Puno ', 'Puno. En el marco de las acciones de control contra el tráfico ilícito de mercancías, personal aduanero de la Sunat efectuó intervenciones en vehículos de transporte de pasajeros procedentes de la ciudad de Arequipa, detectando, durante la revisión de equipajes, a nueve ciudadanos peruanos que viajaban con más de setenta kilos de cocaína tipo ladrillo. En ambas intervenciones, que se efectuaron en los puestos de Control Aduanero de Ojherani y Cabanillas, los oficiales de la Intendencia de Aduana de Puno observaron que los paquetes contenían una sustancia en polvo de color blanquecino, que al ser sometida a las pruebas de campo, dio como resultado positivo para alcaloide de cocaína. Por este motivo, se procedió de inmediato a comunicar al representante del Ministerio Publico Fiscalía Provincial Especializada en Delitos de Tráfico Ilícito de Drogas de Puno, para el desarrollo de las acciones de su competencia, quien dispuso la detención de los intervenidos. Estas acciones operativas reflejan el compromiso que tiene la SUNAT de cumplir su función de prevención y represión de los ilícitos aduaneros, que perjudican a los contribuyentes formales y afectan las operaciones de comercio exterior, así como la competitividad y el crecimiento económico del Perú', 1, 1, 1, '0', '0', 0),
(289, '2018-07-09', 1, 'Detienen a sujeto con baterías para celulares por 189 mil soles ', 'Arica. El nerviosismo que pusieron el conductor y su acompańante al interior de un vehículo que era fiscalizado por la SIP de la Cuarta Comisaría fue lo que delató a dos peruanos, quienes fueron detenidos por el delito de contrabando, al ser sorprendidos con 329 teléfonos celulares Samsung. Según el prefecto de Carabineros, Luis Rozas, los equipos estaban contenidos en bolsas individuales, infracción que fue avaluada en $49 millones 350 mil pesos.', 1, 1, 1, '0', '0', 0),
(290, '2018-07-09', 1, 'Peruano cae en Iquique con cargamento de droga', 'Iquique. Seis autos cargados con 266 kilos 60 gramos de cocaína intervinieron la fiscalización del Servicio Nacional de Aduanas Chile durante las últimas semanas en los pasos fronterizos de la región. Con el objetivo de evitar todo tipo de contrabando, lograron identificar en los controles aduaneros El Loa y Quillagua, seis vehículos deportivos que habían sido utilizados para esconder la droga. Luego de utilizar perfiles de riesgos y tecnología no invasiva, como scanner, para detectar el cargamento, se procedió a detener a diez sujetos de nacionalidad boliviana y un peruano, quienes fueron formalizados y todos quedaron en prisión preventiva durante 90 días. La Policía especializada en drogas investiga a la banda criminal para identificar a sus demás integrantes. ', 1, 1, 1, '0', '0', 0),
(291, '2018-07-09', 1, 'Perú y Bolivia acuerdan facilitar tránsito de carga por puerto Ilo ', 'Perú y Bolivia continúan dando pasos firmes en la ruta de integración y desarrollo conjunto. El titular del Ministerio de Transportes y Comunicaciones (MTC) peruano, Edmer Trujillo, y el titular del Ministerio de Obras Públicas, Servicios y Vivienda boliviano, Milton Claros, firmaron un convenio para facilitar el tránsito de carga de exportación por el puerto de Ilo.', 1, 1, 1, '0', '0', 0),
(292, '2018-07-10', 1, 'Detienen a sujeto con baterías para celulares por 189 mil soles ', 'Moquegua. Un sujeto fue detenido por agentes de la Policía Fiscal en posesión de 2 mil 550 baterías para equipos celulares de diferentes marcas y modelos, valorizados en  aproximadamente 189 mil soles. La intervención se produjo en la carretera Panamericana, a la altura del cruce en el sector de Montalvo. Se trata de Nicolás Caira Espinoza, quien se identificó como el propietario de tres mochilas que contenía la mercadería que carecía de la documentación respectiva, las mismas que se encontraban envueltas en paquetes tipo ladrillo y separadas por modelos y marcas de celular. Se encontraron 750 baterías marca Samsung, además de otras 1800 marca JNK en diferentes modelos.', 1, 1, 1, '0', '0', 0),
(293, '2018-07-10', 1, 'A 74 llegan puertos cerrados por mal tiempo ', 'A  74 se incrementó el número de puertos de todo el litoral del país que permanecen cerrados por medida de prevención por la presencia de oleajes ligeros, informó hoy la Dirección de Hidrografía y Navegación(DHN) de la Marina de Guerra del Perú. En el sur se encuentran cerrados San Nicolás, San Juan y Matarani(Ocean Fish); las caletas Nazca, Lomas, Sagua, Tanaka, Chala, Puerto Viejo, Ático, Planchada,Quilca, El Faro, Morro Sama y Vila Vila; los terminales multiboyas Mollendo, Tablones, Consorcio Terminales GMP y TLT; los terminales portuarios Tisur(Muelle C y F) y Marine Trestle Tavlones, así como los muelles Enapu(Ilo), SPCC y Engie.', 1, 1, 1, '0', '0', 0),
(294, '2018-07-10', 1, 'Gobierno de Chile identifica 166 pasos ilegales en límites con Perú y Bolivia ', 'El ingreso de drogas, migrantes y contrabando aprovecha la ausencia de una barrera natural, como ocurre en el centro y sur, con la Cordillera de los Andes', 1, 1, 1, '0', '0', 0),
(295, '2018-07-10', 1, 'Capturas a 2 requisitoriados que pretendían  viajar a Chile', 'El personal policial del Control Fronterizo Chacalluta, logró la detención de dos personas buscadas por la justicia peruana por omisión a la asistencia familiar y resistencia a la autoridad.  Mirtha María Cruz Zapata(27), quien presentaba orden de captura por el presunto delito de violencia y resistencia a la autoridad, emitido por el  27 Juzgado Penal de Lima, mientras que la segunda persona fue identificada como Julio Pilco Quispe(31), quien es solicitado por el Juzgado Penal de Tacna por omisión a la asistencia familiar.', 1, 1, 1, '0', '0', 0),
(296, '2018-07-11', 1, 'Con una almohada venía caminando por la frontera', 'Arica. A plena luz del día carabineros de la Cuarta Comisaría de Chacalluta, sorprendieron a dos hombres de nacionalidad colombiana caminando por la línea férrea con la frontera con el Perú. Uno de ellos, portaba una almohada de color rojo y un parlante musical.  Los dos extranjeros fueron sorprendidos a las 15:45 horas, cuando los policías se percataron del ingreso ilegal al país y al momento de efectuar una revisión de sus especies. Encontraron tanto en la almohada como en el parlante marihuana, la cual arrojó un pesaje de 1 kilo 220 gramos de Cannabis Sativa. En la audiencia La Fiscalía expuso que uno de los detenidos seńaló que no tenía conocimiento que su compańero estaba trasladando droga y recuperó su libertad. Siendo formalizado Huber Guaza de 33 ańos por tráfico de drogas y quedó con la medida cautelar de prisión preventiva.\n', 1, 1, 1, '0', '0', 0),
(297, '2018-07-11', 1, 'Mincetur: Perú prevé optimizar TLC con China', 'El Perú evaluará el Tratado de Libre Comercio (TLC) con China con el objetivo de optimizarlo, adelantó el viceministro de Comercio Exterior y Turismo, Edgar Vásquez.  “Buscamos la fecha más apropiada para que se reúnan las autoridades de la Comisión Administradora del TLC, evalúen el desempeńo de este y determinen los puntos por enriquecer”, indicó.  Recalcó que el acuerdo comercial fue exitoso para ambas partes; sin embargo, pasaron nueve ańos y siempre es posible incorporar nuevos elementos. \n', 1, 1, 1, '0', '0', 0),
(298, '2018-07-11', 1, 'Comercio exterior: Gobierno trabaja módulo de información logística', 'El ministro de Comercio Exterior y Turismo, Roger Valencia, anunció hoy que el gobierno peruano trabaja en la implementación de una nueva herramienta para los exportadores peruanos: el módulo de información de servicios de logística de comercio exterior. A través de esta plataforma los exportadores podrán obtener información, en tiempo real, sobre las características, precios y listado de servicios brindados por puertos, transportistas, agentes de carga, almacenes, couriers, agentes de aduana, entre otros.  ', 1, 1, 1, '0', '0', 0),
(299, '2018-07-12', 1, 'Colombiano cae con droga oculta en parlante de música', 'Arica. El hecho ocurrió a plena luz del día, cuando los policías se percataron del ingreso ilegal al país de dos hombres de nacionalidad colombiana, quienes transitaban por la línea férrea en la frontera de Chile y Perú, procedentes de Tacna.  Al momento de ser interceptados y efectuar una revisión de sus bienes, encontraron tanto en el cojín como en el parlante que uno de ellos, envoltorios con marihuana. La cannabis sativa que transportaban arrojó un peso de 1 kilo 220 gramos. Los extranjeros fueron formalizados por tráfico de drogas y quedaron con la medida cautelar de prisión preventiva.\n', 1, 1, 1, '0', '0', 0),
(300, '2018-07-12', 1, 'Capacitan a periodistas sobre delitos aduaneros', 'Moquegua. Las autoridades de la Comisión Regional de Lucha contra los Delitos Aduaneros y la Piratería, informaron la mańana de ayer del trabajo que vienen realizando hasta el segundo trimestre del presente ańo y brindaron una capacitación a los hombres de prensa sobre la normatividad de Aduanas y propiedad intelectual. El vicegobernador regional, Emilio Euribe Rojas, dio a conocer los acuerdos que se asumieron en las reuniones cumplidas durante el 2018, desde la aprobación del plan operativo y de las capacitaciones efectuadas a comerciantes y charlas a estudiantes, en busca de un cambio de actitud respecto al contrabando y piratería. Se destacó que este tipo de comisiones se trabaja en 15 regiones del país agrupadas en zonas. Para el caso del sur comprende Tacna, Moquegua, Arequipa e Ica. ', 1, 1, 1, '0', '0', 0),
(301, '2018-07-12', 1, 'Exportaciones de los países de la Comunidad Andina al mundo crecieron 14.5% ', 'En el periodo enero-febrero de 2018, las exportaciones al mundo de los países miembros de la Comunidad Andina (Perú, Colombia, Ecuador y Bolivia) alcanzaron los 18,525 millones de dólares, 14.5% más que las realizadas en el mismo periodo del 2017.', 1, 1, 1, '0', '0', 0),
(302, '2018-07-12', 1, 'Sunat: recaudación por contribuciones a seguridad social aumentó 9.48% en mayo ', 'La recaudación de los recursos de la seguridad social, contribuciones al Seguro Social de Salud (EsSalud) y a la Oficina de Normalización Previsional (ONP), sumó S/ 1,250.14 millones en mayo, reportó hoy la Superintendencia Nacional de Aduanas y de Administración Tributaria (Sunat). ', 1, 1, 1, '0', '0', 0),
(303, '2018-07-13', 1, 'Incautan mercadería por 60 mil soles ', 'Tacna. Dos policías heridos dejan como saldo la incautación de gran cantidad de mercadería de contrabando durante una intervención realizada por agentes de la Policía Fiscal en el distrito de Sama-Las Yaras. La diligencia se desarrolló la noche del miércoles cuando la Policía hacia patrullaje en inmediaciones de la iglesia Virgen del Rosario, observando dos vehículos sospechosos. Uno logró darse a la fuga mientras que la PNP intervino la camioneta de placa V1H-946, conducida por Richard Alejo Ajahuana(39). En la tolva del vehículo se hallaron bultos con un total de 734 prendas de vestir de importación (casacas, pantalonetas, chompas y ropa de bebé), 276 carteras, 18 licuadoras, 2 extractoras, todo por un valor de 60 mil soles. Mientras la Policía procedía a trasladar la mercadería y al chofer, solicitó ayuda a un vehículo particular, cuando de pronto apareció otra camioneta de placa A3E-947 que impactó al vehículo en el cual se encontraba el brigadier PNP Luis León Nina y el S02 PNP Jorge Gonzáles Arias. De la camioneta de placa A3E-947 descendieron tres personas identificadas como los hermanos Julio, Efraín y Victoria Churqui Torres, quienes atacaron a los policías lanzándoles piedras. Agentes policiales de la comisaría de Sama-Las Yaras los detuvieron por el delito de violencia y resistencia a la autoridad', 1, 1, 1, '0', '0', 0),
(304, '2018-07-13', 1, 'SUNAT : Ingresos tributarios crecieron 26,4% en junio ', 'SUNAT informó que los ingresos tributarios netos del Gobierno Central (descontando las devoluciones de impuestos) ascendieron a S/8,193 millones en junio de este ańo, superior en S/1,801 millones al obtenido en similar mes del 2017. Este resultado representa un crecimiento de 26,4% en términos reales. La institución indicó que con el resultado de junio se acumularon nueve meses de aumento sostenido de los ingresos tributarios. En cuanto a sus componentes, la recaudación de tributos internos sumó S/6,955 millones de soles en junio y registró un crecimiento de 17,2%. Por su parte, la recaudación de tributos aduaneros sumó S/2,558 millones y creció 22,8%. ', 1, 1, 1, '0', '0', 0),
(305, '2018-07-15', 1, 'Incautan ropa de segundo uso y contrabando en terminal de Moquegua\n', 'Moquegua. Gran cantidad de ropa “Cachina” y mercadería de contrabando, valorizada en 6500 soles, fue incautada la mańana de ayer por agentes del departamento de Investigación Criminal (Depincri) de la Policía Nacional, en operativo realizado en el terminal terrestre de Moquegua. La intervención se produjo cerca de las 10:30 horas luego que por labor de inteligencia se alertó sobre la presencia de varios sacos de polietileno que tendrían mercadería de contrabando. Tras la confirmación se procedió al recojo e incautación de la ilegal mercancía. Se conoció que en el interior de los sacos se encontraba ropa usada, blusas de mujer y aproximadamente 300 billeteras. La mercancía sería procedente de Tacna y Desaguadero.\n', 1, 1, 1, '0', '0', 0),
(306, '2018-07-15', 1, 'BCR: Recaudación de IGV creció 17.5% en Junio', 'En los últimos nueve meses la recaudación del IGV registra tasas de crecimiento positivas, en particular tasas mayores a dos dígitos a partir de abril de este ańo. En junio, los ingresos por Impuesto General a las Ventas (IGV) aumentaron 17.5% respecto al mismo mes de 2017, tanto por la mayor recaudación por IGV interno (15.5%) como por IGV externo (20.3%), así lo informó el Banco Central de Reserva  (BCR). Cabe destacar que en los últimos nueve meses la recaudación de este tributo registra tasas de crecimiento positivas, en particular tasas mayores a dos dígitos a partir de abril del presente ańo. Por su parte, el aumento de los ingresos por IGV externo en el mes reflejó las mayores importaciones en un contexto de recuperación de la actividad económica. ', 1, 1, 1, '0', '0', 0),
(307, '2018-07-16', 1, 'Productos de perfumería ingresan de contrabando a Tacna ante prohibición\n', 'Tacna. Dirigente espera se apruebe norma para mercancía. Artículos de cosmetología y perfumerías ingresan de contrabando a Tacna a fin de ser comercializados ante la prohibición dada por el Ministerio de Salud para certificar las compras que realizan los usuarios de la Asociación Junta de Usuarios de la Zona Franca, indicó el ex-presidente del gremio, Richard Blanco. El otrora dirigente lamentó que a dos ańos de retenerse mercadería similar, no pueda ser devuelta y se afecta a 500 familias de la Ajuzotac, generando pérdidas que llegarían hasta los 30 millones de soles. Seńaló que ahora los comerciantes acuden a las ferias Boliviana y Altiplano a adquirir los productos ingresados de manera ilegal. “Están obligando a que vuelva el contrabando cuando deberían aprobar el proyecto de ley N° 1567 que faculta a la Diresa Tacna a certificar, verificar y controlar la mercancía restringida”, reclamó.  ', 1, 1, 1, '0', '0', 0),
(308, '2018-07-16', 1, 'Aju Zotac: Exigen se apruebe y promulgue proyecto de ley N° 1567 ', 'La propuesta legislativa impulsada por los usuarios de la zona comercial de Tacna está contenida en el proyecto de ley N° 1567-2016, ley que fomenta la diversificación productiva y de servicios en la Zona Franca y Zona Comercial de Tacna. Luego de varias postergaciones, esperaban que la propuesta sea debatida por el pleno del Congreso en junio de este ańo, pero nuevamente fue postergado. El planteamiento de los comerciantes es descentralizar la capacidad de control sobre mercaderías de alimentos y perfumería. Esto para dar flexibilidad sobre la certificación sanitaria de las mercaderías importadas.\n', 1, 1, 1, '0', '0', 0),
(309, '2018-07-17', 1, 'Cubana pretendía salir del país con pasaporte falso', 'Tacna. Personal policial de la comisaría de La Concordia, en el control fronterizo Santa Rosa, intervino a la ciudadana cubana Aylen Estrada Hernández (25) que pretendía salir del país con dirección a Chile, haciendo uso de un pasaporte aparentemente falso. Personal de Migraciones habría identificado irregularidades en los sellos del pasaporte, quedando detenida por la PNP. Se investiga si la extranjera ingresó de forma legal a nuestro país.  ', 1, 1, 1, '0', '0', 0),
(310, '2018-07-17', 1, 'Decomisan contrabando por más de 37 mil soles', 'Moquegua. Gran cantidad de mercadería que estaría inmersa en el delito de contrabando y valorizada en más de 37 mil soles fue decomisada por agentes de la Policía Fiscal luego de realizar un operativo en el terminal terrestre de Moquegua, donde hallaron sacos de polietileno, con ropa y calzado deportivo que no tenía la documentación de ingreso al país. El golpe a los contrabandistas se produjo el fin de semana, logrando incautar la ilegal mercadería acomodada en sacos que iban a ser trasladadas a otras regiones.\n', 1, 1, 1, '0', '0', 0),
(311, '2018-07-17', 1, 'Lleno de pasajeros y sin vehículos quedó terminal: culpan a demoras en Santa Rosa ', 'Arica. Según dirigente de Asociación Aricatac, el problema se generó en Santa Rosa por falta de funcionarios. La gobernación provincial de Arica, en tanto, informó que “el complejo Chacalluta funcionó sin mayores inconvenientes durante el fin de semana”. Respecto a lo acontecido en Santa Rosa, la entidad de Gobierno no se refirió, ya que ese complejo “no es parte de esta administración ni del país”, finalizaron.', 1, 1, 1, '0', '0', 0),
(312, '2018-07-18', 1, 'Incautan licores por S/ 10 mil en minibús de la ruta 11', 'Pocollay. Miembros del Grupo Terna de la Policía Nacional del Perú, tras una paciente labor de seguimiento, intervinieron a un microbús de pasajeros que llevaba en su interior más de una veintena de cajas de licores de conocidas marcas. La detención se produjo el lunes 16 de julio a las 19:30 en la avenida Los Productores del distrito de Pocollay, al frontis del centro de abastos “24 de Junio”. La unidad intervenida por los policías corresponde a la placa de rodaje V1W-761 de marca Toyota modelo Asia color rojo y portaba logos que la identificaba como vehículo de la ruta de línea 11. Suceso. El vehículo era transportado por Edwin Lupaca Ramos(40), quien se encontraba acompańado de Luz Marina Quispe Cervantes(28). Al realizar el registro de la unidad, los agentes encontraron debajo de los asientos un total de 26 cajas de cartón conteniendo diversos tipos de licor de distintas marcas comerciales. Cinco cajas corresponden a la marca Grants, otras cinco cajas a Amarula, cinco de Red Label, cinco cajas de Bacardi, tres cajas de Appleton y finalmente 3 cajas de Bailys. La mercadería incautada fue valorizada en aproximadamente 10 mil soles. ', 1, 1, 1, '0', '0', 0),
(313, '2018-07-18', 1, 'Choferes no pierden la paciencia al viajar a Tacna', 'Arica. Por vacaciones de invierno y fines de semana largo, el flujo de personas  aumenta considerablemente. La Gobernadora aseguró que el control integrado funciona. Durante el último fin de semana largo. 92.730 personas se desplazados desde y hacia Tacna, 16.445 más de las que lo hicieron en el último festivo de tres días, el de San Pedro y San Pablo. Respecto a la escasa capacidad de estacionamientos que presentaría Santa Rosa y que perjudicaría la fluidez en los controles, la gobernadora Arancibia expresó que no puede realizar un diagnóstico sobre la infraestructura el complejo peruano pues no corresponde a su administración. “Podemos en las reuniones que tendremos a futuro, plasmar las problemáticas relacionadas con el diseńo de cada uno de los complejos.” ', 1, 1, 1, '0', '0', 0),
(314, '2018-07-18', 1, 'SUNAT interviene lote de prendas de vestir ocultas entre cargamento de leńa en Puno', 'Puno. En el Puesto de Control Aduanero de Ojherani (Puno), la SUNAT intervino un camión de carga pesada que, supuestamente, transportaba un cargamento de leńa, pero, al efectuar la revisión física, se detectó que se había camuflado un lote prendas de vestir nuevas, valorizada en más de US$40,000', 1, 1, 1, '0', '0', 0),
(315, '2018-07-19', 1, 'Liberan a intervenidos con mercadería de contrabando', 'Tacna. Los dos intervenidos con un cargamento de licores de contrabando que eran trasladados a bordo de un minibús de la ruta 11 quedaron en libertad luego de pasar 24 horas detenidos en la sección de la Policía Fiscal. Esto debido a que el monto de la mercadería no alcanzó el valor de 4 UIT para tipificarse como delito. Además, el chofer del minibús, identificado como Edwin Lupaca Ramos(40), indicó que fue interceptado por la comerciante Luz Marina Quispe Cervantes(28) cuando se encontraba estacionado en un grifo y que a cambio de 20 soles aceptó trasladar las 26 cajas de licores a un bar de la avenida Jorge Basadre en Pocollay sin imaginarse que la mercadería era de contrabando.', 1, 1, 1, '0', '0', 0),
(316, '2018-07-19', 1, 'Promulgan ley para supervisar a cooperativas', 'Lima. El presidente de la República, Martin Vizcarra, promulgó este miércoles la ley que permitirá a la Superintendencia de Banca Seguros y AFP (SBS) supervisar a las cooperativas de ahorro y crédito. El mes pasado, el pleno del Congreso aprobó por 91 votos a favor el proyecto de ley, para que una entidad adjunta a la Superintendencia de Banca, Seguros y AFP sea la encargada de supervisar las Cooperativas de Ahorro y Crédito(Coopac). La ley tiene el propósito de impedir el uso de algunas cooperativas para el lavado de activos.\n', 1, 1, 1, '0', '0', 0),
(317, '2018-07-19', 1, 'Incautan 63 paquetes de droga en carretera Panamericana Sur', 'Arequipa. Efectivos de la Policía de Carreteras realizaron la intervención de dos ciudadanos ecuatorianos que transportaban droga envuelta en paquetes tipo ladrillo. La detención se hizo en el kilómetro 711 de la Carretera Panamericana Sur, a la altura del peaje en Atico. Carlos Felipe Nazareno Bautista (39) y Luis Alexander Mina Hurtado (37) trasladaban 63 paquetes de droga en una camioneta. La mercadería ilegal fue camuflada en el parachoques delantero y el guardafangos de vehículos de placa GLY-0452. La policía continúa con las investigaciones del caso. \n', 1, 1, 1, '0', '0', 0),
(318, '2018-07-20', 1, 'Comisión incauta mercadería ilegal por más de S/8  millones', 'Tacna. De enero a julio, la comisión regional de lucha contra los delitos aduaneros y piratería incautó más de 8 millones de soles en mercadería ilegal camuflada en vehículos que intentaron pasar inadvertidos por la frontera, puestos de control o pasos no habilitados. La comisión es conformada por doce instituciones algunos de las cuales son la Policía Nacional, Aduanas, Gobierno Regional, municipalidad provincial, Prefectura Regional, Tercera Brigada de Caballería, Zofratacna, Junta de Fiscales Superiores y la Cámara de Comercio. El representante de Aduanas. El representante de Aduanas Héctor Pajares indicó que en los primeros seis meses del ańo un comando por la Policía y Aduanas incautó mercadería por 724 mil 654 dólares, con un valor comercial de 2 millones 173 mil 962 dólares en 105 intervenciones.', 1, 1, 1, '0', '0', 0),
(319, '2018-07-20', 1, 'Destrucción de alimentos depende si es consumible', 'Tacna. Ante las intervenciones de camiones con maíz de contrabando en Tacna, el representante del intendente de Aduanas, Héctor Pajares Gómez, indicó que el destino de los alimentos incautados depende si es aprobado o no para el consumo humano. “La ley de Aduanas y la ley general de delitos aduaneros establece que todas las mercancías con comiso administrativo y judicial, en caso de delitos, su fin es la destrucción, adjudicación o remate”, indicó Héctor Pajares Gómez. En el caso de alimentos, una comisión y un ente como la Dirección de Gestión de Salud o SENASA verifican si los alimentos son aptos para el consumo humano y resuelve adjudicarla, es decir donarla, o destruirla.', 1, 1, 1, '0', '0', 0),
(320, '2018-07-20', 1, 'Dos requisitorias en control fronterizo Santa Rosa', 'Dos peruanos con orden de captura vigente que retornaban al Perú procedentes de Chile fueron intervenidos en el control fronterizo Santa Rosa durante un control realizado por personal policial de la comisaría La Concordia. Se trata del ciudadano Marco Antonio Huarcayo Quispe(22), quien tenía una requisitoria por el delito de tentativa de robo agravado y Alejandro Rosendo Apaza Alave(39) con requisitoria por delito de lesiones leves. ', 1, 1, 1, '0', '0', 0),
(321, '2018-07-20', 1, 'Perú y Colombia eliminarán barreras burocráticas en certificación para exportación', 'Acción permitirá eliminar costos logísticos por concepto de coordinación, transporte de valores (certificado fitosanitario en papel) en beneficio de importador, exportador, agente de aduanas, valorizado en 50 dólares por certificado emitido', 1, 1, 1, '0', '0', 0);
INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(322, '2018-07-21', 1, 'Cayó banda criminal: Operaba desde Cerro Chuńo a Santiago', 'Arica. Casas tomadas en la Población Cerro Chuńo fueron utilizadas por una banda criminal para acopiar grandes cantidades de droga para luego ser trasladada y comercializada en Santiago. La investigación entre la Fiscalía y el Departamento de OS-7 de Carabineros logró desbaratar a esta organización, dejando como resultado la detención de 9 personas de distintas nacionalidades y la incautación de más de 22 kilos de marihuana cripy.   El oficial seńaló que esta banda mantenía un modus operandi bastante particular, ingresaba la droga desde el Perú por pasos no habilitados y la acopiaba (guardaba) en domicilios particulares de la Población Cerro Chuńo para su posterior traslado a la zona central a bordo de buses interprovinciales por parte de la tripulación de los mismos, droga que además era custodiada durante el trayecto por miembros de la misma organización. "Fue una operación en conjunto que partió en Arica, pero terminó con diligencias en la ciudad de Santiago con una entrega controlada en seguimiento al líder de la organización", informó el oficial. Se logró sacar de circulación 70 mil dosis de droga la cual fue avaluada en 160 millones de pesos. ', 1, 1, 1, '0', '0', 0),
(323, '2018-07-21', 1, 'Allanan casa y decomisan contrabando', 'Tacna. Agentes del grupo Terna de la Policía Nacional allanaron una vivienda que seria un punto de acopio de mercadería de contrabando, incautando prendas de vestir por unos 30 mil soles. La casa en cuestión se ubica en el centro poblado Augusto B. Leguía, en la avenida Litoral, manzana K, lote 2, en cuya fachada esperaba un vehículo blanco, marca Toyota Corolla con placa Z3Y-607. Se intervino al conductor Aldo La Chira Timaná(53), quien estaba acompańado de Micaela Edelmira Jaramilla Mantari(47) quien era la propietaria de la mercadería. Los cinco bultos de ropa y dinero fueron derivados a un almacén de Aduanas para el avalúo y aforo de ley.', 1, 1, 1, '0', '0', 0),
(324, '2018-07-21', 1, 'Intervienen a cuatro sujetos con mercadería de contrabando', 'Moquegua. Cuatro sujetos fueron intervenidos por agentes de la Policía Fiscal en posesión de siete maletas que contenían gran cantidad de polos de marca extranjera, la misma que estaría inmersa en el delito de contrabando, por un valor comercial que pasaría los 86 mil soles. El operativo policial se produjo en el interior del terminal terrestre de Moquegua, donde se intervino a los cuatro sujetos identificados como Wilmer Efrain Cuadros Cuya(40), Wilmer Farrońán Granados(29), Frank Armando Luis Díaz(26) y David Farrońán Granados(27).  ', 1, 1, 1, '0', '0', 0),
(325, '2018-07-23', 1, 'Duro cuestionamiento por bloqueo de pasos ilegales', 'Arica. El presidente de la Comisión de Zonas Extremas del Senado, José Durana, solicitó oficiar al Ministerio del Interior, a objeto de que le informen a la Cámara Alta cuántas zanjas o bloqueos de pasos ilegales ejecutó el gobierno anterior para detener casos de contrabando y narcotráfico en la frontera con Chile y Perú. El legislador denunció que en el 2016 el Comité Interinstitucional, se anunció la ejecución de más de 56 bloqueos o zanjas ilegales permanentes en las regiones de Arica y Parinacota, Tarapacá y Antofagasta, sin embargo, esta tarea quedó inconclusa.', 1, 1, 1, '0', '0', 0),
(326, '2018-07-23', 1, 'Error de etiqueta dejó preso a traficante y sus 18 tarros con droga', 'Arica. La etiqueta pegada así como que no quiere la cosa, sumado al extrańo peso del contenido fue lo que alertó a personal de Aduanas mientras fiscalizaba a un ciudadano peruano cuando ingresaba a Arica por Chacalluta con 18 tarros supuestamente llenos de leche evaporada. Resulta que en medio de la fiscalización, el extranjero comenzó a revelar nerviosismo, lo que fue aprovechado por los aduaneros, quienes tras la exhaustiva revisión, lograron acreditar que finalmente los envases estaban adulterados con clorhidrato de cocaína. Por orden del fiscal de turno, fue el OS-7 quien decomisó el alcaloide el que arrojó un peso bruto de 8 kilos 873 gramos del alcaloide. Ayer el fiscal Daniel Valenzuela formalizó a Alejandro Lino Sabino, de 45 ańos, por el delito de tráfico de drogas, solicitando la prisión preventiva.', 1, 1, 1, '0', '0', 0),
(327, '2018-07-23', 1, 'Aprueban procedimiento específico “Uso y Control de Precintos Aduaneros y Otras Medidas de Seguridad” CONTROL-PE.00.08 (versión 2)', 'Aprueban una nueva versión del procedimiento específico “Uso y Control de Precintos Aduaneros y Otras Medidas de Seguridad” CONTROL-PE.00.08 (versión 2), con el objeto de proporcionar las pautas a seguir para el registro, control, uso y verificación de los precintos aduaneros de alta seguridad destinados a la custodia y protección de la carga transportada en contenedores cerrados, vehículos tipo furgón y cisternas cuando su estructura y acondicionamiento permita su precintado; y otras medidas de seguridad dispuestas por la autoridad aduanera a nivel nacional, en concordancia con la normativa aduanera vigente. ', 1, 1, 1, '0', '0', 0),
(328, '2018-07-23', 1, 'Detienen en Chacalluta a peruana con requisitoria', 'Una mujer de nacionalidad peruana fue intervenida cuando pretendía ingresar a Chile, en el control fronterizo de Chacalluta. Se trata de Karina Joyce Ochoa Espezua(45), la cual tenía orden de captura vigente por el delito de Apropiación ilícita', 1, 1, 1, '0', '0', 0),
(329, '2018-07-24', 1, 'Mujer capturada con contrabando queda en libertad', 'Tacna. Edelmira Jaramilla Mantari(47) quedó en libertad tras ser intervenida por agentes del grupo Terna cuando se desplazaba a bordo de un taxi de placa Z3Y-607 en la avenida Litoral con prendas de vestir de contrabando valorizadas en 30 mil soles. Este monto no habría alcanzado el valor de 4 UIT para tipificar como delito.  ', 1, 1, 1, '0', '0', 0),
(330, '2018-07-24', 1, 'Detienen a cuatro requisitoriados que pretendían salir del país', 'Agentes de la Comisaria Especial La Concordia detuvieron a cuatro personas requisitoriadas en el Complejo Fronterizo Santa Rosa, cuando pretendían salir del país. Los detenidos Nicolás Díaz Baciliaris (23), Moisés Cisneros Murillo (33) y Aron Cisneros Murillo (28), presentaban requisitorias vigentes por el delito de lesiones leves, estando solicitados los juzgados penales de Tacna y Sullana (Piura). La policía también intervino a Nancy Chipana Mendoza (45), solicitada por el Tercer Juzgado Penal de Tacna por tener una requisitoria por el delito de falsificación de documentos', 1, 1, 1, '0', '0', 0),
(331, '2018-07-24', 1, 'Países de la Alianza del Pacífico suscriben acuerdo de reconocimiento aduanero', 'Las administraciones aduaneras de Perú, Chile, Colombia y México suscribieron un Acuerdo de Reconocimiento Mutuo (ARM) de sus programas de Operador Económico Autorizado (OEA), en el marco de la XIII Cumbre de la Alianza del Pacífico, que concluyó con la XIII Cumbre Presidencial, realizada en México. Este es el primer Acuerdo de Reconocimiento Mutuo multilateral en el mundo, existiendo actualmente 57 acuerdos bilaterales concluidos y otros 35 en negociación de este esquema, creado por la Organización Mundial de Aduanas (OMA) que busca facilitar y asegurar el comercio internacional. Cabe precisar que este convenio se suma a los otros dos ya firmados por la Sunat con Corea del Sur y Uruguay, mientras que se vienen efectuando coordinaciones para suscribir nuevos acuerdos con Estados Unidos y los países de la Comunidad Andina', 1, 1, 1, '0', '0', 0),
(332, '2018-07-24', 1, 'Incautan camión y 44 sacos con maíz en Ciudad Nueva', 'Tacna. Dos personas y un camión con 44 sacos de maíz fueron intervenidos este lunes por policías de la comisaría del distrito de Ciudad Nueva a inmediaciones de la manzana 412 de la asociación de vivienda – taller Fonavi Chang. Intervinieron al chofer del camión, Johnny Chuquimamani Mamani de 36 ańos, quien descargaba sacos de maíz que estaban dentro del vehículo de placa V2O-812. También detuvieron a Rubén Perca Quenta de 27 ańos, quien dijo ser propietario de 18 sacos de maíz. El fiscal Juan Ticona Málaga dispuso que el vehículo, la mercadería y los intervenidos sean derivados a las instalaciones de la policía fiscal para las investigaciones por el presunto delito de contrabando. ', 1, 1, 1, '0', '0', 0),
(333, '2018-07-25', 1, 'Cayeron “Los Bíblicos” con 8 kilos de marihuana', 'Arica. Fueron bautizados como “Los Bíblicos” en una investigación que realizó el Departamento de OS-7 de Carabineros junto con la Fiscalía. La investigación se inició hace un mes con la información que existía un grupo de hermanos dedicados al tráfico de drogas. Ellos acopiaban la sustancia ilícita para trasladarla a Antofagasta y a Santiago. Se logró incautar 8 kilos de marihuana y sacar de circulación un total de 24 mil 500 dosis con un avalúo de 24 millones 500 mil pesos, cifra que hubiesen obtenido por la venta de esta sustancia ilícita', 1, 1, 1, '0', '0', 0),
(334, '2018-07-25', 1, 'SUNAT pone en marcha herramienta para exportar', 'La SUNAT puso en operaciones la primera herramienta virtual denominada “tiempo de importación”, cuya finalidad es permitir que los importadores puedan conocer detalles del proceso de nacionalización de sus mercancías “en línea”, comparando las mejores prácticas y beneficios que ofrecen el despacho anticipado. De esta manera, se busca asegurar que el importador reciba orientación oportuna y personalizada de la administración aduanera, sobre los tiempos de las etapas de proceso de importación. Con apoyo de importadores se identificará demoras en el proceso de despacho para corregirlas y agilizar operaciones de comercio exterior.', 1, 1, 1, '0', '0', 0),
(335, '2018-07-25', 1, 'La Policía Nacional y el Ministerio Público incautaron más de 15  mil cigarrillos de contrabando', 'Cusco. Los propietarios de tres establecimientos comerciales, ubicados en el Centro Histórico de Cusco, podrían afrontar penas que oscilan entre los cuatro y ocho, como consecuencia de la venta de cigarrillos de contrabando incautado durante la intervención realizada por la Policía Nacional y el Ministerio Público. Según informaron las autoridades, durante el operativo se lograron incautar más de 15 mil cigarrillos de contrabando.', 1, 1, 1, '0', '0', 0),
(336, '2018-07-26', 1, 'Mujer pretendía ingresar 12 kilos de cannabis', 'Arica. En el control fronterizo de Chacalluta, fue detenida una mujer identificada con las iniciales F.N.C.S. de 30 ańos. Los detectives le detectaron que escondía en el interior del estanque de combustible de su vehículo, la cantidad de 12 kilos 270 gramos de cannabis sativa, droga que adquirió en Tacna - Perú y que pretendía comercializar en Arica. Detectives de la Brigada Antinarcóticos y Contra el Crimen Organizado (BRIANCO) en conjunto con sus pares de Chacalluta, lograron detectar la droga que en caso de haberse logrado su comercialización supera la cifra de 61 millones de pesos.', 1, 1, 1, '0', '0', 0),
(337, '2018-07-26', 1, 'Guerra comercial: Tres sectores mitigarían impacto en US$900 millones ', 'La guerra comercial entre China y EE.UU. podría afectar al Perú a través de la caída de los precios de metales como el cobre. El impacto en el Producto Bruto Interno (PBI) peruano, según estimaciones de la Sociedad Nacional de Industrias (SNI), sería cercano a los US$2,000 millones. "La cotización internacional del cobre, nuestro principal producto de exportación, se ha reducido de US$3.2 a US$2.85 la libra (...). Impacta en menor captación de impuestos, en menor inversión de futuros proyectos mineros y en menor actividad económica en general", destacó la SNI. Sin embargo, tal efecto podría ser mitigado si fortalecieran las exportaciones no tradicionales. ', 1, 1, 1, '0', '0', 0),
(338, '2018-07-26', 1, 'Masificación de facturación electrónica aumentará en segundo semestre 2018', 'La jefa de Efact Sistema Integrado, Verónica Velazco, seńaló que el plan de implementación de la facturación electrónica de la SUNAT se intensificará en el segundo semestre del 2018, ya que en agosto deberán emitir comprobantes electrónicos las empresas de servicio de crédito hipotecario, y las empresas con actividades de manufactura, ', 1, 1, 1, '0', '0', 0),
(339, '2018-07-26', 1, 'SNI: Sistema de inteligencia contra crimen organizado debe ser reforzado', 'La Sociedad Nacional de Industrias (SNI) hizo hincapié en la necesidad de fortalecer el sistema de inteligencia bajo el concepto de crimen organizado para combatir el contrabando, la subvaluación y la piratería. Ricardo Márquez, presidente del gremio, indicó que a la fecha no existe una coordinación de los organismos regionales de delitos aduaneros con la Comisión Nacional de Lucha Contra el Contrabando. ', 1, 1, 1, '0', '0', 0),
(340, '2018-07-27', 1, 'Detectaron auto con millonario contrabando', 'Arica. Un conductor fue detenido en un paso no habilitado con la intención de ingresar al país con un contrabando de cigarrillos avaluados en 58 millones. El hecho ocurrió en el paso denominado "Sica Sica", en la comuna de General Lagos, cuando personal de la Tenencia de Visviri procedió a controlar a un vehículo que burló todo tipo de control migratorio aduanero. En el procedimiento se incautaron 9 cajas de cartón contenedoras de 9.000 cajetillas de cigarrillos marca "Esse Change", por un valor de 18 millones de pesos.  ', 1, 1, 1, '0', '0', 0),
(341, '2018-07-27', 1, 'Mujer cae con droga que adquirió en Tacna', 'Arica. En instantes en que ingresaba por el control fronterizo Chacalluta, una mujer identificada con las iniciales F.N.C.S., de 30 ańos de edad, fue detenida por detectives apostados en el lugar tras detectar que escondía en el interior del estanque de combustible de su vehículo la cantidad de 12 kilos 270 gramos de cannabis sativa, droga que adquirió en Tacna y que pretendía comercializar en Arica. Lograron detectar la droga que estaba oculta en el interior del vehículo en forma de 20 “ladrillos”. La mujer que ya contaba con antecedentes por el delito de lesiones en el ańo 2014 quedó en prisión preventiva mientras dure la investigación. El avalúo de la droga en caso de haberse logrado su comercialización supera la cifra de 61 millones de pesos chilenos. La mujer detalló a la Policía y a los agentes de Aduanas que la ilegal mercadería se la entregó un sujeto en la ciudad de Tacna, aunque ella fue captada en Arica. A cambio de llevar la droga a su destino iba a recibir una suma de dinero.', 1, 1, 1, '0', '0', 0),
(342, '2018-07-27', 1, 'SNI: Con un sistema de inteligencia se combatirá el contrabando', '2000 millones de dólares en pérdidas causan el contrabando, piratería y falsificación al ańo. El presidente de la Sociedad Nacional de Industrias(SNI), Ricardo Márquez, dijo que urge reforzar el sistema de inteligencia para combatir el contrabando, subvaluación y piratería, bajo el concepto de crimen organizado. Planteó también la creación de un Registro de Operaciones de Comercio Exterior (importadores y exportadores) con una medida para prevenir esos delitos, además del lavado de activos.', 1, 1, 1, '0', '0', 0),
(343, '2018-07-27', 1, 'CCL prevé que 100 empresas serán Operadores Económicos Autorizados en 2019', 'La Cámara de Comercio de Lima (CCL), prevé que el número de empresas peruanas con certificación de Operador Económico Autorizado (OEA) se incremente a 100 en 2019, tras la firma de un acuerdo de reconocimiento mutuo multilateral entre países de la Alianza del Pacífico. A la fecha el Perú tiene registrados 72 operadores con certificados OEA entre exportadores (29), importadores (16), almacenes de aduanas (4) y agencias aduaneras (23). ', 1, 1, 1, '0', '0', 0),
(344, '2018-07-28', 1, 'Cae requisitoriado por tráfico ilícito de drogas', 'Tacna. Agentes del Departamento de Investigación Criminal de la Policía intervinieron en un operativo a Rubén Palomino Arcaya (30) la mańana de ayer al estar requisitoriado por el delito de promoción o favorecimiento del trágico de drogas y solicitado por el Primer Juzgado Penal Unipersonal de Tacna.  ', 1, 1, 1, '0', '0', 0),
(345, '2018-07-28', 1, '259 peruanos presos en Acha', 'El cónsul general del Perú en Arica, Eduardo Zeballos Valle, manifestó que hay 259 peruanos presos en la cárcel de Acha en Arica -  Chile. “Casi la totalidad de compatriotas que purgan condena en Arica están por narcotráfico en la modalidad de traslado de sustancias prohibidas”, expresó, antes de seńalar que los reos peruanos intervenidos y privados de su libertad en su mayoría son jóvenes, que fueron víctimas de organizaciones de dedicadas al delito de narcotráfico por la frontera. ', 1, 1, 1, '0', '0', 0),
(346, '2018-07-28', 1, 'Chile analiza ampliar el complejo de Chacalluta debido al alto tránsito', 'La Intendenta Regional de Arica y Parinacota Maria Letelier Salsilli informó que su gobierno está analizando la posibilidad de ampliar el complejo Chacalluta dada el incremento considerable de viajeros. “El paso fronterizo es atravesado por 7 millones de personas cada ańo, estamos viendo que alternativa hay de ampliarlo, pero no está definido”, precisó. Recordó que los funcionarios peruanos y chilenos trabajan coordinadamente para optimizar el paso en la línea de frontera y mejorar la gestión en ambas ciudades. En ese sentido se programó para el 1 de agosto en Arica una reunión bifronteriza, en la cual se lanzará una maratón binacional para octubre. ', 1, 1, 1, '0', '0', 0),
(347, '2018-07-28', 1, 'MT-0 logró su incautación más grande del país', 'Arica. Privados de libertad en la Cárcel de Acha quedaron dos sujetos, un chileno y un boliviano, que fueron detenidos en el valle de Azapa tras una investigación que realizó el equipo MT-0  de la PDI. Un total de 25 kilos y 480 gramos; 14 kilos 840 gramos de cocaína base y 10 kilos 640 gramos de clorhidrato de cocaína, fue la incautación que desbarató el equipo MT-0, droga que era ingresada al país por el extranjero por pasos no habilitados.', 1, 1, 1, '0', '0', 0),
(348, '2018-07-29', 1, 'Cae requisitoriado por tráfico ilícito de drogas', 'Tacna. Rubén Palomino Arcaya (30) fue intervenido la mańana de ayer por la Policía mientras transitaba por Gregorio Albarracín y al ingresar su nombre al sistema de requisitorias arrojó que era buscado por el delito de favorecimiento al tráfico de drogas. Palomino era solicitado por el 1er. Juzgado Unipersonal de Tacna. ', 1, 1, 1, '0', '0', 0),
(349, '2018-07-29', 1, 'Extranjeros intentan pasar la frontera ilegalmente', 'Arica. Un grupo de ciudadanos de nacionalidad dominicana fueron intervenidos por carabineros en el control fronterizo de Chacalluta tras pretender ingresar a Chile como ilegales a bordo de un vehículo procedente de Tacna.  Los agentes policiales intervinieron en el frontis de la Cuarta Comisaria de Chacalluta a un colectivo de patente peruana que trasladaba a los cuatro extranjeros, los mismos que habían abordado el vehículo en una zona descampada cerca del control fronterizo. Se conoció que los dominicanos llegaron a un acuerdo previo con el chofer para que los traslade a Arica a cambio de una buena cantidad de dinero. El conductor detenido por el presunto delito de trata de personas y el colectivo fue incautado por los carabineros como parte de las diligencias.', 1, 1, 1, '0', '0', 0),
(350, '2018-07-29', 1, 'Policía incauta ladrillos traídos de Bolivia', 'Puno. Luego de un operativo,  agentes policiales incautaron ladrillos de procedencia boliviana que eran transportados en un camión por contrabandistas integrantes de la organización “La Culebra Norte”. La intervención se registró en el km. 43 de la vía Huancané – Juliaca la madrugada del viernes último. El conductor del camión emprendió a la fuga tras notar la presencia policial. Fueron incautados ladrillos por cerca de 6 mil 800 soles.', 1, 1, 1, '0', '0', 0),
(351, '2018-07-30', 1, 'Emisión de facturas por contingencia en un mes', 'A partir del 1 de setiembre de este ańo, la Superintendencia Nacional de Aduanas y de Administración  Tributaria (Sunat), advirtió que los 150 mil contribuyentes obligados a dar comprobantes de pago electrónicos, que se vean obligados a imprimir, deberán atender a nuevos requisitos. Cuando estén obligados a imprimir, Sunat autorizará solo 10% del promedio mensual de los comprobantes de los últimos seis meses, o el equivalente a 100 papeles por cada tipo de comprobante. El 90% restante debe estar registrado en el Sistema de Emisión Electrónica (SEE). ', 1, 1, 1, '0', '0', 0),
(352, '2018-07-30', 1, 'Saquean camión cargado de mercadería de contrabando en Puno', 'Puno. Agentes de Aduanas y de la Policía se retiraron del lugar porque violentas personas, supuestamente, salieron en defensa de La Culebra del Norte, pero se llevaron los productos en Huancané. Un camión cargado de mercadería de contrabando de la denominada red La Culebra del Norte se volcó esta madrugada y fue saqueado por los habitantes del distrito de Taraco, en la provincia de Huancané, en la región Puno. La pesada unidad, sin placa, se estrelló contra un poste de alumbrado público y  volcó a un costado de la carretera Huancané-Juliaca. Agentes de Aduanas y de la Policía indicaron que llegaron al lugar, ubicado en el límite entre el sector de Tuni Grande y el centro poblado de Ramis, en Taraco, e incautó parte de la mercadería. Sin embargo, decidieron retirarse para evitar enfrentamientos con la ciudadanía que, al parecer, salió en defensa de los contrabandistas. ', 1, 1, 1, '0', '0', 0),
(353, '2018-07-31', 1, 'Incautan zapatillas por S/ 50 mil', 'Gregorio Albarracín. Agentes de la Policía Fiscal intervinieron vehículo que transportaba calzado “bamba” de las marcas Nike, Adidas y Vans. Durante un operativo realizado en la asociación Vista Alegre personal de la Policía Fiscal intervino un taxi que trasladaba gran cantidad de zapatillas de contrabando. El vehículo de placa V20-395, conducido por Humberto Daniel Pérez Pacoticona(41), fue interceptado por la Policía tras observar que transportaba bultos en la parte posterior. La dueńa de la mercadería se identificó como la comerciante Elsa Cahuaya Quispe (53). En el registro vehicular se halló seis sacos de polietileno que contenían un total de 254 pares de zapatillas “bamba” de las marcas Adidas, Nike, I-Run y Vans. La mujer no poseía la documentación que acreditara la procedencia legal de la mercadería, por lo que fue detenida y trasladada a las oficinas de la Policía Fiscal por estar presuntamente involucrada en el delito contra la propiedad intelectual (uso no autorizado de la marca). La mercadería incautada fue valorizada en 50 mil soles e internada en los almacenes de Aduanas por disposición fiscal.', 1, 1, 1, '0', '0', 0),
(354, '2018-07-31', 1, 'Exportan 5.700 toneladas de cebolla a Chile', ' En lo que va del ańo la región Tacna exportó más de 5.700 toneladas de cebolla fresca a Chile, dio a conocer el Servicio Nacional de Sanidad Agraria (Senasa). Recientemente se certificó el envío de 30 toneladas de cebolla blanca al vecino país tras obtener el certificado fitosanitario, que es garantía de que el producto está libre de residuos vegetales, raíces, tierra y plagas contaminantes. El producto fue procesado y envasado en una planta de empaque certificada. La Senasa reveló que el rendimiento del cultivo de este producto en Tacna es elevado. Sus principales zonas productoras son los distritos La Yarada - Los Palos, Locumba  e Ite', 1, 1, 1, '0', '0', 0),
(355, '2018-07-31', 1, 'Cae padre con Requisitoria por Omisión de Alimentos', 'Alfredo Cutipa Ururi(32) fue intervenido ayer por la Policía del Complejo Fronterizo Santa Rosa al intentar abandonar el país con destino a Chile, teniendo una requisitoria vigente por el delito de omisión de asistencia familiar. Cutipa era solicitado por el Juzgado penal de Tacna y fue llevado al P.J. ', 1, 1, 1, '0', '0', 0),
(356, '2018-07-31', 1, 'Agentes encuentran 248 paquetes de cocaína tipo ladrillo en el Vraem', 'Junín. Los agentes de la División de Maniobra Contra el Tráfico Ilícito de Droga de la Policía Nacional de Junín encontraron 248 paquetes de cocaína tipo ladrillo camuflados en la parte inferior de una lancha. La embarcación estaba ubicada en la orilla del río Tambo, en la comunidad nativa de Coriteni, en la provincia de Satipo', 2, 1, 1, '0', '0', 0),
(357, '2018-08-01', 1, 'En la frontera cae delincuente con requisitoria', 'Tacna. Agentes de la comisaria La Concordia al mando del mayor PNP Julio César Valencia Calderón intervinieron en el control fronterizo Santa Rosa al obrero Wilder Manuel Ocas Moreno (36) alias “Carmelo”, avezado delincuente del norte del país que tenía orden de captura vigente por el delito de homicidio calificado emitida por el Juzgado Penal Supraprovincial de Trujillo', 2, 1, 1, '0', '0', 0),
(358, '2018-08-01', 1, 'VII Comité de Integración y Desarrollo Fronterizo Perú – Chile', 'Arica. La solución a problemas como la “piratería”, transmisión de enfermedades o el desarrollo hospitalario entre las regiones de Tacna y Arica se debatirá hoy y mańana en el VII Comité de Integración y Desarrollo Fronterizo Perú – Chile, que se realizará en el salón Pacífico del hotel Arica, en la vecina ciudad. En el marco de la subcomisión de Trata de Personas y Tráfico ilícito de Inmigrantes, Carabineros de Chile compartirá información con la Policía Nacional del Perú sobre la existencia de procedimientos de importancia en la detención de personas que pasen la frontera por pasos no habilitados. El resto de subcomisiones son las Voluntariado Juvenil, Recursos de Flora y Fauna Silvestre, Fitosanitaria, Control Integrado, Aduanas, Cooperación y Coordinación Policial, Judicial y Penitenciaria, Transporte e Infraestructura Vial y Complejos Fronterizos.', 2, 1, 1, '0', '0', 0),
(359, '2018-08-01', 1, '“Área de Trata de personas debe volverse unidad policial”', 'Tacna. El jefe del Departamento de Investigación Criminal de la Región Policial de Tacna, comandante de PNP, Jesús Montesinos del Carpio, dio a conocer que realiza el trámite para subir de nivel el área de Trata de Personas y Tráfico de Migrantes con el fin de que disponga de más recursos. Montesinos agregó que para mejorar las intervenciones actualmente se trabaja con un sistema informático para el cruce de información con la policía chilena a través de la subcomisión regional de Lucha contra la Trata de Personas. ', 2, 1, 1, '0', '0', 0),
(360, '2018-08-01', 1, 'Exportaciones peruanas aumentaron 17.51% en junio del 2018, según el INEI', 'Las exportaciones peruanas aumentaron en 17.51% en junio del presente ańo, en comparación con similar mes del 2017, informó hoy el Instituto Nacional de Estadística e Informática (INEI). Las importaciones de materias primas y productos intermedios aumentaron en 21.15% en junio del 2018, en comparación con igual mes del ańo pasado. Por el contrario, las importaciones de bienes de consumo disminuyeron en 4.13% en junio del 2018, en comparación con el mismo mes del ańo anterior. Asimismo, la recaudación por concepto de Tributos Aduaneros fue de 2,558 millones de soles, es decir, 24.54% más a lo reportado en igual mes del ańo pasado. ', 2, 1, 1, '0', '0', 0),
(361, '2018-08-02', 1, 'Modifican el procedimiento general  “Importación para el Consumo”\n DESPAPG. 01-A (versión 2)', '', 2, 1, 1, '0', '0', 0),
(362, '2018-08-02', 1, 'Nestlé: Lote contaminado de fórmula infantil no ingresó al Perú', 'Ante la alerta sanitaria emitida por el Ministerio de Salud de Chile, respecto al riesgo de contaminación por moho en el producto NAN Prematuros Nestlé de 400 gramos, lote N° L80190346AH, la Dirección General de Salud Ambiental e Inocuidad Alimentaria (Digesa) del Ministerio de Salud (Minsa) informó que dicho lote afectado no ha ingresado al Perú. Ello se determinó luego de acciones de vigilancia y control realizadas en coordinación con la Superintendencia Nacional de Aduanas y de Administración Tributaria (Sunat).', 2, 1, 1, '0', '0', 0),
(363, '2018-08-02', 1, 'Recaudación de ISC aumenta en más de 40%', 'Según la Superintendencia Nacional de Aduana y de Administración Tributaria (Sunat), la recaudación del impuesto selectivo al Consumo(ISC) ascendió a S/426 millones, monto superior en 41.37% al registrado en junio del 2017. Cabe seńalar que en mayo, mes desde el cual se aplicó el incremento de ISC, la recaudación fue mucho mayor(S/517 millones). En el caso de tributos aduaneros, se obtuvo un aumento de 24.5%. ', 2, 1, 1, '0', '0', 0),
(364, '2018-08-02', 1, 'Incautan 17 kilos de droga en ómnibus internacional', 'Arica. Fiscalizadores del Servicio Nacional de Aduanas de Chile detectaron 17 kilos 520 gramos de marihuana en un bus internacional que viajaba de Colombia a Santiago de Chile. El hallazgo se produjo en el complejo fronterizo Chacalluta. El director regional de la Aduana de Arica, Hugo Yávar Ońate, seńaló que durante las labores de fiscalización en las islas del complejo fronterizo se perfiló para una revisión especial a un bus de recorrido internacional. De esa forma un can detector alertó a su guía sobre la presencia de trazas de droga en la estructura, por lo que se remitió el vehículo a la zona de revisión con tecnología no invasiva. “De esta forma se halló una estructura de fibra de vidrio que en su interior escondía 32 paquetes rectangulares envueltos con cinta plástica de color negro, los cuales contenían un total de 17 kilos 520 gramos de marihuana”, seńaló el funcionario. El bus de patente peruana, viajaba de Colombia a Santiago de Chile con 32 pasajeros. La droga incautada tiene un valor que supera los 87 millones de pesos en el mercado ilícito. Durante la inspección y el registro de pasajeros quedó como sospechoso el chofer del bus, quien fue detenido por la policía chilena para que brinde su manifestación. ', 2, 1, 1, '0', '0', 0),
(365, '2018-08-03', 1, 'Hallan más de 32 kilos de droga en taxi', 'Tacna. Personal de la Dirandro Lima con colaboración de la Policía Nacional de Transito de Tacna, intervinieron el vehículo de placa Z4C-112 con casquete de taxi de la empresa Patrón. A bordo del vehículo fueron halladas dos maletas conteniendo más de 32 kilos de clorhidrato de cocaína acondicionada en 32 paquetes tipo ladrillo, informó el jefe de la región policial, coronel Walter Arapa. El chofer quien se registra también como propietario fue identificado como César Cusi Acero, quien fue detenido y trasladado a las instalaciones del Departamento Antidrogas. El cargamento junto al taxi,  fue llevado a las Policías de Tránsito. La intervención se realizó el 1 de agosto e incluso duró hasta altas horas de la noche.', 2, 1, 1, '0', '0', 0),
(366, '2018-08-03', 1, 'En tráiler hallan juguetes falsificados por un valor de S/ 500 mil', 'Tacna. Juguetes de modelos  patentados y fabricados de forma ilegal en el continente asiático fueron incautados por la Aduana, PNP y Ministerio Público, en un operativo realizado la noche del miércoles en el complejo aduanero de Tomasiri. El tráiler Volvo de placa Z4T-883 y tolva con placa Z1R-982 fue detectado la noche del 1 de agosto y trasladado a la Policía Fiscal.      Según el jefe de la región policial de Tacna, coronel Walter Arapa, se trata de mercadería de importación que no contaba con documentos que acrediten la legalidad del uso de marcas reconocidas. El conductor del vehículo Víctor Rodrigo Tevez Anco fue detenido por el presunto delito contra los derechos intelectuales en la modalidad de delito contra los derechos de autor y conexos de imágenes protegidas. La fiscal Virginia Salas Mendoza ayer dispuso que la mercadería sea trasladada al almacén del Ministerio Público. ', 2, 1, 1, '0', '0', 0),
(367, '2018-08-03', 1, 'Perú lidera el consumo per cápita de alcohol ilegal en la región', 'En el 2017, el volumen de las bebidas alcohólicas ilegales en Perú tuvo una participación del 26.2% del mercado total, equivalente a US$ 605 millones en términos del valor de venta retail ilegal (o RSP del inglés Retail Selling Price), según el estudio de la empresa de investigación de mercado global Euromonitor International. ', 2, 1, 1, '0', '0', 0),
(368, '2018-08-03', 1, 'PDI Chile reveló incremento de ingresos por pasos no autorizados cerca al Complejo Fronterizo Chacalluta', '', 2, 1, 1, '0', '0', 0),
(369, '2018-08-03', 1, 'Lo sorprendieron caminando en plena pampa cargando una mochila con droga en  frontera Chile - Bolivia', '', 2, 1, 1, '0', '0', 0),
(370, '2018-08-04', 1, 'Aduaneros encuentran 10 kilos de droga en bus interprovincial', 'Tacna. Agentes del control de Tomasiri intervinieron un bus interprovincial de la empresa Morenos la noche del jueves hallando una carga de whisky, pero al continuar las diligencias hallaron dos mochilas negras conteniendo un total de 10 paquetes tipo ladrillo con un logo bajo relieve en forma de conejo. El peso total de la incautación fue de  diez kilos  400 gramos de clorhidrato de cocaína. Los propietarios del equipaje habrían escapado aprovechando que los pasajeros tuvieron que bajar del bus para permitir que se realicen – al inicio- acciones de búsqueda de más cajas de whisky a bordo del bus. Ningún pasajero asumió la propiedad de las mochilas. Dos oficiales de Aduanas fueron trasladados con el estupefaciente al Departamento Antidrogas para rendir su manifestación. Participaron de las diligencias la fiscal Amalia Vega Mamani y la Defensora Pública Verónica Carazas Maquera. ', 2, 1, 1, '0', '0', 0),
(371, '2018-08-04', 1, 'Intervienen camión con contrabando por S/ 500 mil', 'Puno. Agentes de Superintendencia Nacional de Aduanas y de Administración Tributaria (Sunat) y de la Policía Nacional intervinieron un camión de carga pesada de la denominada “Culebra del Norte”, que transportaba un cargamento de mercancía de contrabando procedente de Bolivia. Según la Sunat, el cargamento de productos no contaba con documentación que ampare su procedencia legal. Se incautaron productos como cigarrillos, pirotécnicos, golosinas, alimentos, conservas y otros cuyo valor comercial supera los 500.000 soles. ', 2, 1, 1, '0', '0', 0),
(372, '2018-08-04', 1, 'Camioneta trasladaba 58 kilos de cocaína', 'Puno. Un operativo policial realizado en la carretera de Juliaca  -  Desaguadero culminó con la captura de un chofer de un vehículo, en el cual se llevaban 55 paquetes que contenían 58 kilogramos de clorhidrato de cocaína, cuyo destino era Bolivia. La intervención se realizo el ultimo miércoles, donde se intervino la camioneta de placa de rodaje ANL-715 la cual era conducida por Evaristo Ponce Castellares (41). ', 2, 1, 1, '0', '0', 0),
(373, '2018-08-05', 1, 'Chofer trasladaba más de 10 kilos de cocaína', 'Tacna. Un nuevo cargamento de droga se incautó en Tacna la Policía Nacional durante un megaoperativo realizado por personal de la Dirección Nacional Antidrogas (Dirandro) llegado desde Lima. La diligencia se realizó el último viernes, cuando la Policía logró intervenir a un vehículo de placa BAD-679, conducido por Rubén Torres Belisares, Durante el registro vehicular hallaron 14 paquetes de tipo ladrillo que contenían alcaloide de cocaína. La mańana del sábado la Policía Nacional también ingresó a una chacra ubicada en el distrito La Yarada - Los Palos donde se habría estado acopiando más droga. En las diligencia se conoció que en Piura se habían interceptado dos camiones con cerca de dos toneladas de droga que tenían como destino Tacna', 2, 1, 1, '0', '0', 0),
(374, '2018-08-05', 1, 'AJU Zotac exige más partidas arancelarias para enfrentar al mall', 'Tacna. El presidente de la AJU Zotac, Luis Chino Vargas, considera que la falta de nuevas partidas arancelarias ocasiona pérdidas económicas en el sector comercial tacneńo que no puede crecer ni competir con las grandes cadenas de mal. Refirió si bien las ventas se mantienen, solo el sector de cosméticos y perfumería se vio afectado por el impedimento a ingresar su mercadería y 150 usuarios tienen retenido sus productos hace dos ańos. ', 2, 1, 1, '0', '0', 0),
(375, '2018-08-05', 1, 'Policía incautó 8,045 kilos de insumos para drogas', 'Tras destacar la labor en la lucha contra las drogas, Medina precisó que esta incautación representa un avance al 207% en relación con la meta original prevista por la Policía Nacional del Perú (PNP) para el 2018. El titular del Mininter participo en la ceremonia de entrega de cuatro camiones especializados con herramientas y equipo utilitario para el control fronterizo, donados por el Programa de Puertos y Aduanas de la Sección de Asuntos Antinarcóticos y Aplicación de la Ley (INL) de la Embajada de Estados Unidos. Los camiones están valorizados en 700,000 dólares y tres se entregarán a la Superintendencia Nacional de Aduanas y de Administración Tributaria (Sunat), y uno a la División de Investigación contra el Desvío de Insumos Químicos de la Dirección Antidrogas de la PNP.', 2, 1, 1, '0', '0', 0),
(376, '2018-08-06', 1, 'Tenia orden de captura por actos contra el pudor e intentaba refugiarse en Chile', 'Tacna. Miembros de la Policía que resguardan el orden en el complejo fronterizo Santa Rosa intervinieron a Adelmo Revolo Contreras (52), quien tenía una requisitoria vigente por el delito de actos contra el pudor, en agravio de menores de edad. Revolo era solicitado por el Sexto Juzgado Penal de Lima desde el 19 de Julio del presente ańo. ', 2, 1, 1, '0', '0', 0),
(377, '2018-08-06', 1, 'Gobierno acelerará recuperación de dinero y bienes producto de actividades ilegales', 'Se pone de relieve la decisión política del Gobierno para emprender las reformas de los mecanismos e instrumentos legales necesarios para fortalecer la lucha del Estado contra todo acto criminal. Un nuevo instrumento jurídico se suma a la lucha contra el crimen organizado y la corrupción. Se trata del Decreto Legislativo Nş 1373 que incorpora en la legislación vigente la extinción de dominio destinada, precisamente, a facilitar la persecución penal de toda clase de activos que integren los bienes y la riqueza derivada de la actividad criminal, como el crimen organizado. La norma aplicará sobre todo bien patrimonial que constituya objeto, efectos o ganancias que tienen relación o que se derivan de las siguientes actividades ilícitas: contra la administración pública, contra el medioambiente, tráfico ilícito de drogas, terrorismo, secuestro, extorsión, trata de personas, lavado de activos, contrabando, defraudación aduanera, defraudación tributaria, minería ilegal y otras con capacidad de generar dinero, bienes, efectos o ganancias de origen ilícito o actividades vinculadas a la criminalidad organizada.  ', 2, 1, 1, '0', '0', 0),
(378, '2018-08-06', 1, 'Maratón unirá las ciudades de Arica y Tacna', 'El próximo 14 de octubre se realizará una maratón que unirá las ciudades fronterizas de Arica y Tacna donde se propone cubrir los 58 kilómetros que separan a ambas ciudades. ', 2, 1, 1, '0', '0', 0),
(379, '2018-08-06', 1, 'Emprendedores: Las seis claves para exportar por primera vez', 'El boom de las exportaciones no es exclusividad para las grandes empresas, también los pequeńos emprendedores lo pueden realizar aprovechando las ventajas arancelarias que tiene hoy el Perú en el mercado global. El Ministerio de Comercio Exterior y Turismo (Mincetur) dispuso hoy una serie de recomendaciones para emprendedores que buscan internacionalizar su producto.', 2, 1, 1, '0', '0', 0),
(380, '2018-08-07', 1, 'Trasladan a 6 detenidos por tráfico de drogas a Lima', 'Tacna. Policías de la Dirandro Lima por el operativo “Transportes del norte” realizado en Tacna, desde el 31 de julio, capturaron a seis integrantes de una banda que traficaba droga del VRAE, e incautaron 48 kilos de droga y tres vehículos. Primero se detuvo al taxista César Cusi Acero(39) con el auto de placa Z4C-112 donde había 32 paquetes tipo “ladrillo” con clorhidrato de cocaína. Después se aprehendió a  Rubén Torres Elizares(35) con 14 paquetes de droga en el vehículo BAD-679; Wilfredo Mamani Choque(36) con el vehículo Z2T-113, además de Luis Hipólito Mallqui(35), Adolfo Pineda Márquez(40) y Manuel Guillén Miguel(45). ', 2, 1, 1, '0', '0', 0),
(381, '2018-08-07', 1, 'Estados Unidos donó 4 camiones especializados para combatir el narcotráfico', 'El Gobierno de los Estados Unidos entregó al Perú 4 modernos camiones especializados en la lucha contra el narcotráfico. Los camiones especializados, valorizados en $700,000, facilitan la inspección de vehículos, embarcaciones y contenedores en puertos, aeropuertos y puestos de control fronterizo. Estos serán asignados a la Sunat y la División de Control de Insumos Químicos de la Policía Nacional del Perú (PNP) y operarán en Tumbes, Tacna y El Callao', 2, 1, 1, '0', '0', 0),
(382, '2018-08-07', 1, 'Perú aplicará aranceles adicionales a diez productos colombianos', 'El gravamen arancelario adicional será de 10%, a 10 mercancías colombianas, según lo indica el Decreto Supremo Nş 003-2018-Mincetur, publicado hoy en el Diario Oficial El Peruano. Cabe destacar que esta sanción es el resultado del incumplimiento, por parte de Colombia, a una Sentencia emitida por el Tribunal de Justicia de la Comunidad Andina, al impedir el ingreso de las exportaciones de arroz de los Países Miembros de la CAN a su mercado. ', 2, 1, 1, '0', '0', 0),
(383, '2018-08-07', 1, 'Policía identifica a sujetos que abandonaron droga en Tomasiri', 'Tacna. Los pasajeros que dejaron 2 mochilas con más de 10 kilos de cocaína en el control aduanero de Tomasiri ya se encuentran identificados, informó el jefe de la Región Policial de Tacna, Coronel  Pedro Walter Arapa. Los sujetos, cuyos nombres se mantienen en reserva, aprovecharon para bajar del bus, mientras que los agentes revisaban mercadería de contrabando. Fue en estas circunstancias que se encontraron las mochilas con droga. La Policía indicó que no revelará por el momento los nombres para no entorpecer las investigaciones. ', 2, 1, 1, '0', '0', 0),
(384, '2018-08-08', 1, 'BCP eleva su proyección de crecimiento del PBI a 4% en 2018 y 3,7% en 2019', 'El Banco de Crédito de Perú (BCP) corrigió al alza su proyección de crecimiento del producto bruto interno (PBI) para este y el próximo ańo, debido a la mayor expansión que registraría la economía en el segundo trimestre y un cronograma de inversiones más acelerado del proyecto minero Quellaveco. En un reporte, la entidad financiera dijo que ahora prevé que el PBI alcanzará una expansión de 4% este 2018, desde un 3,8% estimado anteriormente. También, elevó de 3,5% a 3,7% su estimación de crecimiento de la economía para el próximo ańo', 2, 1, 1, '0', '0', 0),
(385, '2018-08-08', 1, 'Bolivia reubicará 24 cuarteles en frontera con Chile y Perú para lucha contra el contrabando', 'Bolivia. El viceministro de Lucha Contra el Contrabando de Bolivia, Gonzalo Rodríguez, anunció este martes que las Fuerzas Armadas (FFAA) reubicarán 24 unidades militares ubicadas en las fronteras con Chile y Perú, para fortalecer el combate contra el ingreso de productos ilegales al territorio nacional. “Son 19 puestos con relación a Chile y en el Perú 5 puestos, que vamos a llevar a la frontera", informó a los periodistas. Anunció que las unidades militares estarán desplegadas hasta diciembre en toda la frontera con Chile y desde la zona sur de la frontera con Perú, hasta la región de Ulla Ulla, en el norte. ', 2, 1, 1, '0', '0', 0),
(386, '2018-08-08', 1, 'Devoluciones incompletas ', 'Casi cuatro meses después de la última fecha para realizar la declaración jurada del Impuesto a la Renta del ejercicio 2017, la Sunat aún no ha terminado de atender todas las solicitudes para la devolución de impuestos que, a partir de este ańo, iba a realizarse de manera automática. Hasta el momento se han atendido el 91 % de las solicitudes de devolución a solicitud del contribuyente y el 96 % de las devoluciones de oficio. ', 2, 1, 1, '0', '0', 0),
(387, '2018-08-08', 1, 'Gas licuado: demanda llega a 1.78 millones de toneladas y alcanza US$ 2,000 millones', 'La demanda de gas licuado en el país alcanzó 1.78 millones de toneladas el ańo pasado por un valor de 2,000 millones de dólares, informó hoy la Sociedad Peruana de Gas Licuado (SPGL', 2, 1, 1, '0', '0', 0),
(388, '2018-08-09', 1, 'En la frontera detienen a mujer por requisitoria', 'Tacna. Personal policial de la comisaría de La Concordia intervino en el complejo fronterizo Santa Rosa a la ciudadana Flora Valdez Ccalle(50) por tener un orden de captura vigente por el delito de estafa emitida por el Tercer Juzgado Penal de Tacna. ', 1, 1, 1, '0', '0', 0),
(389, '2018-08-09', 1, 'Incautan mercadería en sector de Vila Vila', 'Tacna. Durante el operativo Contrabando 2018 realizado por agentes de la Policía Fiscal en la vía Costanera se intervino un vehículo que trasladaba mercadería de contrabando cerca al sector de Samas – Las Yaras. En esta vía la PNP observó una camioneta que se desplazaba sigilosamente. Los agentes intervinieron la camioneta de placa V8E-859 conducida por Aron Manfer Rojas Flores (40). Inicialmente el conductor se mostró reacio a la intervención alegando que tenía la documentación que avalaba la procedencia legal de la mercadería. Durante el registro vehicular. En la tolva de camioneta se ocultaban prendas de vestir y calzado con un valor total de 60 mil soles. La mercadería fue internada en los almacenes de Aduanas para el aforo y avalúo.', 1, 1, 1, '0', '0', 0),
(390, '2018-08-09', 1, 'Cae ciudadano tacneńo con 30 kilos de cocaína en Chacalluta', 'Arica. El sujeto fue identificado como Brandon Olano Mosquera (23), y fue interceptado por agentes del Servicio Nacional de Aduanas de Chile en el control fronterizo de Chacalluta. Según indicó el representante del Servicio de Aduanas Chile, Hugo Yávar Ońate, el vehículo del intervenido fue escaneado con un equipo de rayos X en la isla N° 1 del puesto fronterizo, de esta manera, se descubrieron 6 paquetes ocultos en la estructura del auto. Se tuvo que utilizar otras herramientas para desarmar el auto, lo que hizo posible el hallazgo de 29 paquetes de clorhidrato de cocaína. El peso del cargamento es de 30 kilos 655 gramos, mientras que el valor asciende a aproximadamente 613 millones de pesos chilenos. ', 1, 1, 1, '0', '0', 0),
(391, '2018-08-09', 1, 'Incautan 40 kilos de droga en pleno centro de Tacna', 'Tacna. Otro cargamento de droga fue hallado el pasado martes en la calle Alto Lima, cerca al cruce con la calle Amazonas. En total, se encontraron 40 kilos de alcaloide de cocaína, los que estaban escondidos en un auto con placa de rodaje Z2Z-097. Durante la intervención fue detenido el ciudadano Miguel Ángel Huamán Ortega (34). Se supo que esta persona iba a entregar la droga a otro sujeto por inmediaciones del aeropuerto Carlos Ciriani. Los efectivos policiales lograron ubicar al auto con placa D4J-434, pero su conductor logró escapar del lugar. ', 1, 1, 1, '0', '0', 0),
(392, '2018-08-10', 1, 'Incautan ropa de segundo uso por un valor de 350 mil soles ', 'Tacna. En un operativo realizado por agentes de la Policía Fiscal, se intervino un camión abandonado en el distrito de Ticaco cargado de gran cantidad de fardos de ropa de segundo uso. Se trata de un trabajo de inteligencia realizado por la PNP, mediante el cual se conoció que en el mencionado lugar existía una zona de pase de vehículos quera era usado por contrabandistas para trasladar cantidad de mercadería de dudosa procedencia, evadiendo todo tipo de control aduanero y policial. En una trocha carrozable, se intervino al camión de placa V2L-938, cuyo chofer se había dado a la fuga tras notar la presencia policial. Lo incautado fue valorizado en 350 mil soles y el fiscal de turno dispuso su inmediato internamiento en los almacenes para el aforo y avalúo.', 1, 1, 1, '0', '0', 0),
(393, '2018-08-10', 1, 'Operativo en el aeropuerto de Chacalluta logró detener a traficante', 'Arica. No alcanzó ni a tomar el vuelo a Santiago, cuando carabineros del Departamento de Drogas OS-7 detuvo en el aeropuerto de Chacalluta a un sujeto que pretendía trasladar droga a la capital. La sustancia ilícita la adquiría desde el Perú. El hombre fue trasladado hasta una dependencia habilitada para la revisión corporal, donde se estableció que transportaba oculto adosado a su cuerpo en la zona abdominal y glúteos, 3 paquetes contenedores de marihuana tipo cripy, de la que se logró incautar 2 kilos 5 gramos. Pero el operativo continuó en Santiago, agentes encubiertos lograron detener al receptor final de la droga, se trata de un ciudadano de nacionalidad rumana. El jefe de la OS-7, informó que el imputado mantenía condenas por el mismo delito, incluso hace 5 ańos atrás, cayó en Arica con más de 100 kilos de droga y estuvo privado de libertad en la Cárcel de Acha.', 1, 1, 1, '0', '0', 0),
(394, '2018-08-10', 1, 'Nuevos mercados para los exportadores', 'Cuatro nuevos mercados de destino tienen las exportaciones peruanas (con ello, suman 169), en el primer semestre del ańo, según la Asociación de Exportadores(Adex). “Si bien se dejó de exportar a algunos países, se sumaron otros como Islas Norfolk, Santo Tomé y Príncipe, Maldivas y Tokelau”, precisó. ', 1, 1, 1, '0', '0', 0);
INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`, `eliminado`) VALUES
(395, '2018-08-11', 1, 'Cae contrabando por más de un millón de soles', 'Tacna. Un duro golpe al contrabando se dio la mańana del viernes donde agentes de la Policía de Fronteras de Alto Perú lograron intervenir dos camiones de placa chilena cargados con mercadería de contrabando. Fuentes policiales informaron que los camiones de placa JDCP-15 y HSHY-72 fueron interceptados entre el hito 76 y 77 de la frontera. Los vehículos ya habían ingresado al territorio nacional cuando la policía, se percató que se trataba de contrabandistas y procedieron a la intervención. Se intervinieron a cuatro varones quienes intentaron deslindar responsabilidad aduciendo que eran estibadores. El cargamento esta valorizado en más de 1 millón de soles y se trata de prendas de vestir para dama y varón además de ropa interior. El cargamento incautado fue internado en los almacenes de Aduanas en Tomasiri.', 1, 1, 1, '0', '0', 0),
(396, '2018-08-11', 1, 'CCL: Arancel de 10% a productos de Colombia puede generar subida de precios', 'Resumen', 1, 1, 1, '0', '0', 0),
(397, '2018-08-12', 2, 'Intentaron ingresar a este quirquincho por Chacalluta', 'Arica. Fiscalizadores de Aduanas detectaron e incautaron un quirquincho disecado que era transportado en una maleta por una ciudadana de nacionalidad peruana. El procedimiento se registró en el complejo fronterizo Chacalluta y responde al rol institucional de protección de las fronteras para evitar todo tipo de contrabando. La mujer que transportaba el quirquincho no informó que traía la especie cuando contestó y firmó la declaración jurada que entrega SAG y Aduanas. Al ser consultada por los fiscalizadores, dijo que el 2014 adquirió la especie en Bolivia y la mantenía guardada en su casa de Arequipa, Perú, desde donde decidió traerla como amuleto de la suerte para un altar que desea habilitar en una vivienda de Arica. El director regional de Aduanas, Hugo Yávar, seńaló que una vez detectado el contrabando se estableció comunicación con el fiscal de turno, Elías Gutiérrez, quien instruyó remitir la especie hasta el almacén de Aduanas y dejar citada a la pasajera. Hay que seńalar que el quirquincho está protegido por la Convención sobre el Comercio Internacional de Especies amenazadas de Flora y Fauna Silvestre ', 1, 2, 1, '0', '0', 0),
(398, '2018-08-12', 1, 'Dirigente de futbol pasará 15 ańos preso por narcotráfico', 'Tacna. La Sala Penal de Apelaciones del Poder Judicial confirmó la sentencia de 15 ańos de prisión efectiva contra Abdón Alberto Palza Justo, exdirigente deportivo de un club de futbol de Ciudad Nueva, por tráfico ilícito de drogas. Palza junto Christian Herrera Chambilla y Cesar Cordova Espejo, se les acusó de integrar una banda que acopió 165 kilos de marihuana en Tacna, la que pretendían llevar a Chile, en el ańo 2015. ', 2, 7, 1, '0', '0', 0),
(399, '2018-08-12', 1, 'Crecen exportaciones', 'En junio, el valor de las exportaciones tradicionales fue de $3424 millones, mayor en 18% al de junio del 2017, influenciado por las mayores ventas de cobre y derivados del petróleo, gas natural, harina de pescado y zinc. En junio los precios de exportaciones de productos tradicionales subieron 22.5%. Según el Banco Central de Reserva, la cifra de junio del 2018 es la más alta desde diciembre del 2011(90 meses). ', 1, 1, 1, '0', '0', 0),
(400, '2018-08-13', 15, 'Incautan una tonelada de insumos de narcotráfico', 'Ayacucho. Cerca una tonelada de insumos químicos, utilizados para el narcotráfico, fueron incautados por efectivos de la División de Investigación d insumos Químicos, en el distrito de Huanta', 2, 7, 1, '0', '0', 0),
(401, '2018-08-13', 2, 'Detienen a pareja de peruanos fajada con droga en el Control Fronterizo de Chacalluta', '', 2, 7, 1, '0', '0', 0),
(402, '2018-08-13', 15, 'Policía detiene a tres personas e incauta 100 kilos de cocaína', 'Piura. En un operativo realizado por la Policía Nacional y la Fiscalía Antidrogas se logró incautar 100 kilos de cocaína en 97 paquetes tipo ladrillo. La acción conjunta, además, permitió capturar a tres personas en la urbanización Los Tallanes, en la región Piura. Los detenidos fueron identificados como Olga Benítez Espinoza, Francis Farías Navarro y el colombiano Julio Lima Giraldo. Todos formarían parte de la banda criminal “Los colochos”.  ', 2, 7, 1, '0', '0', 0),
(403, '2018-08-14', 14, 'Puno: PNP incauta 66 paquetes de cocaína camuflados en una camioneta', 'Puno. Agentes de la Dirección Antidrogas (Dirandro) de la Policía Nacional capturaron a un hombre cuando transportaba en un vehículo 66 paquetes de cocaína en la región Puno. El operativo policial se realizó en el puesto de control aduanero de Ojherani. Asimismo, estas acciones contaron con la participaron de representantes del Ministerio Público. Los efectivos intervinieron una camioneta de placa F8E- 662 en el lugar. Tras registrar el interior del vehículo, hallaron camuflados en los compartimientos 66 paquetes que contenían cocaína. El conductor de la camioneta, Juan Chacolla (29), fue detenido por la policía. Asimismo, fue trasladado al Departamento de Operaciones Tácticas Antidrogas (Depotad) de San Ramón para las diligencias de ley. ', 2, 7, 1, '0', '0', 0),
(404, '2018-08-14', 1, 'Incautan productos naturistas “bamba”', 'Tacna. Durante un operativo realizado por agentes policiales del grupo Terna en coordinación con personal de la Dirección Ejecutiva de Medicamentos, Insumos y Drogas(Diremid) se intervino dos locales dedicados a la venta de supuestos productos naturistas de dudosa procedencia en cuyos empaques se les atribuía propiedades terapéuticas.  En la avenida Vigil 1092 se intervino el local denominado “Centro Naturista” de propiedad de Valentina Huallpa Gutierrez (33), donde se incautó 593 productos que no contaban con registro sanitario, fecha de vencimiento, además de no ser correctamente almacenados. De manera simultánea se intervino también el local “Inca natur” en la avenida Vigil 1089 de propiedad de Sabin Pongo Aycaya(54).  De igual manera el dueńo no puso sustentar la documentación correspondiente su mercadería, incautándose un total de 1389 productos.', 1, 7, 1, '0', '0', 0),
(405, '2018-08-14', 12, 'Muelles y caletas del sur están cerrados', 'Son 52 los puertos, terminales y caletas del litoral centro y sur del país que permanecen cerrados como medida de prevención por la presencia de oleajes ligeros y moderados, informó la Dirección de Hidrografía y Navegación (DHN) de la Marina de Guerra del Perú. En el sur mantiene esa condición las caletas de Nasca, Lomas, Sagua, Tanka, Chala, Puerto Viejo, Atico, La Planchada, Quilca, El Faro, Morro Sama y Vila Vila,; los puertos San Nicolás, Sanjuan y Matarani(muelle Ocean Fish);y los terminales multiboyas Mollendo y portuario Tisur (Muelle C y F).(', 1, 1, 1, '0', '0', 0),
(406, '2018-08-15', 11, 'Detienen a pasajero con pasta base de cocaína en mochila', 'Iquique. Durante un control vehicular Carabineros de la Tenencia Huara, detuvieron a un hombre de nacionalidad peruana. El mismo viajaba en un minibús, portando cerca de 14 mil dosis de drogas al interior de una mochila con doble fondo. Mientras el personal de esta unidad realizaba servicios en la ruta 5, fiscalizaron un vehículo de transporte proveniente de Colchane. Al fiscalizar a los pasajeros, verificaron que uno de ellos no figuraba en la relación del móvil, debido a que habría subido en el paradero ubicado antes del complejo. Al realizar pericias en su equipaje, los uniformados observaron que el peso del bolso no concordaba con las especies que había en su interior, por lo que observaron detalladamente, percatándose que por el borde de la mochila, entre las espumas del respaldo de la mochila, había adosado un paquete rectangular similar a los contenedores de drogas. La sección OS7, comprobó que la especie contenía 2 kilos 760 gramos de pasta base de cocaína, equivalentes a 13.800 dosis.', 2, 5, 1, '0', '0', 0),
(407, '2018-08-15', 11, 'Senasa verifica importación de ganado de Chile', 'Gregorio Albarracín. El Servicio Nacional de Sanidad Agraria (Senasa) de Tacna verificó la importación de 59 cabezas de ganado “Alberdeen andus” de Chile con el propósito de mejorar el patrimonio genético por parte de una empresa privada, según explicó Alberto Díaz, director de la entidad. Seńaló que los animales iniciaron un proceso de incorporación de cuarentena para la recría. El 2017, fueron más de 500 animales que se importaron desde el país vecino para comercializar su carne. También iniciaron el proceso de cuarentena de 55 mil estacas de plantas de granado para las respectivas plantaciones. Senasa cumple con el seguimiento y evaluación de los requisitos sanitarios para su levantamiento final, anotó. ', 1, 7, 1, '0', '0', 0),
(408, '2018-08-17', 11, 'Logran incautación récord de cigarrillos en Iquique', 'Iquique. Dos contenedores con 875 mil cajetillas de cigarrillos, fueron incautados por fiscalizadores del Servicio Nacional de Aduanas de la comuna de Iquique. Funcionarios detectaron igualmente otros dos container, con 9.332 juguetes falsificados y 9.565 chaquetas que imitaban marcas originales. Las autoridades informaron, ayer, que dicho contrabando de cigarros trató de eludir el pago correspondiente a $2.430 millones en impuestos. Claudio Sepúlveda, director nacional de Aduanas, informó que los cigarrillos eran de origen coreano, de las marcas Pine Blu, Carnivaly Pine. "Se trabajó en esta línea de investigar documentación, origen y destino de la mercancía, estamos hablando de cuatro contenedores con una evasión que significa una merma importante en nuestro comercio legítimo", detalló Sepúlveda.', 1, 2, 1, '0', '0', 0),
(409, '2018-08-17', 14, 'Sunat interviene en Puno más de 100 kilos de alcaloide de cocaína', 'Puno. La Superintendencia Nacional de Aduanas y Administración Tributaria (Sunat) intervino en Puno a un vehículo de transporte de pasajeros, procedente de la ciudad de Lima, detectando durante la revisión cuatro cajas de cartón que en su interior contenían alrededor de 102 kilos de alcaloide de cocaína. La intervención se realizó en el Puesto de Control Aduanero de Cabanillas en Puno, cuando se trasladaban las cajas de cartón como si fuera una encomienda. Al efectuar la revisión se detectó una sustancia en polvo de color blanquecino, la misma que al ser sometida a las pruebas de campo dio como resultado positivo para alcaloide de cocaína', 2, 4, 1, '0', '0', 0),
(410, '2018-08-18', 1, 'Decomisan cigarros por S/ 30 mil', 'Tacna. Agentes del Departamento de la Policía Fiscal (Depolfis), Unidad de Servicios Especiales (USE) e inteligencia Intervinieron el local La Rampa, ubicado en la intersección de la avenida Bolognesi y el pasaje Paillardelle, donde incautaron 21 sacos con cigarrillos de contrabando por un valor de 30 mil soles. El operativo realizó desde las 10:00 de ayer viernes 17 de agosto contando con la participación del fiscal Nazario Quispe Suel, la consultora legal e la Sociedad Nacional de Industria, Alana Rodríguez Ruiz, y como veedor del Ministerio de la Producción, Hugo Carrillo Zavala. En total intervinieron cinco puestos de venta que no tenían documentos para avalar la procedencia legal de la mercadería, procediendo a la incautación de cientos de displays de cajas de cigarros de diferentes marcas que fueron acopados en 21 sacos de polietileno.  La mercadería fue trasladada al departamento de investigación criminal para el conteo y valorización para luego ser puesta a disposición en un almacén de Aduanas por orden del fiscal de turno. El operativo multisectorial se realizó conforma al plan establecido por el comité regional de lucha contra los delitos aduaneros y la piratería', 1, 7, 1, '0', '0', 0),
(411, '2018-08-20', 11, 'Baño de un bus iba pasando marihuana cripy', 'El Ministerio de Agricultura y Riego a través del Servicio Nacional de Sanidad Agraria(Senasa) certificó  toneladas de palta fuerte para su exportación a Chile en la planta empacadora Guadalcazar S.A. ubicada en el centro poblado Los Ángeles del distrito de Moquegua. Durante inspección, el especialista del Senasa certificó el cumplimiento de los requisitos fitosanitarios del producto que establece el país importador, el correcto embalaje de las cajas de primer uso, con código de lugar de producción, empacadores, departamento, productor y campańa. Además cada palta cuenta con una etiqueta autoadhesiva donde indica el código de la empacadora y la leyenda Producto del Perú. Este producto proviene de las zonas de producción de Omate en Moquegua y Locumba en Tacna, las cuales son certificadas previamente por la autoridad agraria.  ', 2, 5, 1, '0', '0', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interventor`
--

CREATE TABLE IF NOT EXISTS `interventor` (
`id_interventor` int(15) NOT NULL,
  `nom_interventor` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `representante` char(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `interventor`
--

INSERT INTO `interventor` (`id_interventor`, `nom_interventor`, `representante`) VALUES
(1, 'Aduanas Tacna', NULL),
(2, 'Aduanas Chile', NULL),
(3, 'Aduanas Ilo', NULL),
(4, 'Aduanas Puno', NULL),
(5, 'PDI Chile', NULL),
(6, 'Migraciones ', NULL),
(7, 'PNP', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inter_delito`
--

CREATE TABLE IF NOT EXISTS `inter_delito` (
`Id_inde` int(15) NOT NULL,
  `id_intervencion` int(15) NOT NULL,
  `id_delito` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inter_delito`
--

INSERT INTO `inter_delito` (`Id_inde`, `id_intervencion`, `id_delito`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 5, 1),
(5, 6, 3),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inter_inter`
--

CREATE TABLE IF NOT EXISTS `inter_inter` (
`id_int` int(15) NOT NULL,
  `id_intervencion` int(15) NOT NULL,
  `id_interventor` int(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inter_inter`
--

INSERT INTO `inter_inter` (`id_int`, `id_intervencion`, `id_interventor`) VALUES
(1, 2, 7),
(2, 3, 2),
(3, 4, 7),
(4, 4, 3),
(5, 5, 7),
(6, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inter_mercancia`
--

CREATE TABLE IF NOT EXISTS `inter_mercancia` (
`id_intermercancia` int(15) NOT NULL,
  `id_intervencion` int(15) DEFAULT NULL,
  `id_mercancia` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inter_mercancia`
--

INSERT INTO `inter_mercancia` (`id_intermercancia`, `id_intervencion`, `id_mercancia`) VALUES
(1, 2, 32),
(2, 3, 33),
(3, 4, 34),
(4, 5, 35),
(5, 6, 36),
(6, 2, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inter_vehiculo`
--

CREATE TABLE IF NOT EXISTS `inter_vehiculo` (
`id_intervehiculo` int(15) NOT NULL,
  `id_intervencion` int(15) DEFAULT NULL,
  `id_vehiculo` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inter_vehiculo`
--

INSERT INTO `inter_vehiculo` (`id_intervehiculo`, `id_intervencion`, `id_vehiculo`) VALUES
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_mercancia`
--

CREATE TABLE IF NOT EXISTS `item_mercancia` (
`id_item` int(15) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `item_mercancia`
--

INSERT INTO `item_mercancia` (`id_item`, `nombre`) VALUES
(1, 'Ropa dama'),
(2, 'Ropa usada'),
(3, 'Ropa varón'),
(4, 'Ropa niños'),
(5, 'Drogas'),
(6, 'Autopartes'),
(8, 'Dinero'),
(9, 'Alimentos'),
(10, 'Licor'),
(11, 'Electrodomésticos'),
(12, 'Celulares'),
(13, 'Autopartes'),
(14, 'Artículos de hogar'),
(15, 'Artículos de ferretería'),
(16, 'Carteras'),
(17, 'Cosméticos'),
(18, 'Residuos sólidos'),
(19, 'Cigarrillos'),
(20, 'Granos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE IF NOT EXISTS `lugar` (
`id_lugar` int(15) NOT NULL,
  `lugar` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pais` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`id_lugar`, `lugar`, `pais`) VALUES
(1, 'Tacna', 1),
(2, 'Complejo Santa Rosa', 1),
(3, 'Complejo Chacalluta', 2),
(4, 'Puesto De Control Tomasiri', 1),
(5, 'Puesto De Control Vila Vila', 1),
(11, 'Arica', 2),
(12, 'Ilo', 1),
(13, 'Moquegua', 1),
(14, 'Puno', 1),
(15, 'Arequipa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
`id_marca` int(15) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre`) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Mazda'),
(4, 'Volkswagen'),
(5, 'Hyundai'),
(6, 'Volvo'),
(7, 'Isuzu'),
(8, 'Mercedes'),
(9, 'Scania'),
(10, 'Hummer'),
(11, 'Kia'),
(12, 'Nissan'),
(13, 'Mitsubishi'),
(14, 'Chevrolet '),
(15, 'Renault'),
(16, 'Suzuky');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mdelito`
--
CREATE TABLE IF NOT EXISTS `mdelito` (
`nom_delito` varchar(30)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercancia`
--

CREATE TABLE IF NOT EXISTS `mercancia` (
`id_mercancia` int(15) NOT NULL,
  `item` int(15) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `unidad` int(15) DEFAULT NULL,
  `id_moneda` int(15) DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mercancia`
--

INSERT INTO `mercancia` (`id_mercancia`, `item`, `cantidad`, `unidad`, `id_moneda`, `valor`) VALUES
(32, 1, 0, NULL, 1, 7680),
(33, 5, 41, 1, NULL, NULL),
(34, 2, NULL, 1, 1, 622000),
(35, 6, NULL, NULL, 1, 700000),
(36, 8, 25550, 7, 2, 25550),
(37, 2, 12, NULL, 1, 12),
(38, 5, 2, 1, 2, 12323),
(39, 5, 56789, 1, 2, 12),
(40, 5, 56789, 1, 2, 12),
(41, 5, 23, 1, 2, 1234570),
(42, 5, 85, 4, 2, 78),
(43, 1, 85, 4, 2, 78),
(44, 11, 2, 5, 2, 100),
(45, 11, 2, 5, 1, 100),
(46, 10, 8, 2, 2, 25000),
(47, 10, 8, 2, 2, 25000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE IF NOT EXISTS `moneda` (
`id_moneda` int(15) NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `nombre`) VALUES
(1, 'Soles'),
(2, 'Dólares'),
(3, 'Pesos chilenos');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `m_interventor`
--
CREATE TABLE IF NOT EXISTS `m_interventor` (
`nom_interventor` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
`id_pais` int(15) NOT NULL,
  `nombre` char(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre`) VALUES
(1, 'Perú'),
(2, 'Chile'),
(3, 'Colombia'),
(4, 'Venezuela'),
(5, 'Bolivia'),
(6, 'Ecuador'),
(7, 'Argentina'),
(9, 'Brasil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
`id_persona` int(15) NOT NULL,
  `nombres` char(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` char(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `alias` char(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `nacionalidad` int(15) DEFAULT NULL,
  `organizacion` char(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `tipo_infractor` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `apellidos`, `alias`, `edad`, `nacionalidad`, `organizacion`, `dni`, `tipo_infractor`) VALUES
(1, 'Ruben', 'Sosa Jinchuña', NULL, NULL, 1, NULL, NULL, NULL),
(2, 'Richard Willians', 'Michel Cutipa', NULL, NULL, 1, NULL, NULL, NULL),
(3, 'Clever Jonatan', 'Muñoz Badajos', NULL, NULL, 1, NULL, NULL, NULL),
(4, 'Fredy', 'Paqui Yranga', NULL, NULL, 1, NULL, NULL, NULL),
(5, 'Jhair Erick', 'Tupac Amaru Ramos', NULL, NULL, 1, NULL, NULL, NULL),
(6, 'Robert Klanyer', 'Calderón Vasqués', NULL, NULL, 1, NULL, NULL, NULL),
(7, 'Delia Yorguina', 'Capaquera Pilco', NULL, NULL, 1, 'Los Capaqueras', NULL, NULL),
(8, 'Damaso', 'Luque Nuñez', NULL, NULL, 1, NULL, NULL, NULL),
(9, 'Juan', 'Estalla Huaripata', NULL, NULL, 1, NULL, NULL, NULL),
(10, 'Cesar', 'Capuñay Morales', NULL, NULL, 1, NULL, NULL, NULL),
(11, 'Daney', 'Olivera Jisber', NULL, NULL, 1, NULL, NULL, NULL),
(12, 'Sabino', 'Soto Arana', NULL, NULL, 1, NULL, NULL, NULL),
(13, 'Fabion', 'Contreras Canto', NULL, NULL, 1, NULL, NULL, NULL),
(14, 'Lucio', 'Escallón Camacho', NULL, NULL, 3, NULL, NULL, NULL),
(15, 'Aronaldo', 'Viafara Cundumi', NULL, NULL, 3, NULL, NULL, NULL),
(16, 'Luis Alberto', 'Pereyra Anquise', NULL, NULL, 1, NULL, NULL, NULL),
(17, 'Carla Andrea', 'Aranguiz Valenzuela', NULL, NULL, 2, NULL, NULL, NULL),
(18, 'Nathaly', 'Angulo Palmeira', NULL, NULL, 1, NULL, NULL, NULL),
(39, 'Wilson', 'Silva Aguirre', NULL, 43, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(40, 'Victor', 'Cano Salazar', NULL, 32, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(41, 'Juan', 'Sanchez Tovar', NULL, 34, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(42, 'Yeni', 'Rivera Becerra', NULL, 35, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(43, 'Jonatan', 'Barrios Ruiz', NULL, 25, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(44, 'Jonatan', 'Carrillo Cañavera', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(45, 'Nathaly', 'Grisales Rueda', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(46, 'Carlos', 'Lopez Noreña', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(47, 'David', 'Lopez Quintana', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(48, 'Andres', 'Sepúlveda Gonzales', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(52, 'Andres', 'Arango Chavez', NULL, NULL, 3, 'Los colochos de Túpac Amaru', NULL, NULL),
(53, 'José', 'Musue López', NULL, NULL, 3, '', NULL, NULL),
(54, 'Alberto', 'Correa Ramos', NULL, NULL, 3, NULL, NULL, NULL),
(55, 'Martin', NULL, 'Tío Martin', NULL, 1, NULL, NULL, NULL),
(56, 'Romulo', 'Anayhuaman Sotelo', NULL, NULL, 1, NULL, NULL, NULL),
(57, 'Jorge', 'Ramos Mamani', NULL, 32, 1, NULL, NULL, NULL),
(58, 'Maximina', 'Mamani Quispe', NULL, 57, 1, NULL, NULL, NULL),
(59, 'Helard', 'Quispe Turpo', NULL, 34, 1, NULL, NULL, NULL),
(60, 'Jhonatan Jimy', 'Perez Callata', NULL, NULL, 1, NULL, NULL, NULL),
(61, 'Miguel', 'Contreras Jilaja', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Sofia', 'Cori Marca', NULL, NULL, 1, NULL, NULL, NULL),
(63, 'Mariano', 'Chara Cuito', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'W.J.', 'R.B.', NULL, NULL, 1, NULL, NULL, NULL),
(65, 'J.S.', 'R.R.', NULL, NULL, 1, NULL, NULL, NULL),
(66, 'J.J.C.N.', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(67, 'B', 'R.W.', NULL, NULL, 1, NULL, NULL, NULL),
(68, 'L.E.', 'A.O.', NULL, NULL, 1, NULL, NULL, NULL),
(80, 'rai', 'ramos', 'rrk', 23, 2, 'rrk', 71650144, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE IF NOT EXISTS `prueba` (
`id` int(15) NOT NULL,
  `nombre` char(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` int(3) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`id`, `nombre`, `edad`) VALUES
(1, 'ana', 23),
(2, 'rus', 34),
(3, 'mn', 23),
(4, 'mn', 23),
(6, 'hfg', 12),
(7, 'dfefs', 12),
(8, 'cynthia', 34),
(9, 'clau', 45),
(10, 'rai', 24),
(34, 'dsd', 12),
(73, 'cynthia', 23),
(74, 'maria', 54),
(75, 'cynthia', 54),
(76, 'clau', 24),
(77, 'PEDRO', 24),
(78, 'yem', 54),
(79, 'CARMR', 23),
(80, 'CARMR', 23),
(81, '', 88),
(82, '', 88),
(83, '', 43),
(84, '', 43),
(85, '', 43),
(86, '', 1),
(87, '', 1),
(88, '', 54),
(89, '', 85),
(90, 'CARMR', 0),
(91, 'cynthia', 0),
(92, 'alonso', 0),
(93, '', 100),
(94, '', 0),
(95, '', 0),
(96, 'fg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_infractor`
--

CREATE TABLE IF NOT EXISTS `tipo_infractor` (
  `id_tipoin` int(5) NOT NULL,
  `nombre` char(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_infractor`
--

INSERT INTO `tipo_infractor` (`id_tipoin`, `nombre`) VALUES
(1, 'Infractor'),
(2, 'Dueño vehículo'),
(3, 'Conductor vehículo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE IF NOT EXISTS `tipo_vehiculo` (
`id_tipovehiculo` int(15) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id_tipovehiculo`, `nombre`) VALUES
(1, 'Camioneta'),
(2, 'Auto'),
(3, 'Camión'),
(4, 'Ómnibus'),
(5, 'Combi'),
(6, 'Trailer'),
(7, 'Tracto'),
(8, 'Caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE IF NOT EXISTS `unidad` (
`id_unidad` int(15) NOT NULL,
  `nombre_unidad` char(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `nombre_unidad`) VALUES
(1, 'Kg'),
(2, 'cajas'),
(3, 'paquetes'),
(4, 'sacos'),
(5, 'und'),
(6, 'Soles'),
(7, 'Dolares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `cod` varchar(4) NOT NULL,
  `pass` varchar(16) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `cod`, `pass`, `nombre`) VALUES
(1, 'SJ76', '12345', 'GESTION'),
(2, 'SJ01', '123456', 'Practicante OCG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE IF NOT EXISTS `vehiculo` (
`id_vehiculo` int(15) NOT NULL,
  `tipo_vehiculo` int(15) DEFAULT NULL,
  `marca` int(15) DEFAULT NULL,
  `placa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `caracteristicas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `tipo_vehiculo`, `marca`, `placa`, `caracteristicas`) VALUES
(3, 1, NULL, NULL, NULL),
(4, 4, NULL, 'Z8C-968', NULL),
(5, 6, NULL, 'Z2Q-852', NULL),
(6, 2, NULL, 'Z1A-659', NULL),
(124, 2, 2, 'ABC123', 'NEGRO'),
(125, 1, 1, '', ''),
(126, 3, 1, '', ''),
(127, 1, 1, '', ''),
(128, 1, 1, '', '');

-- --------------------------------------------------------

--
-- Estructura para la vista `mdelito`
--
DROP TABLE IF EXISTS `mdelito`;

CREATE ALGORITHM=UNDEFINED DEFINER=`usr_gesiex`@`%` SQL SECURITY DEFINER VIEW `mdelito` AS select `delito`.`nom_delito` AS `nom_delito` from `delito`;

-- --------------------------------------------------------

--
-- Estructura para la vista `m_interventor`
--
DROP TABLE IF EXISTS `m_interventor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`usr_gesiex`@`%` SQL SECURITY DEFINER VIEW `m_interventor` AS select `interventor`.`nom_interventor` AS `nom_interventor` from `interventor`;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `delito`
--
ALTER TABLE `delito`
 ADD PRIMARY KEY (`id_delito`);

--
-- Indices de la tabla `diario`
--
ALTER TABLE `diario`
 ADD PRIMARY KEY (`id_diario`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id_empresa`), ADD KEY `nacionalidadd` (`nacionalidadd`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
 ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `fuente`
--
ALTER TABLE `fuente`
 ADD PRIMARY KEY (`id_fuente`), ADD KEY `diario` (`diario`), ADD KEY `id_intervencion` (`id_intervencion`);

--
-- Indices de la tabla `inf_empresa`
--
ALTER TABLE `inf_empresa`
 ADD PRIMARY KEY (`id_iempresa`), ADD KEY `id_empresa` (`id_empresa`), ADD KEY `id_intervencion` (`id_intervencion`);

--
-- Indices de la tabla `inf_persona`
--
ALTER TABLE `inf_persona`
 ADD PRIMARY KEY (`id_ipersona`), ADD KEY `id_persona` (`id_persona`), ADD KEY `id_intervencion` (`id_intervencion`), ADD KEY `tipo_infractor` (`tipo_infractor`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
 ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `intervencion`
--
ALTER TABLE `intervencion`
 ADD PRIMARY KEY (`id_intervencion`), ADD KEY `lugar` (`lugar`), ADD KEY `delito` (`delito`,`interventor`), ADD KEY `interventor` (`interventor`);

--
-- Indices de la tabla `interventor`
--
ALTER TABLE `interventor`
 ADD PRIMARY KEY (`id_interventor`);

--
-- Indices de la tabla `inter_delito`
--
ALTER TABLE `inter_delito`
 ADD PRIMARY KEY (`Id_inde`), ADD KEY `id_intervencion` (`id_intervencion`), ADD KEY `id_delito` (`id_delito`);

--
-- Indices de la tabla `inter_inter`
--
ALTER TABLE `inter_inter`
 ADD PRIMARY KEY (`id_int`), ADD KEY `id_intervencion` (`id_intervencion`), ADD KEY `id_interventor` (`id_interventor`);

--
-- Indices de la tabla `inter_mercancia`
--
ALTER TABLE `inter_mercancia`
 ADD PRIMARY KEY (`id_intermercancia`), ADD KEY `id_intermercancia` (`id_intermercancia`), ADD KEY `id_intervencion` (`id_intervencion`), ADD KEY `id_mercancia` (`id_mercancia`);

--
-- Indices de la tabla `inter_vehiculo`
--
ALTER TABLE `inter_vehiculo`
 ADD PRIMARY KEY (`id_intervehiculo`), ADD KEY `id_intervehiculo` (`id_intervehiculo`,`id_intervencion`,`id_vehiculo`), ADD KEY `id_intervencion` (`id_intervencion`), ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `item_mercancia`
--
ALTER TABLE `item_mercancia`
 ADD PRIMARY KEY (`id_item`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
 ADD PRIMARY KEY (`id_lugar`), ADD KEY `pais` (`pais`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
 ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `mercancia`
--
ALTER TABLE `mercancia`
 ADD PRIMARY KEY (`id_mercancia`), ADD KEY `unidad` (`unidad`), ADD KEY `unidad_2` (`unidad`), ADD KEY `item` (`item`), ADD KEY `id_moneda` (`id_moneda`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
 ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`id_persona`), ADD KEY `nacionalidad` (`nacionalidad`), ADD KEY `tipo` (`tipo_infractor`);

--
-- Indices de la tabla `prueba`
--
ALTER TABLE `prueba`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_infractor`
--
ALTER TABLE `tipo_infractor`
 ADD PRIMARY KEY (`id_tipoin`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
 ADD PRIMARY KEY (`id_tipovehiculo`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
 ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
 ADD PRIMARY KEY (`id_vehiculo`), ADD KEY `tipo_vehiculo` (`tipo_vehiculo`), ADD KEY `marca` (`marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `delito`
--
ALTER TABLE `delito`
MODIFY `id_delito` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `diario`
--
ALTER TABLE `diario`
MODIFY `id_diario` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `id_empresa` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT de la tabla `fuente`
--
ALTER TABLE `fuente`
MODIFY `id_fuente` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `inf_empresa`
--
ALTER TABLE `inf_empresa`
MODIFY `id_iempresa` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `inf_persona`
--
ALTER TABLE `inf_persona`
MODIFY `id_ipersona` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT de la tabla `intervencion`
--
ALTER TABLE `intervencion`
MODIFY `id_intervencion` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=412;
--
-- AUTO_INCREMENT de la tabla `interventor`
--
ALTER TABLE `interventor`
MODIFY `id_interventor` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `inter_delito`
--
ALTER TABLE `inter_delito`
MODIFY `Id_inde` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `inter_inter`
--
ALTER TABLE `inter_inter`
MODIFY `id_int` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `inter_mercancia`
--
ALTER TABLE `inter_mercancia`
MODIFY `id_intermercancia` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `inter_vehiculo`
--
ALTER TABLE `inter_vehiculo`
MODIFY `id_intervehiculo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `item_mercancia`
--
ALTER TABLE `item_mercancia`
MODIFY `id_item` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
MODIFY `id_lugar` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
MODIFY `id_marca` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `mercancia`
--
ALTER TABLE `mercancia`
MODIFY `id_mercancia` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
MODIFY `id_moneda` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
MODIFY `id_pais` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
MODIFY `id_persona` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT de la tabla `prueba`
--
ALTER TABLE `prueba`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
MODIFY `id_tipovehiculo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
MODIFY `id_unidad` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
MODIFY `id_vehiculo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
ADD CONSTRAINT `na_pais` FOREIGN KEY (`nacionalidadd`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `fuente`
--
ALTER TABLE `fuente`
ADD CONSTRAINT `f_diario` FOREIGN KEY (`diario`) REFERENCES `diario` (`id_diario`),
ADD CONSTRAINT `f_interventor` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`);

--
-- Filtros para la tabla `inf_empresa`
--
ALTER TABLE `inf_empresa`
ADD CONSTRAINT `inf_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`),
ADD CONSTRAINT `inf_intervencion` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`);

--
-- Filtros para la tabla `inf_persona`
--
ALTER TABLE `inf_persona`
ADD CONSTRAINT `inf_interv` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`),
ADD CONSTRAINT `inf_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
ADD CONSTRAINT `inf_tipo` FOREIGN KEY (`tipo_infractor`) REFERENCES `tipo_infractor` (`id_tipoin`);

--
-- Filtros para la tabla `intervencion`
--
ALTER TABLE `intervencion`
ADD CONSTRAINT `inter_delito` FOREIGN KEY (`delito`) REFERENCES `delito` (`id_delito`),
ADD CONSTRAINT `inter_inter` FOREIGN KEY (`interventor`) REFERENCES `interventor` (`id_interventor`),
ADD CONSTRAINT `i_lugar` FOREIGN KEY (`lugar`) REFERENCES `lugar` (`id_lugar`);

--
-- Filtros para la tabla `inter_delito`
--
ALTER TABLE `inter_delito`
ADD CONSTRAINT `inde_delito` FOREIGN KEY (`id_delito`) REFERENCES `delito` (`id_delito`),
ADD CONSTRAINT `inde_intervencion` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`);

--
-- Filtros para la tabla `inter_inter`
--
ALTER TABLE `inter_inter`
ADD CONSTRAINT `i_intervencion` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`),
ADD CONSTRAINT `i_interventor` FOREIGN KEY (`id_interventor`) REFERENCES `interventor` (`id_interventor`);

--
-- Filtros para la tabla `inter_mercancia`
--
ALTER TABLE `inter_mercancia`
ADD CONSTRAINT `inter_mercancia` FOREIGN KEY (`id_mercancia`) REFERENCES `mercancia` (`id_mercancia`),
ADD CONSTRAINT `merca_intervencion` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`);

--
-- Filtros para la tabla `inter_vehiculo`
--
ALTER TABLE `inter_vehiculo`
ADD CONSTRAINT `inter_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
ADD CONSTRAINT `vehi_intervencion` FOREIGN KEY (`id_intervencion`) REFERENCES `intervencion` (`id_intervencion`);

--
-- Filtros para la tabla `lugar`
--
ALTER TABLE `lugar`
ADD CONSTRAINT `l_pais` FOREIGN KEY (`pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `mercancia`
--
ALTER TABLE `mercancia`
ADD CONSTRAINT `m_item` FOREIGN KEY (`item`) REFERENCES `item_mercancia` (`id_item`),
ADD CONSTRAINT `m_moneda` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`),
ADD CONSTRAINT `m_unidad` FOREIGN KEY (`unidad`) REFERENCES `unidad` (`id_unidad`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
ADD CONSTRAINT `n_pais` FOREIGN KEY (`nacionalidad`) REFERENCES `pais` (`id_pais`),
ADD CONSTRAINT `per_tipoin` FOREIGN KEY (`tipo_infractor`) REFERENCES `tipo_infractor` (`id_tipoin`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
ADD CONSTRAINT `v_marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`id_marca`),
ADD CONSTRAINT `v_tipo` FOREIGN KEY (`tipo_vehiculo`) REFERENCES `tipo_vehiculo` (`id_tipovehiculo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
