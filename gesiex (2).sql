-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-08-2018 a las 14:03:01
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

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
(88, '9748', 'SI', 'SI', 'Opt2');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `interventor` int(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `intervencion`
--

INSERT INTO `intervencion` (`id_intervencion`, `fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`) VALUES
(2, '2018-01-01', 1, 'Abandonan prendas de contrabando en chacras', 'Prendas de vestir importadas y nuevas por un valor de 7,680 dolares, halló la Policía de Carreteras, en chacras ubicadas cerca de la carretera de la Panamericana Sur. Todo lo incautado fue internado en el almacén aduanero de Tomasiri. ', 1, 7),
(3, '2018-02-04', 3, 'Minero chileno con 41kg de droga escondida en vehículo', 'Aduaneros chilenos intervinieron una camioneta que se dirigía de Tacna a Arica transportando 47 paquetes con  41.180 kg de marihuana Cripy. El vehículo pertenece a un minero de Antofagasta, quien había viajado a Tacna, donde habría modificado su unidad con compartimentos tipo "caleta". ', 2, 2),
(4, '2018-01-05', 12, 'Incautan ropa de contrabando ', 'La Policía de Carreteras y personal de SUNAT-ADUANAS Ilo llevaron a cabo el operativo Contrabando 2018.  Ante posible delito de contrabando, se procedió a la incautación de la mercadería en abandono, encontrada en el interior de un ómnibus, consistente en chompas y chalecos sintéticos y ropa de segundo uso valorizada en 6.220 soles', 1, 7),
(5, '2018-01-05', 1, 'Incautan auto partes por  700 mil', 'Un cargamento consistente en auto partes usados e importados de Asia, fue intervenido por personal de Deprove y luego internado en el almacén de la Intendencia de Aduana de Tacna, al detectarse irregularidades en los documentos que tenía el presunto dueño. Ruben Sosa Jichuña dijo ser propietario de la mercancía pero la DUA estaba a nombre de Alfredo Caso Fierro y la guía de remisión indicaba que la mercadería debía ser movilizada de Ilo a Lima.', 1, 1),
(6, '2018-01-08', 2, 'Intervienen a varón por intentar ingresar al país 25 mil dolares', 'Por el delito de lavado de activos es investigado Richard Willians Michel Cutipa por intentar  ingresar al país 25 mil 550 dólares sin declarar y adheridos al cuerpo. El detenido provenía de Santiago de Chile. Se determinó que los billetes incautados tenías adherencia de cocaína y por ende se tendrá que determinar si el dinero proviene del tráfico ilícito de drogas.', 4, 1);

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
MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT de la tabla `fuente`
--
ALTER TABLE `fuente`
MODIFY `id_fuente` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
MODIFY `id_intervencion` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
