-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2015 a las 16:37:43
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tutoria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejeria`
--

CREATE TABLE IF NOT EXISTS `consejeria` (
  `id_cons` int(11) NOT NULL AUTO_INCREMENT,
  `id_tutor` int(11) NOT NULL,
  `id_estu` int(11) NOT NULL,
  `tema_cons` varchar(100) NOT NULL,
  `situacion_cons` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cons`),
  KEY `R_9` (`id_estu`),
  KEY `R_10` (`id_tutor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `consejeria`
--

INSERT INTO `consejeria` (`id_cons`, `id_tutor`, `id_estu`, `tema_cons`, `situacion_cons`) VALUES
(1, 1, 11, '1', '2'),
(2, 2, 12, '', ''),
(3, 1, 13, '3', '4'),
(4, 2, 14, '', ''),
(5, 1, 15, '5', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

CREATE TABLE IF NOT EXISTS `cuestionario` (
  `id_cues` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cues` varchar(100) DEFAULT NULL,
  `inicio_cues` text,
  `final_cues` text,
  `id_tusu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cues`),
  KEY `fk_cuestionario_tipo_usuario1_idx` (`id_tusu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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

CREATE TABLE IF NOT EXISTS `curso` (
  `id_curs` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curs` char(50) DEFAULT NULL,
  `semestre_curs` int(11) NOT NULL,
  PRIMARY KEY (`id_curs`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curs`, `nombre_curs`, `semestre_curs`) VALUES
(1, 'INGENIERIA WEB', 8),
(2, 'TALLER DE SISTEMAS DE INFORMACION I', 8),
(3, 'DISEÑO ASISTIDO POR COMPUTADORA', 8),
(4, 'TALLER DE GESTION EMPRESARIAL', 8),
(5, 'SIMULACION DE SISTEMAS', 8),
(6, 'SEGURIDAD INFORMATICA', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `id_estu` int(11) NOT NULL AUTO_INCREMENT,
  `id_peri` int(11) NOT NULL,
  `id_usua` int(11) NOT NULL,
  PRIMARY KEY (`id_estu`),
  KEY `R_3` (`id_peri`),
  KEY `R_98` (`id_usua`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

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

CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_item` varchar(255) DEFAULT NULL,
  `tipo_item` char(1) DEFAULT NULL,
  `id_secc` int(11) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `R_99` (`tipo_item`),
  KEY `fk_item_seccion1_idx` (`id_secc`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

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

CREATE TABLE IF NOT EXISTS `matricula` (
  `id_matr` int(11) NOT NULL AUTO_INCREMENT,
  `num_matr` int(11) DEFAULT NULL,
  `id_curs` int(11) NOT NULL,
  `id_estu` int(11) NOT NULL,
  PRIMARY KEY (`id_matr`),
  KEY `R_23` (`id_curs`),
  KEY `R_24` (`id_estu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id_matr`, `num_matr`, `id_curs`, `id_estu`) VALUES
(31, 2, 1, 11),
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

CREATE TABLE IF NOT EXISTS `meta` (
  `id_meta` int(11) NOT NULL AUTO_INCREMENT,
  `metapromedio_meta` int(11) NOT NULL,
  `promediomomento_meta` int(11) NOT NULL,
  `riesgo_meta` char(1) NOT NULL,
  `hice_meta` varchar(100) NOT NULL,
  `nodebohacer_meta` varchar(100) NOT NULL,
  `debohacer_meta` varchar(100) NOT NULL,
  `fecha_meta` date NOT NULL,
  `id_matr` int(11) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `R_97` (`id_matr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `meta`
--

INSERT INTO `meta` (`id_meta`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `fecha_meta`, `id_matr`) VALUES
(3, 1, 2, 'N', 'hice', 'nodebo', 'debohacer', '2010-10-10', 31),
(5, 18, 15, '', 'hice', 'nodebo', 'debohacer', '2015-11-28', 41),
(7, 108, 17, 'N', 'hice', 'nodebo', 'debohacer', '2015-11-17', 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE IF NOT EXISTS `periodo` (
  `id_peri` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_peri` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_peri`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_peri`, `nombre_peri`) VALUES
(1, '2015-II');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE IF NOT EXISTS `respuesta` (
  `id_item` int(11) NOT NULL,
  `id_cons` int(11) NOT NULL,
  `nombre_resp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_item`,`id_cons`),
  KEY `R_16` (`id_item`),
  KEY `R_22` (`id_cons`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_item`, `id_cons`, `nombre_resp`) VALUES
(16, 1, 'Masculino'),
(17, 1, '11212'),
(18, 1, '4'),
(19, 1, 'Soltero'),
(20, 1, '2'),
(21, 1, '23'),
(22, 1, '4'),
(23, 1, '312'),
(24, 1, 'dsa'),
(25, 1, 'asd'),
(26, 1, '3'),
(27, 1, 'XXX'),
(28, 1, 'XXX'),
(29, 1, 'XXX'),
(30, 1, 'ivivr'),
(31, 1, 'Nunca'),
(31, 2, 'Siempre'),
(33, 1, 'Nunca'),
(34, 1, 'Siempre'),
(98, 1, 'Siempre'),
(141, 1, 'Siempre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion`
--

CREATE TABLE IF NOT EXISTS `reunion` (
  `id_reun` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reun` date DEFAULT NULL,
  `horainicio_reun` varchar(10) DEFAULT NULL,
  `horafin_reun` varchar(10) DEFAULT NULL,
  `motivo_reun` varchar(100) DEFAULT NULL,
  `asunto_reun` varchar(255) DEFAULT NULL,
  `reserva_reun` char(1) NOT NULL,
  `modalidad_reun` char(1) DEFAULT NULL,
  `id_estu` int(11) DEFAULT NULL,
  `id_tutor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reun`),
  KEY `R_25` (`id_estu`),
  KEY `R_26` (`id_tutor`),
  KEY `R_88` (`modalidad_reun`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `reunion`
--

INSERT INTO `reunion` (`id_reun`, `fecha_reun`, `horainicio_reun`, `horafin_reun`, `motivo_reun`, `asunto_reun`, `reserva_reun`, `modalidad_reun`, `id_estu`, `id_tutor`) VALUES
(1, '2010-09-08', '10:10', '10:13', 'Notas', 'Calificaciones, actitud frente a las clases.', 'N', 'I', 11, 1),
(3, '2015-12-16', '8:00', '9:00', 'Reunion Mensual', 'Inicio de Semestre', 'N', 'G', NULL, 2),
(4, '2015-12-01', '9:01', '10:01', 'Tareas', 'Trabajos Parciales', 'N', 'I', 11, 1),
(10, '2020-02-20', '02:02', '02:02', 'Reunion Mensual', 'Incio de Semestre', 'N', 'G', 11, 1),
(12, '1111-11-11', '11:11', '11:11', 'NULL', '', 'S', 'I', 11, 1),
(13, '2015-12-02', '10', '11', '', '', 'S', 'G', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `id_secc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_secc` varchar(45) DEFAULT NULL,
  `id_cues` int(11) NOT NULL,
  PRIMARY KEY (`id_secc`),
  KEY `fk_seccion_cuestionario1_idx` (`id_cues`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

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

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tusu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tusu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tusu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `tutor` (
  `id_tuto` int(11) NOT NULL AUTO_INCREMENT,
  `id_usua` int(11) NOT NULL,
  `id_peri` int(11) NOT NULL,
  `motivos_tuto` varchar(100) DEFAULT NULL,
  `derivados_tuto` varchar(100) DEFAULT NULL,
  `obstaculos_tuto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tuto`),
  KEY `R_6` (`id_usua`),
  KEY `R_7` (`id_peri`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id_tuto`, `id_usua`, `id_peri`, `motivos_tuto`, `derivados_tuto`, `obstaculos_tuto`) VALUES
(1, 42, 1, '12', '13', '14'),
(2, 43, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usua` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usua` varchar(100) DEFAULT NULL,
  `clave_usua` varchar(255) DEFAULT NULL,
  `nombres_usua` varchar(50) DEFAULT NULL,
  `apellidos_usua` varchar(50) DEFAULT NULL,
  `email_usua` varchar(50) DEFAULT NULL,
  `telefono_usua` varchar(20) DEFAULT NULL,
  `direccion_usua` varchar(255) DEFAULT NULL,
  `nacimiento_usua` date DEFAULT NULL,
  `id_tusu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usua`),
  KEY `usuario_ibfk_2` (`id_tusu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usua`, `codigo_usua`, `clave_usua`, `nombres_usua`, `apellidos_usua`, `email_usua`, `telefono_usua`, `direccion_usua`, `nacimiento_usua`, `id_tusu`) VALUES
(10, '2010-35550\r\n', 'tutoriaplus', 'Israel Nazareth', 'Chaparro Cruz', NULL, NULL, NULL, NULL, NULL),
(18, '2011119030\r\n', 'tutoriaplus', 'Javier', 'Flores Pari', NULL, NULL, NULL, NULL, NULL),
(20, '2011119035\r\n', 'tutoriaplus', 'Silvana Cabana', 'Cabana Yupanqui', NULL, NULL, NULL, NULL, NULL),
(33, '2012-36157\r\n', 'tutoriaplus', 'Gladys Fiorella', 'Huanacune Chambilla', NULL, NULL, NULL, NULL, NULL),
(36, '2012-36167\r\n', 'tutoriaplus', 'Cynthia Tatiana', 'Valeriano Argandoña', NULL, NULL, NULL, NULL, NULL),
(42, 'CM-1234', 'tutoriaplus', 'Ana Silvia', 'Cori Morón', NULL, NULL, NULL, NULL, NULL),
(43, 'CR-1234', 'tutoriaplus', 'Porfirio', 'Chata Ramírez', NULL, NULL, NULL, NULL, NULL);

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
  ADD CONSTRAINT `reunion_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tuto`);

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

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `actualizar_asistido_informe`(IN `v_id_cons` INT, IN `v_tema_cons` VARCHAR(100), IN `v_situacion_cons` VARCHAR(20))
    NO SQL
UPDATE `consejeria` SET `tema_cons`=v_tema_cons,`situacion_cons`=v_situacion_cons WHERE `id_cons`=v_id_cons$$

CREATE PROCEDURE `actualizar_mo_de_ob_informe`(IN `v_id_tuto` INT, IN `v_motivos_tuto` VARCHAR(100), IN `v_derivados_tuto` VARCHAR(100), IN `v_obstaculos_tuto` VARCHAR(255))
    NO SQL
UPDATE `tutor` SET `motivos_tuto`=v_motivos_tuto,`derivados_tuto`=v_derivados_tuto,`obstaculos_tuto`=v_obstaculos_tuto WHERE `id_tuto`=v_id_tuto$$

CREATE PROCEDURE `actualizar_respuesta`(IN `v_id_cons` INT, IN `v_id_item` INT, IN `v_nombre_resp` VARCHAR(255))
    NO SQL
INSERT INTO respuesta (id_cons,id_item,nombre_resp) VALUES (v_id_cons,v_id_item,v_nombre_resp)
ON DUPLICATE KEY UPDATE nombre_resp=VALUES(nombre_resp)$$

CREATE PROCEDURE `cabecera_cuestionario`(IN `v_id_cons` INT)
    NO SQL
select id_estu as estu, id_tutor as `tuto`,
(select concat_ws(' ',apellidos_usua,nombres_usua)
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as Alumno,
(select codigo_usua
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as Codigo,
(select concat_ws(' ',apellidos_usua,nombres_usua)
from usuario
inner join tutor
on usuario.id_usua=tutor.id_usua
where tutor.id_tuto=tuto) as Docente,
(select nombre_peri
from periodo
inner join tutor
on tutor.id_peri=periodo.id_peri
where id_tuto=tuto) as Periodo
from consejeria where id_cons=v_id_cons$$

CREATE PROCEDURE `cabecera_informe`(IN `v_id_tuto` INT)
    NO SQL
select concat_ws(' ',apellidos_usua,nombres_usua),nombre_peri,motivos_tuto,derivados_tuto,obstaculos_tuto
from tutor
inner join usuario
on tutor.id_tuto=v_id_tuto and usuario.id_usua=tutor.id_usua
inner join periodo
on tutor.id_peri=periodo.id_peri$$

CREATE PROCEDURE `consejeria_2_tutor`(IN `v_id_cons` INT)
    NO SQL
select id_tutor from consejeria where id_cons=v_id_cons$$

CREATE PROCEDURE `crear_grupal_reserva`(IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10), IN `v_id_cons` INT)
    NO SQL
INSERT INTO `reunion`
(`fecha_reun`, `horainicio_reun`, `horafin_reun`, `reserva_reun`, `modalidad_reun`, `id_tutor`)
VALUES
(v_fecha_reun, v_horainicio_reun, v_horafin_reun, 'S', 'G', (select `id_tutor` from consejeria where `id_cons`=v_id_cons))$$

CREATE PROCEDURE `crear_grupal_reunion`(IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10), IN `v_motivo_reun` VARCHAR(100), IN `v_asunto_reun` VARCHAR(255), IN `v_id_cons` INT)
    NO SQL
INSERT INTO `reunion`
(`fecha_reun`, `horainicio_reun`, `horafin_reun`, `motivo_reun`, `asunto_reun`, `reserva_reun`, `modalidad_reun`, `id_tutor`)
VALUES
(v_fecha_reun, v_horainicio_reun, v_horafin_reun, v_motivo_reun, v_asunto_reun, 'N', 'G', (select `id_tutor` from consejeria where `id_cons`=v_id_cons))$$

CREATE PROCEDURE `crear_individual_reserva`(IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10), IN `v_id_cons` INT)
    NO SQL
INSERT INTO `reunion`
(`fecha_reun`, `horainicio_reun`, `horafin_reun`, `reserva_reun`, `modalidad_reun`, `id_tutor`, `id_estu`)
VALUES
(v_fecha_reun, v_horainicio_reun, v_horafin_reun, 'S', 'I', (select `id_tutor` from consejeria where `id_cons`=v_id_cons), (select `id_estu` from consejeria where `id_cons`=v_id_cons))$$

CREATE PROCEDURE `crear_individual_reunion`(IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10), IN `v_motivo_reun` VARCHAR(100), IN `v_asunto_reun` VARCHAR(255), IN `v_id_cons` INT)
    NO SQL
INSERT INTO `reunion`
(`fecha_reun`, `horainicio_reun`, `horafin_reun`, `motivo_reun`, `asunto_reun`, `reserva_reun`, `modalidad_reun`, `id_tutor`, `id_estu`)
VALUES
(v_fecha_reun, v_horainicio_reun, v_horafin_reun, v_motivo_reun, v_asunto_reun, 'N', 'I', (select `id_tutor` from consejeria where `id_cons`=v_id_cons), (select `id_estu` from consejeria where `id_cons`=v_id_cons))$$

CREATE PROCEDURE `crear_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` VARCHAR(1), IN `v_hice_meta` VARCHAR(100), IN `v_nodebohacer_meta` VARCHAR(100), IN `v_debohacer_meta` VARCHAR(100), IN `v_id_matr` INT, IN `v_fecha_meta` DATE)
    NO SQL
INSERT INTO `meta`(`metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `id_matr`,`fecha_meta`) VALUES (v_metapromedio_meta,v_promediomomento_meta,v_riesgo_meta,v_hice_meta,v_nodebohacer_meta,v_debohacer_meta,v_id_matr,v_fecha_meta)$$

CREATE PROCEDURE `editar_asistidos_informe`(IN `v_id_cons` INT, IN `v_tema_cons` VARCHAR(100), IN `v_situacion_cons` VARCHAR(20))
    NO SQL
UPDATE `consejeria` SET `tema_cons`=v_tema_cons,`situacion_cons`=v_situacion_cons WHERE `id_cons`=v_id_cons$$

CREATE PROCEDURE `editar_informe`(IN `v_id_tuto` INT, IN `v_motivos_tuto` VARCHAR(100), IN `v_derivados_tuto` VARCHAR(100), IN `v_obstaculos_tuto` VARCHAR(255))
    NO SQL
UPDATE `tutor` SET `motivos_tuto`=v_motivos_tuto,`derivados_tuto`=v_derivados_tuto,
`obstaculos_tuto`=v_obstaculos_tuto WHERE id_tuto=v_id_tuto$$

CREATE PROCEDURE `editar_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` CHAR(1), IN `v_hice_meta` CHAR(100), IN `v_nodebohacer_meta` CHAR(100), IN `v_debohacer_meta` CHAR(100), IN `v_id_meta` INT)
    NO SQL
UPDATE `meta` SET `metapromedio_meta`=v_metapromedio_meta,`promediomomento_meta`=v_promediomomento_meta,`riesgo_meta`=v_riesgo_meta,`hice_meta`=v_hice_meta,`nodebohacer_meta`=v_nodebohacer_meta,`debohacer_meta`=v_debohacer_meta WHERE `id_meta`=v_id_meta$$

CREATE PROCEDURE `editar_reserva`(IN `v_id_reun` INT, IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10))
    NO SQL
UPDATE `reunion` SET `fecha_reun`=v_fecha_reun,`horainicio_reun`=v_horainicio_reun,`horafin_reun`=v_horafin_reun WHERE `id_reun`=v_id_reun$$

CREATE PROCEDURE `editar_reunion`(IN `v_id_reun` INT, IN `v_fecha_reun` DATE, IN `v_horainicio_reun` VARCHAR(10), IN `v_horafin_reun` VARCHAR(10), IN `v_motivo_reun` VARCHAR(100), IN `v_asunto_reun` VARCHAR(255))
    NO SQL
UPDATE `reunion` SET `fecha_reun`=v_fecha_reun,`horainicio_reun`=v_horainicio_reun,`horafin_reun`=v_horafin_reun,`motivo_reun`=v_motivo_reun,`asunto_reun`=v_asunto_reun WHERE `id_reun`=v_id_reun$$

CREATE PROCEDURE `eliminar_meta`(IN `v_id_meta` INT)
    NO SQL
DELETE FROM `meta` WHERE `id_meta`=v_id_meta$$

CREATE PROCEDURE `eliminar_reserva_reunion`(IN `v_id_reun` INT)
    NO SQL
DELETE FROM `reunion` WHERE `id_reun`=v_id_reun$$

CREATE PROCEDURE `eliminar_reunion`(IN `v_id_reun` INT)
    NO SQL
DELETE FROM `reunion` WHERE `id_reun`=v_id_reun$$

CREATE PROCEDURE `listar_alumnos_tutor`(IN `v_id_tutor` INT)
    NO SQL
SELECT id_cons,codigo_usua,concat_ws(' ',apellidos_usua,nombres_usua) FROM `consejeria` INNER JOIN estudiante on consejeria.id_tutor=v_id_tutor and estudiante.id_estu=consejeria.id_estu inner join usuario on usuario.id_usua=estudiante.id_usua$$

CREATE PROCEDURE `listar_cuestionarios`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_cues` as cues,`nombre_cues`,`id_tusu`,(select count(*) from `respuesta` inner join `item` on `respuesta`.`id_item`=`item`.`id_item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `id_cons`=v_id_cons and `cuestionario`.`id_cues`=cues) as `Items Respondidos`,(select count(*) from `item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `cuestionario`.`id_cues`=cues) as `Total de Items` FROM `cuestionario`$$

CREATE PROCEDURE `listar_docentes_periodo`(IN `v_id_peri` INT)
    NO SQL
select id_tuto,concat_ws(' ',nombres_usua,apellidos_usua) from tutor 
inner join usuario
on usuario.id_usua=tutor.id_usua
where id_peri=v_id_peri$$

CREATE PROCEDURE `listar_tutores`(IN `v_id_peri` INT)
    NO SQL
select id_tuto,concat_ws(' ',apellidos_usua,nombres_usua) from tutor inner join usuario on tutor.id_usua=usuario.id_usua where id_peri=v_id_peri$$

CREATE PROCEDURE `nombres_consejeria`(IN `v_id_cons` INT)
    NO SQL
select id_estu as estu, id_tutor as `tuto`,
(select concat_ws(' ',apellidos_usua,nombres_usua)
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as Alumno,
(select concat_ws(' ',apellidos_usua,nombres_usua)
from usuario
inner join tutor
on usuario.id_usua=tutor.id_usua
where tutor.id_tuto=tuto) as Docente
from consejeria where id_cons=v_id_cons$$

CREATE PROCEDURE `nombres_tutorandos`(IN `v_id_tuto` INT)
    NO SQL
select id_estu as estu,(select codigo_usua
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as codigo,(select concat_ws(' ',apellidos_usua,nombres_usua) as nombre
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as nombre
from consejeria
where id_tutor=v_id_tuto
order by codigo$$

CREATE PROCEDURE `nombre_curso`(IN `v_id_matr` INT)
    NO SQL
select `nombre_curs` from `curso`
inner join `matricula` on `matricula`.`id_matr`=v_id_matr and `matricula`.`id_curs`=`curso`.`id_curs`$$

CREATE PROCEDURE `nombre_tutor`(IN `v_id_tuto` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
inner join `tutor`
on `tutor`.`id_tuto`=v_id_tuto and `tutor`.`id_usua`=`usuario`.`id_usua`$$

CREATE PROCEDURE `nombre_usuario`(IN `v_id_usua` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
where `id_usua`=v_id_usua$$

CREATE PROCEDURE `ver_asistidos_informe`(IN `v_id_tuto` INT)
    NO SQL
select id_cons,id_estu as estu,(select codigo_usua
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as codigo,(select concat_ws(' ',apellidos_usua,nombres_usua) as nombre
from usuario
inner join estudiante
on usuario.id_usua=estudiante.id_usua
where id_estu=estu) as nombre,tema_cons,situacion_cons
from consejeria
where id_tutor=v_id_tuto
order by codigo$$

CREATE PROCEDURE `ver_consejeria`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_tutor`, `id_estu` FROM `consejeria` WHERE `id_cons`=v_id_cons$$

CREATE PROCEDURE `ver_cuestionario`(IN `v_id_cues` INT)
    NO SQL
select `nombre_cues`,`inicio_cues`,`final_cues`,`nombre_tusu`
from `cuestionario`
inner join `tipo_usuario`
on `cuestionario`.`id_tusu`=`tipo_usuario`.`id_tusu`
where `id_cues`=v_id_cues$$

CREATE PROCEDURE `ver_cursos`(IN `v_id_cons` INT)
    NO SQL
select `matricula`.`id_matr` as matr,`nombre_curs`,`num_matr`,(select count(*) from meta where id_matr=matr)
from `consejeria`
inner join `estudiante`
on `consejeria`.`id_cons`=v_id_cons and `estudiante`.`id_estu`=`consejeria`.`id_estu`
inner join `matricula`
on `matricula`.`id_estu`=`estudiante`.`id_estu`
inner join `curso`
on `curso`.`id_curs`=`matricula`.`id_curs`
order by `nombre_curs`$$

CREATE PROCEDURE `ver_grupal_reuniones`(IN `v_id_cons` INT)
    NO SQL
SELECT
`id_reun`, concat(DATE_FORMAT(`fecha_reun`,'%m-%d-%Y'),'<br>',`horainicio_reun`,'-',`horafin_reun`) as fecha, `motivo_reun`, `asunto_reun`
FROM `reunion`
INNER JOIN `consejeria`
on `reunion`.`id_tutor`=`consejeria`.`id_tutor` and `reserva_reun`='N' and `modalidad_reun`='G' and `id_cons`=v_id_cons
order by fecha$$

CREATE PROCEDURE `ver_individual_reuniones`(IN `v_id_cons` INT)
    NO SQL
SELECT
`id_reun`, concat(DATE_FORMAT(`fecha_reun`,'%m-%d-%Y'),'<br>',`horainicio_reun`,'-',`horafin_reun`) as fecha, `motivo_reun`, `asunto_reun`
FROM `reunion`
INNER JOIN `consejeria`
on `reunion`.`id_estu`=`consejeria`.`id_estu` and `reunion`.`id_tutor`=`consejeria`.`id_tutor` and `reserva_reun`='N' and `modalidad_reun`='I' and `id_cons`=v_id_cons
order by fecha$$

CREATE PROCEDURE `ver_items`(IN `v_id_cons` INT, IN `v_id_secc` INT)
    NO SQL
select `item`.`id_item`,`nombre_item`,`tipo_item`,`nombre_resp`,`id_cons` from `item`
left join `respuesta`
on `respuesta`.`id_item`=`item`.`id_item` and `id_cons`=v_id_cons
where `id_secc`=v_id_secc$$

CREATE PROCEDURE `ver_meta`(IN `v_id_meta` INT)
    NO SQL
SELECT `nombre_curs`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`
FROM `meta`
inner join `matricula`
on `meta`.`id_meta`=v_id_meta and `meta`.`id_matr`=`matricula`.`id_matr`
inner join `curso`
on `matricula`.`id_curs`=`curso`.`id_curs`$$

CREATE PROCEDURE `ver_metas`(IN `v_id_matr` INT)
    NO SQL
select fecha_meta,id_meta,metapromedio_meta,promediomomento_meta,riesgo_meta,hice_meta,nodebohacer_meta,debohacer_meta from `meta`
inner join `matricula`
on `matricula`.`id_matr`=v_id_matr and `meta`.`id_matr`=`matricula`.`id_matr`
order by `fecha_meta`$$

CREATE PROCEDURE `ver_reserva`(IN `v_id_rese` INT)
    NO SQL
SELECT `fecha_reun`, `horainicio_reun`, `horafin_reun` FROM `reunion` WHERE `id_reun`=v_id_rese$$

CREATE PROCEDURE `ver_reunion`(IN `v_id_reun` INT)
    NO SQL
SELECT `fecha_reun`, `horainicio_reun`, `horafin_reun`, `motivo_reun`, `asunto_reun` FROM `reunion` WHERE `id_reun`=v_id_reun$$

CREATE PROCEDURE `ver_secciones`(IN `v_id_cues` INT)
    NO SQL
select `id_secc`,`nombre_secc` from `seccion` where `id_cues`=v_id_cues$$

DELIMITER ;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
