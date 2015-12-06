-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-11-2015 a las 13:13:22
-- Versión del servidor: 5.6.27
-- Versión de PHP: 5.6.14-0+deb8u1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tutoria`
--
CREATE DATABASE IF NOT EXISTS `tutoria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tutoria`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `actualizar_respuesta`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `actualizar_respuesta`(IN `v_id_cons` INT, IN `v_id_item` INT, IN `v_nombre_resp` VARCHAR(255))
    NO SQL
INSERT INTO respuesta (id_cons,id_item,nombre_resp) VALUES (v_id_cons,v_id_item,v_nombre_resp)
ON DUPLICATE KEY UPDATE nombre_resp=VALUES(nombre_resp)$$

DROP PROCEDURE IF EXISTS `crear_meta`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `crear_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` VARCHAR(1), IN `v_hice_meta` VARCHAR(100), IN `v_nodebohacer_meta` VARCHAR(100), IN `v_debohacer_meta` VARCHAR(100), IN `v_id_matr` INT, IN `v_fecha_meta` DATE)
    NO SQL
INSERT INTO `meta`(`metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `id_matr`,`fecha_meta`) VALUES (v_metapromedio_meta,v_promediomomento_meta,v_riesgo_meta,v_hice_meta,v_nodebohacer_meta,v_debohacer_meta,v_id_matr,v_fecha_meta)$$

DROP PROCEDURE IF EXISTS `editar_meta`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `editar_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` CHAR(1), IN `v_hice_meta` CHAR(100), IN `v_nodebohacer_meta` CHAR(100), IN `v_debohacer_meta` CHAR(100), IN `v_id_meta` INT)
    NO SQL
UPDATE `meta` SET `metapromedio_meta`=v_metapromedio_meta,`promediomomento_meta`=v_promediomomento_meta,`riesgo_meta`=v_riesgo_meta,`hice_meta`=v_hice_meta,`nodebohacer_meta`=v_nodebohacer_meta,`debohacer_meta`=v_debohacer_meta WHERE `id_meta`=v_id_meta$$

DROP PROCEDURE IF EXISTS `listar_cuestionarios`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `listar_cuestionarios`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_cues` as cues,`nombre_cues`,`id_tusu`,(select count(*) from `respuesta` inner join `item` on `respuesta`.`id_item`=`item`.`id_item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `id_cons`=v_id_cons and `cuestionario`.`id_cues`=cues) as `Items Respondidos`,(select count(*) from `respuesta` inner join `item` on `respuesta`.`id_item`=`item`.`id_item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `cuestionario`.`id_cues`=cues) as `Total de Items` FROM `cuestionario`$$

DROP PROCEDURE IF EXISTS `nombre_curso`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_curso`(IN `v_id_matr` INT)
    NO SQL
select `nombre_curs` from `curso`
inner join `matricula` on `matricula`.`id_matr`=v_id_matr and `matricula`.`id_curs`=`curso`.`id_curs`$$

DROP PROCEDURE IF EXISTS `nombre_estudiante`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_estudiante`(IN `v_id_estu` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
inner join `estudiante`
on `estudiante`.`id_estu`=v_id_estu and `estudiante`.`id_usua`=`usuario`.`id_usua`$$

DROP PROCEDURE IF EXISTS `nombre_tutor`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_tutor`(IN `v_id_tuto` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
inner join `tutor`
on `tutor`.`id_tuto`=v_id_tuto and `tutor`.`id_usua`=`usuario`.`id_usua`$$

DROP PROCEDURE IF EXISTS `nombre_usuario`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_usuario`(IN `v_id_usua` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
where `id_usua`=v_id_usua$$

DROP PROCEDURE IF EXISTS `ver_consejeria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_consejeria`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_tutor`, `id_estu` FROM `consejeria` WHERE `id_cons`=v_id_cons$$

DROP PROCEDURE IF EXISTS `ver_cuestionario`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_cuestionario`(IN `v_id_cues` INT)
    NO SQL
select `nombre_cues`,`inicio_cues`,`final_cues`,`nombre_tusu`
from `cuestionario`
inner join `tipo_usuario`
on `cuestionario`.`id_tusu`=`tipo_usuario`.`id_tusu`
where `id_cues`=v_id_cues$$

DROP PROCEDURE IF EXISTS `ver_items`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_items`(IN `v_id_cons` INT, IN `v_id_secc` INT)
    NO SQL
select `item`.`id_item`,`nombre_item`,`tipo_item`,`nombre_resp`,`id_cons` from `item`
left join `respuesta`
on `respuesta`.`id_item`=`item`.`id_item` and `id_cons`=v_id_cons
where `id_secc`=v_id_secc$$

DROP PROCEDURE IF EXISTS `ver_meta`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_meta`(IN `v_id_meta` INT)
    NO SQL
SELECT `nombre_curs`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`
FROM `meta`
inner join `matricula`
on `meta`.`id_meta`=v_id_meta and `meta`.`id_matr`=`matricula`.`id_matr`
inner join `curso`
on `matricula`.`id_curs`=`curso`.`id_curs`$$

DROP PROCEDURE IF EXISTS `ver_secciones`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_secciones`(IN `v_id_cues` INT)
    NO SQL
select `id_secc`,`nombre_secc` from `seccion` where `id_cues`=v_id_cues$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejeria`
--

DROP TABLE IF EXISTS `consejeria`;
CREATE TABLE IF NOT EXISTS `consejeria` (
`id_cons` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `id_estu` int(11) NOT NULL,
  `tema_cons` varchar(100) NOT NULL,
  `situacion_cons` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consejeria`
--

INSERT INTO `consejeria` (`id_cons`, `id_tutor`, `id_estu`, `tema_cons`, `situacion_cons`) VALUES
(1, 1, 11, '', ''),
(2, 2, 12, '', ''),
(3, 1, 13, '', ''),
(4, 2, 14, '', ''),
(5, 1, 15, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
CREATE TABLE IF NOT EXISTS `cuestionario` (
`id_cues` int(11) NOT NULL,
  `nombre_cues` varchar(100) DEFAULT NULL,
  `inicio_cues` text,
  `final_cues` text,
  `id_tusu` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuestionario`
--

INSERT INTO `cuestionario` (`id_cues`, `nombre_cues`, `inicio_cues`, `final_cues`, `id_tusu`) VALUES
(1, 'Información General', NULL, NULL, 1),
(2, 'Diagnóstico de Hábitos', NULL, NULL, 1),
(3, 'Recomendaciones del Docente-Tutor', NULL, NULL, 2),
(4, 'Evaluación Psicopedagogica', NULL, NULL, 2),
(7, 'Cuestionario de Evaluación de Desempeño del Estudiante', NULL, NULL, 2),
(8, 'Cuestionario de Evaluación del Desempeño del Docente Consejero-Tutor', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
`id_curs` int(11) NOT NULL,
  `nombre_curs` char(50) DEFAULT NULL,
  `semestre_curs` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curs`, `nombre_curs`, `semestre_curs`) VALUES
(1, 'INGENIERIA WEB', 0),
(2, 'TALLER DE SISTEMAS DE INFORMACION I', 0),
(3, 'DISEÑO ASISTIDO POR COMPUTADORA', 0),
(4, 'TALLER DE GESTION EMPRESARIAL', 0),
(5, 'SIMULACION DE SISTEMAS', 0),
(6, 'SEGURIDAD INFORMATICA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_reunion`
--

DROP TABLE IF EXISTS `estado_reunion`;
CREATE TABLE IF NOT EXISTS `estado_reunion` (
`id_ereu` int(11) NOT NULL,
  `nombre_ereu` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_reunion`
--

INSERT INTO `estado_reunion` (`id_ereu`, `nombre_ereu`) VALUES
(1, 'Libre'),
(2, 'Reservada'),
(3, 'Realizada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
`id_estu` int(11) NOT NULL,
  `id_peri` int(11) NOT NULL,
  `id_usua` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estu`, `id_peri`, `id_usua`) VALUES
(11, 1, 10),
(12, 1, 18),
(13, 1, 20),
(14, 1, 33),
(15, 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
`id_item` int(11) NOT NULL,
  `nombre_item` varchar(255) DEFAULT NULL,
  `tipo_item` char(1) DEFAULT NULL,
  `id_secc` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`id_item`, `nombre_item`, `tipo_item`, `id_secc`) VALUES
(16, 'Sexo', 'X', 1),
(17, 'Edad', 'N', 1),
(18, 'Ingresos Familiares', 'N', 1),
(19, 'Estado Civil', 'C', 1),
(20, 'Ocupación', 'S', 1),
(21, 'N° de teléfono de casa', 'S', 1),
(22, 'N° de celular', 'S', 1),
(23, 'N° de teléfono de los padres o apoderados, en caso de emergencia', 'S', 1),
(24, 'Correo electrónico', 'S', 1),
(25, 'Dirección domiciliaria', 'S', 1),
(26, 'N° de personas con las que vive', 'N', 1),
(27, 'Expresar brevemente lo que espera de la Consejería - Tutoría Académica', 'T', 2),
(28, 'Plan de vida y carrera', 'T', 3),
(29, 'Planes inmediatos', 'T', 3),
(30, 'Metas de vida', 'T', 3),
(31, 'Organiza sus actividades de estudio. ', 'M', 11),
(32, 'Le es fácil estudiar de manera independiente. ', 'M', 11),
(33, 'Relaciona fácilmente el contenido de las asignaturas. ', 'M', 11),
(34, 'Sabe lo que debe estudiar en cada asignatura. ', 'M', 11),
(35, 'Cuenta con los materiales necesarios de estudio.', 'M', 11),
(36, 'Es ordenado en sus espacios y materiales de estudio.', 'M', 11),
(37, 'Presenta a tiempo las tareas.', 'M', 11),
(38, 'Se concentra sin dificultad al estudiar.', 'M', 11),
(39, 'Realiza una autoevaluación para saber lo que aprendió.', 'M', 11),
(40, 'Resuelve sus dudas realizando preguntas a las personas indicadas.', 'M', 11),
(41, 'Programa su tiempo para la realización de sus actividades.', 'M', 11),
(42, 'Realiza sus actividades en el tiempo previsto.', 'M', 11),
(43, 'Anticipa los materiales que necesitará.', 'M', 11),
(44, 'El tiempo le alcanza para realizar sus actividades.', 'M', 11),
(45, 'Organiza sus tareas por grado de complejidad.', 'M', 11),
(46, 'Entrega puntualmente sus tareas.', 'M', 11),
(47, 'Establece metas realistas y las cumple.', 'M', 11),
(48, 'Conoce sus habilidades intelectuales.', 'M', 11),
(49, 'Identifica claramente los objetivos de la lectura', 'M', 12),
(50, 'Trata de entender el contenido de la lectura', 'M', 12),
(51, 'Recuerda bien lo que lee', 'M', 12),
(52, 'Realiza anotaciones de las lecturas que realizó', 'M', 12),
(53, 'Toma notas y realiza mapas mentales', 'M', 12),
(54, 'Investiga las palabras que desconoce', 'M', 12),
(55, 'Relaciona las ideas que lee con las que ya conoce', 'M', 12),
(56, 'Se formula preguntas para organizar la lectura', 'M', 12),
(57, 'Cuando no entiende un texto, lo lee varias veces', 'M', 12),
(58, 'Tiene buen método de lectura', 'M', 12),
(59, 'Recuerda sin problema lo que estudia', 'M', 13),
(60, 'Puede centrar su atención en las lecturas', 'M', 13),
(61, 'Logra concentrarse a pesar de los ruidos externos', 'M', 13),
(62, 'Puede concentrarse en el estudio a pesar de que tenga problemas o preocupaciones', 'M', 13),
(63, 'Puede concentrarse a pesar de que le estén distrayendo', 'M', 13),
(64, 'Busca asegurarse entender lo solicitado por sus docentes en las tareas', 'M', 13),
(65, 'Considera que aprende en forma efectiva', 'M', 13),
(66, 'Considera que su estado físico, mental y nutricional son buenos para el estudio', 'M', 13),
(67, 'Cuando tiene demasiado trabajo toma pequeños descansos', 'M', 13),
(68, 'Toma atención a la mayoría de las clases', 'M', 13),
(69, 'El lugar donde estudia es tranquilo', 'M', 14),
(70, 'El lugar donde estudia es ventilado', 'M', 14),
(71, 'El lugar donde estudia está iluminado', 'M', 14),
(72, 'El lugar donde estudia tiene distracciones', 'M', 14),
(73, 'Cuenta con el apoyo de la familia para mantener un ambiente tranquilo', 'M', 14),
(74, 'Evita distractores como televisión, radio, internet, etc. mientras estudia', 'M', 14),
(75, 'El lugar de estudio cuenta con agua, frutas, etc.', 'M', 14),
(76, 'Alterna los materiales de estudio de los cursos que lleva', 'M', 14),
(77, 'Su espacio de estudio es amplio', 'M', 14),
(78, 'El lugar de estudio cuenta con plantas', 'M', 14),
(79, 'Realiza cuadros sinópticos tratando de ordenar la información que estudia', 'M', 15),
(80, 'Señala las ideas que no entiende o comprende', 'M', 15),
(81, 'Realiza resúmenes de los temas estudiados', 'M', 15),
(82, 'Expone sus dudas ante él o los docentes de la asignatura', 'M', 15),
(83, 'En caso de necesitar ayuda, solicita asesoría', 'M', 15),
(84, 'Explica lo que lee en forma verbal y/o por escrito', 'M', 15),
(85, 'Busca mantener un orden en sus anotaciones', 'M', 15),
(86, 'Realiza ejercicios hasta comprender el procedimiento de estudio', 'M', 15),
(87, 'Organiza lo estudiado en mapas mentales', 'M', 15),
(88, 'Busca mejorar sus técnicas y métodos de estudio', 'M', 15),
(89, 'Cuando estudia normalmente está alegre y de buen humor', 'M', 16),
(90, 'Se siente tranquilo aunque no comprenda bien los temas de clase', 'M', 16),
(91, 'El sistema digestivo le funciona bien, aún en situaciones de estrés', 'M', 16),
(92, 'Mantiene la calma ante las dificultades', 'M', 16),
(93, 'Generalmente tiene pensamientos positivos', 'M', 16),
(94, 'Ha notado que aumenta su atención, concentración y memoria', 'M', 16),
(95, 'Controla perfectamente sus métodos de estudio', 'M', 16),
(96, 'Se siente tranquilo aunque se le dificulte comprender lo que estudió', 'M', 16),
(97, 'Puede controlar sus nervios cuando expone frente al grupo de estudiantes', 'M', 16),
(98, 'Puede desarrollar su examen sin ningún problema', 'M', 16),
(99, 'Realizar ejercicios para desarrollar métodos de estudio y aprendizaje', 'B', 17),
(100, 'Realizar repasos y hacer que el estudiante participe en los cursos para evitar la reprobación', 'B', 17),
(101, 'Orientación en la búsqueda de información bibliográfica', 'B', 17),
(102, 'Orientación en los cursos de la carrera', 'B', 17),
(103, 'Otros', 'B', 17),
(104, 'Actividades Deportivas', 'B', 18),
(105, 'Actividades Culturales', 'B', 18),
(106, 'Atención Médica', 'B', 18),
(107, 'Becas', 'B', 18),
(108, 'Bolsa de Trabajo', 'B', 18),
(109, 'Orientación Nutricional', 'B', 18),
(110, 'Orientación Psicológica', 'B', 18),
(111, 'Otros', 'B', 18),
(112, 'Comprensión de las clases', 'T', 20),
(113, 'Retención de los conocimientos adquiridos de las clases', 'T', 20),
(114, 'Lugar y condiciones ambientales durante el estudio', 'T', 20),
(115, 'Preparación para los exámenes', 'T', 20),
(116, 'Aplicación de estrategias de aprendizaje', 'T', 20),
(117, 'Organización de las actividades de estudio', 'T', 20),
(118, 'Asignaturas donde existen deficiencias', 'T', 20),
(119, 'Facilidad en la búsqueda de bibliografías', 'T', 20),
(120, 'Motivación hacia el estudio', 'T', 20),
(121, 'Problemas personales que interfieren con el estudio', 'T', 20),
(122, 'Asistió con puntualidad a las sesiones individuales', 'F', 21),
(123, 'Es una persona que solicita tener comunicación con usted', 'F', 21),
(124, 'Demostró interés por las actividades programadas', 'F', 21),
(125, 'Muestra respeto hacia usted y demás compañeros de aula', 'F', 21),
(126, 'Brindó apoyo para identificar sus dificultades académicas, personal, vocacional , etc.', 'F', 21),
(127, 'Colaboró en la búsqueda de soluciones para superar las deficiencias', 'F', 21),
(128, 'Le proporcionó la información necesaria para derivarlo a las diferentes dependencias de servicio de la UNJBG', 'F', 21),
(129, 'Mantuvo un seguimiento sistemático de las actividades programadas', 'F', 21),
(130, 'Asistió puntualmente a las sesiones grupales', 'F', 21),
(131, 'Demostró interés por las actividades relacionadas a investigación, cur¬sos de especialidad', 'F', 21),
(132, NULL, 'T', 22),
(133, 'El profesor consejero-tutor asistió a las sesiones programadas en su horario de consejería y tutoría académica', 'F', 23),
(134, 'El profesor consejero-tutor lo orientó e incentivó a mejorar y desarro¬llarse como persona', 'F', 23),
(135, 'El profesor consejero-tutor le brindó la confianza como para poder ex¬presar sus problemas, deficiencias, virtudes, entre otros', 'F', 23),
(136, 'El profesor consejero-tutor le informó y orientó acerca de técnicas para mejorar su aprendizaje', 'F', 23),
(137, 'El profesor consejero-tutor lo derivó a las diferentes dependencias de la UNJBG para solucionar sus problemas', 'F', 23),
(138, 'El profesor consejero-tutor estuvo dispuesto a atenderlo cada vez que usted lo solicitó', 'F', 23),
(139, 'El profesor consejero-tutor planificó las actividades a realizar', 'F', 23),
(140, 'El profesor consejero-tutor cumplió con las horas programadas de con¬sejería y tutoría académica', 'F', 23),
(141, 'Está conforme con la consejería y tutoría académica brindada por su profesor consejero-tutor', 'F', 23),
(142, NULL, 'T', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
`id_matr` int(11) NOT NULL,
  `num_matr` int(11) DEFAULT NULL,
  `id_curs` int(11) NOT NULL,
  `id_estu` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id_matr`, `num_matr`, `id_curs`, `id_estu`) VALUES
(31, 1, 1, 11),
(32, 1, 1, 12),
(33, 1, 1, 13),
(34, 1, 1, 14),
(35, 1, 1, 15),
(36, 1, 2, 11),
(37, 1, 2, 12),
(38, 1, 2, 13),
(39, 1, 2, 14),
(40, 1, 2, 15),
(41, 1, 3, 11),
(42, 1, 3, 12),
(43, 1, 3, 13),
(44, 1, 3, 14),
(45, 1, 3, 15),
(46, 1, 4, 11),
(47, 1, 4, 12),
(48, 1, 4, 13),
(49, 1, 4, 14),
(50, 1, 5, 14),
(51, 1, 5, 11),
(52, 1, 5, 12),
(53, 1, 5, 13),
(54, 1, 5, 14),
(55, 1, 5, 15),
(56, 1, 6, 11),
(57, 1, 6, 12),
(58, 1, 6, 13),
(59, 1, 6, 14),
(60, 1, 6, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta`
--

DROP TABLE IF EXISTS `meta`;
CREATE TABLE IF NOT EXISTS `meta` (
`id_meta` int(11) NOT NULL,
  `metapromedio_meta` int(11) NOT NULL,
  `promediomomento_meta` int(11) NOT NULL,
  `riesgo_meta` char(1) NOT NULL,
  `hice_meta` varchar(100) NOT NULL,
  `nodebohacer_meta` varchar(100) NOT NULL,
  `debohacer_meta` varchar(100) NOT NULL,
  `fecha_meta` date NOT NULL,
  `id_matr` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `meta`
--

INSERT INTO `meta` (`id_meta`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `fecha_meta`, `id_matr`) VALUES
(1, 18, 19, 'S', 'hice', 'nodebo', 'debo', '2015-11-18', 31),
(2, 20, 21, 'S', 'hicemeta', 'NODEBOHACER', 'debohacer', '2010-11-12', 31),
(3, 1, 2, 's', 'das', 'dsa', 'as', '2010-10-10', 31),
(4, 3213, 6543, 'S', 'dd', 'cc', 'bb', '2015-11-23', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad_reunion`
--

DROP TABLE IF EXISTS `modalidad_reunion`;
CREATE TABLE IF NOT EXISTS `modalidad_reunion` (
`id_mreu` int(11) NOT NULL,
  `nombre_mreu` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modalidad_reunion`
--

INSERT INTO `modalidad_reunion` (`id_mreu`, `nombre_mreu`) VALUES
(1, 'Individual'),
(2, 'Grupal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

DROP TABLE IF EXISTS `periodo`;
CREATE TABLE IF NOT EXISTS `periodo` (
`id_peri` int(11) NOT NULL,
  `nombre_peri` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_peri`, `nombre_peri`) VALUES
(1, '2015-II');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE IF NOT EXISTS `respuesta` (
  `id_item` int(11) NOT NULL,
  `id_cons` int(11) NOT NULL,
  `nombre_resp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_item`, `id_cons`, `nombre_resp`) VALUES
(16, 1, 'Masculino'),
(17, 1, '11212'),
(18, 1, '3'),
(19, 1, 'Soltero'),
(20, 1, '2'),
(21, 1, '23'),
(22, 1, '4'),
(23, 1, '312'),
(24, 1, 'dsa'),
(25, 1, 'asd'),
(27, 1, 'XXX'),
(28, 1, 'XXX'),
(29, 1, 'XXX'),
(31, 1, 'Nunca'),
(31, 2, 'Siempre'),
(33, 1, 'Nunca'),
(34, 1, 'Siempre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion`
--

DROP TABLE IF EXISTS `reunion`;
CREATE TABLE IF NOT EXISTS `reunion` (
`id_reun` int(11) NOT NULL,
  `fecha_reun` date DEFAULT NULL,
  `horainicio_reun` varchar(20) DEFAULT NULL,
  `horafin_reun` varchar(5) DEFAULT NULL,
  `motivo_reun` varchar(100) NOT NULL,
  `asunto_reun` varchar(255) NOT NULL,
  `id_ereu` int(11) NOT NULL,
  `id_mreu` int(11) DEFAULT NULL,
  `id_estu` int(11) DEFAULT NULL,
  `id_tutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
`id_secc` int(11) NOT NULL,
  `nombre_secc` varchar(45) DEFAULT NULL,
  `id_cues` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_secc`, `nombre_secc`, `id_cues`) VALUES
(1, 'Datos Generales', 1),
(2, 'Espectativas Iniciales', 1),
(3, 'Algunos indicadores para manejar la entrevist', 1),
(11, 'Estudio Independiente', 2),
(12, 'Comprensión de Lectura', 2),
(13, 'Concentración', 2),
(14, 'Lugar de Estudio', 2),
(15, 'Habilidades para Procesar Información', 2),
(16, 'Control de Ansiedad', 2),
(17, 'Desarrollo Académico', 3),
(18, 'Desarrollo Psicosocial', 3),
(20, 'Diagnóstico', 4),
(21, 'Preguntas', 7),
(22, 'Observaciones o Sugerencias', 7),
(23, 'Preguntas', 8),
(24, 'Observaciones o Sugerencias', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
`id_tusu` int(11) NOT NULL,
  `nombre_tusu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tusu`, `nombre_tusu`) VALUES
(1, 'Docente'),
(2, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

DROP TABLE IF EXISTS `tutor`;
CREATE TABLE IF NOT EXISTS `tutor` (
`id_tuto` int(11) NOT NULL,
  `id_usua` int(11) NOT NULL,
  `id_peri` int(11) NOT NULL,
  `motivos_tuto` varchar(100) DEFAULT NULL,
  `derivados_tuto` varchar(100) DEFAULT NULL,
  `obstaculos_tuto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id_tuto`, `id_usua`, `id_peri`, `motivos_tuto`, `derivados_tuto`, `obstaculos_tuto`) VALUES
(1, 42, 1, NULL, NULL, NULL),
(2, 43, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
`id_usua` int(11) NOT NULL,
  `codigo_usua` varchar(100) DEFAULT NULL,
  `clave_usua` varchar(255) DEFAULT NULL,
  `nombres_usua` varchar(50) DEFAULT NULL,
  `apellidos_usua` varchar(50) DEFAULT NULL,
  `email_usua` varchar(50) DEFAULT NULL,
  `telefono_usua` varchar(20) DEFAULT NULL,
  `direccion_usua` varchar(255) DEFAULT NULL,
  `nacimiento_usua` date DEFAULT NULL,
  `id_tusu` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usua`, `codigo_usua`, `clave_usua`, `nombres_usua`, `apellidos_usua`, `email_usua`, `telefono_usua`, `direccion_usua`, `nacimiento_usua`, `id_tusu`) VALUES
(10, '2010-35550\r\n', 'tutoriaplus', 'Israel Nazareth', 'Chaparro Cruz', NULL, NULL, NULL, NULL, NULL),
(18, '2011119030\r\n', 'tutoriaplus', 'Flores Pari', 'Javier', NULL, NULL, NULL, NULL, NULL),
(20, '2011119035\r\n', 'tutoriaplus', 'Silvana Cabana', 'Cabana Yupanqui', NULL, NULL, NULL, NULL, NULL),
(33, '2012-36157\r\n', 'tutoriaplus', 'Gladys Fiorella', 'Huanacune Chambilla', NULL, NULL, NULL, NULL, NULL),
(36, '2012-36167\r\n', 'tutoriaplus', 'Cynthia Tatiana', 'Valeriano Argandoña', NULL, NULL, NULL, NULL, NULL),
(42, 'CM-1234', 'tutoriaplus', 'Ana Silvia', 'Cori Morón', NULL, NULL, NULL, NULL, NULL),
(43, 'CR-1234', 'tutoriaplus', 'Porfirio', 'Chata Ramírez', NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consejeria`
--
ALTER TABLE `consejeria`
 ADD PRIMARY KEY (`id_cons`), ADD KEY `R_9` (`id_estu`), ADD KEY `R_10` (`id_tutor`);

--
-- Indices de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
 ADD PRIMARY KEY (`id_cues`), ADD KEY `fk_cuestionario_tipo_usuario1_idx` (`id_tusu`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`id_curs`);

--
-- Indices de la tabla `estado_reunion`
--
ALTER TABLE `estado_reunion`
 ADD PRIMARY KEY (`id_ereu`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
 ADD PRIMARY KEY (`id_estu`), ADD KEY `R_3` (`id_peri`), ADD KEY `R_98` (`id_usua`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
 ADD PRIMARY KEY (`id_item`), ADD KEY `R_99` (`tipo_item`), ADD KEY `fk_item_seccion1_idx` (`id_secc`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
 ADD PRIMARY KEY (`id_matr`), ADD KEY `R_23` (`id_curs`), ADD KEY `R_24` (`id_estu`);

--
-- Indices de la tabla `meta`
--
ALTER TABLE `meta`
 ADD PRIMARY KEY (`id_meta`), ADD KEY `R_97` (`id_matr`);

--
-- Indices de la tabla `modalidad_reunion`
--
ALTER TABLE `modalidad_reunion`
 ADD PRIMARY KEY (`id_mreu`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
 ADD PRIMARY KEY (`id_peri`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
 ADD PRIMARY KEY (`id_item`,`id_cons`), ADD KEY `R_16` (`id_item`), ADD KEY `R_22` (`id_cons`);

--
-- Indices de la tabla `reunion`
--
ALTER TABLE `reunion`
 ADD PRIMARY KEY (`id_reun`), ADD KEY `R_25` (`id_estu`), ADD KEY `R_26` (`id_tutor`), ADD KEY `R_89` (`id_ereu`), ADD KEY `R_88` (`id_mreu`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
 ADD PRIMARY KEY (`id_secc`), ADD KEY `fk_seccion_cuestionario1_idx` (`id_cues`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
 ADD PRIMARY KEY (`id_tusu`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
 ADD PRIMARY KEY (`id_tuto`), ADD KEY `R_6` (`id_usua`), ADD KEY `R_7` (`id_peri`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id_usua`), ADD KEY `usuario_ibfk_2` (`id_tusu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consejeria`
--
ALTER TABLE `consejeria`
MODIFY `id_cons` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
MODIFY `id_cues` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
MODIFY `id_curs` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `estado_reunion`
--
ALTER TABLE `estado_reunion`
MODIFY `id_ereu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
MODIFY `id_estu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
MODIFY `id_matr` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `meta`
--
ALTER TABLE `meta`
MODIFY `id_meta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `modalidad_reunion`
--
ALTER TABLE `modalidad_reunion`
MODIFY `id_mreu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
MODIFY `id_peri` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reunion`
--
ALTER TABLE `reunion`
MODIFY `id_reun` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
MODIFY `id_secc` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
MODIFY `id_tusu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
MODIFY `id_tuto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `id_usua` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consejeria`
--
ALTER TABLE `consejeria`
ADD CONSTRAINT `consejeria_ibfk_1` FOREIGN KEY (`id_estu`) REFERENCES `estudiante` (`id_estu`),
ADD CONSTRAINT `consejeria_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tuto`);

--
-- Filtros para la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
ADD CONSTRAINT `fk_cuestionario_tipo_usuario1` FOREIGN KEY (`id_tusu`) REFERENCES `tipo_usuario` (`id_tusu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_peri`) REFERENCES `periodo` (`id_peri`),
ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id_usua`) REFERENCES `usuario` (`id_usua`);

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
ADD CONSTRAINT `fk_item_seccion1` FOREIGN KEY (`id_secc`) REFERENCES `seccion` (`id_secc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_curs`) REFERENCES `curso` (`id_curs`),
ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_estu`) REFERENCES `estudiante` (`id_estu`);

--
-- Filtros para la tabla `meta`
--
ALTER TABLE `meta`
ADD CONSTRAINT `fk_meta_1` FOREIGN KEY (`id_matr`) REFERENCES `matricula` (`id_matr`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`id_cons`) REFERENCES `consejeria` (`id_cons`);

--
-- Filtros para la tabla `reunion`
--
ALTER TABLE `reunion`
ADD CONSTRAINT `reunion_ibfk_1` FOREIGN KEY (`id_estu`) REFERENCES `estudiante` (`id_estu`),
ADD CONSTRAINT `reunion_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tuto`),
ADD CONSTRAINT `reunion_ibfk_3` FOREIGN KEY (`id_ereu`) REFERENCES `estado_reunion` (`id_ereu`),
ADD CONSTRAINT `reunion_ibfk_4` FOREIGN KEY (`id_mreu`) REFERENCES `modalidad_reunion` (`id_mreu`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
ADD CONSTRAINT `fk_seccion_cuestionario1` FOREIGN KEY (`id_cues`) REFERENCES `cuestionario` (`id_cues`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`id_usua`) REFERENCES `usuario` (`id_usua`),
ADD CONSTRAINT `tutor_ibfk_2` FOREIGN KEY (`id_peri`) REFERENCES `periodo` (`id_peri`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tusu`) REFERENCES `tipo_usuario` (`id_tusu`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
