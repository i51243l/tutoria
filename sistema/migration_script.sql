-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: tutoria
-- Source Schemata: tutoria
-- Created: Fri Nov 27 13:23:36 2015
-- Workbench Version: 6.3.5
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema tutoria
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `tutoria` ;
CREATE SCHEMA IF NOT EXISTS `tutoria` ;

-- ----------------------------------------------------------------------------
-- Table tutoria.consejeria
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`consejeria` (
  `id_cons` INT(11) NOT NULL AUTO_INCREMENT,
  `id_tutor` INT(11) NOT NULL,
  `id_estu` INT(11) NOT NULL,
  `tema_cons` VARCHAR(100) NOT NULL,
  `situacion_cons` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_cons`),
  INDEX `R_9` (`id_estu` ASC),
  INDEX `R_10` (`id_tutor` ASC),
  CONSTRAINT `consejeria_ibfk_1`
    FOREIGN KEY (`id_estu`)
    REFERENCES `tutoria`.`estudiante` (`id_estu`),
  CONSTRAINT `consejeria_ibfk_2`
    FOREIGN KEY (`id_tutor`)
    REFERENCES `tutoria`.`tutor` (`id_tuto`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.cuestionario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`cuestionario` (
  `id_cues` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_cues` VARCHAR(100) NULL DEFAULT NULL,
  `inicio_cues` TEXT NULL DEFAULT NULL,
  `final_cues` TEXT NULL DEFAULT NULL,
  `id_tusu` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cues`),
  INDEX `fk_cuestionario_tipo_usuario1_idx` (`id_tusu` ASC),
  CONSTRAINT `fk_cuestionario_tipo_usuario1`
    FOREIGN KEY (`id_tusu`)
    REFERENCES `tutoria`.`tipo_usuario` (`id_tusu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.curso
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`curso` (
  `id_curs` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_curs` CHAR(50) NULL DEFAULT NULL,
  `semestre_curs` INT(11) NOT NULL,
  PRIMARY KEY (`id_curs`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.estado_reunion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`estado_reunion` (
  `id_ereu` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_ereu` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_ereu`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.estudiante
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`estudiante` (
  `id_estu` INT(11) NOT NULL AUTO_INCREMENT,
  `id_peri` INT(11) NOT NULL,
  `id_usua` INT(11) NOT NULL,
  PRIMARY KEY (`id_estu`),
  INDEX `R_3` (`id_peri` ASC),
  INDEX `R_98` (`id_usua` ASC),
  CONSTRAINT `estudiante_ibfk_1`
    FOREIGN KEY (`id_peri`)
    REFERENCES `tutoria`.`periodo` (`id_peri`),
  CONSTRAINT `estudiante_ibfk_2`
    FOREIGN KEY (`id_usua`)
    REFERENCES `tutoria`.`usuario` (`id_usua`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`item` (
  `id_item` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_item` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_item` CHAR(1) NULL DEFAULT NULL,
  `id_secc` INT(11) NOT NULL,
  PRIMARY KEY (`id_item`),
  INDEX `R_99` (`tipo_item` ASC),
  INDEX `fk_item_seccion1_idx` (`id_secc` ASC),
  CONSTRAINT `fk_item_seccion1`
    FOREIGN KEY (`id_secc`)
    REFERENCES `tutoria`.`seccion` (`id_secc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 143
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.matricula
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`matricula` (
  `id_matr` INT(11) NOT NULL AUTO_INCREMENT,
  `num_matr` INT(11) NULL DEFAULT NULL,
  `id_curs` INT(11) NOT NULL,
  `id_estu` INT(11) NOT NULL,
  PRIMARY KEY (`id_matr`),
  INDEX `R_23` (`id_curs` ASC),
  INDEX `R_24` (`id_estu` ASC),
  CONSTRAINT `matricula_ibfk_1`
    FOREIGN KEY (`id_curs`)
    REFERENCES `tutoria`.`curso` (`id_curs`),
  CONSTRAINT `matricula_ibfk_2`
    FOREIGN KEY (`id_estu`)
    REFERENCES `tutoria`.`estudiante` (`id_estu`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.meta
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`meta` (
  `id_meta` INT(11) NOT NULL AUTO_INCREMENT,
  `metapromedio_meta` INT(11) NOT NULL,
  `promediomomento_meta` INT(11) NOT NULL,
  `riesgo_meta` CHAR(1) NOT NULL,
  `hice_meta` VARCHAR(100) NOT NULL,
  `nodebohacer_meta` VARCHAR(100) NOT NULL,
  `debohacer_meta` VARCHAR(100) NOT NULL,
  `fecha_meta` DATE NOT NULL,
  `id_matr` INT(11) NOT NULL,
  PRIMARY KEY (`id_meta`),
  INDEX `R_97` (`id_matr` ASC),
  CONSTRAINT `fk_meta_1`
    FOREIGN KEY (`id_matr`)
    REFERENCES `tutoria`.`matricula` (`id_matr`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.modalidad_reunion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`modalidad_reunion` (
  `id_mreu` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_mreu` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_mreu`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.periodo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`periodo` (
  `id_peri` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_peri` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_peri`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.respuesta
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`respuesta` (
  `id_item` INT(11) NOT NULL,
  `id_cons` INT(11) NOT NULL,
  `nombre_resp` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`, `id_cons`),
  INDEX `R_16` (`id_item` ASC),
  INDEX `R_22` (`id_cons` ASC),
  CONSTRAINT `respuesta_ibfk_1`
    FOREIGN KEY (`id_item`)
    REFERENCES `tutoria`.`item` (`id_item`),
  CONSTRAINT `respuesta_ibfk_2`
    FOREIGN KEY (`id_cons`)
    REFERENCES `tutoria`.`consejeria` (`id_cons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.reunion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`reunion` (
  `id_reun` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_reun` DATE NULL DEFAULT NULL,
  `horainicio_reun` VARCHAR(20) NULL DEFAULT NULL,
  `horafin_reun` VARCHAR(5) NULL DEFAULT NULL,
  `motivo_reun` VARCHAR(100) NOT NULL,
  `asunto_reun` VARCHAR(255) NOT NULL,
  `id_ereu` INT(11) NOT NULL,
  `id_mreu` INT(11) NULL DEFAULT NULL,
  `id_estu` INT(11) NULL DEFAULT NULL,
  `id_tutor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_reun`),
  INDEX `R_25` (`id_estu` ASC),
  INDEX `R_26` (`id_tutor` ASC),
  INDEX `R_89` (`id_ereu` ASC),
  INDEX `R_88` (`id_mreu` ASC),
  CONSTRAINT `reunion_ibfk_1`
    FOREIGN KEY (`id_estu`)
    REFERENCES `tutoria`.`estudiante` (`id_estu`),
  CONSTRAINT `reunion_ibfk_2`
    FOREIGN KEY (`id_tutor`)
    REFERENCES `tutoria`.`tutor` (`id_tuto`),
  CONSTRAINT `reunion_ibfk_3`
    FOREIGN KEY (`id_ereu`)
    REFERENCES `tutoria`.`estado_reunion` (`id_ereu`),
  CONSTRAINT `reunion_ibfk_4`
    FOREIGN KEY (`id_mreu`)
    REFERENCES `tutoria`.`modalidad_reunion` (`id_mreu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.seccion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`seccion` (
  `id_secc` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_secc` VARCHAR(45) NULL DEFAULT NULL,
  `id_cues` INT(11) NOT NULL,
  PRIMARY KEY (`id_secc`),
  INDEX `fk_seccion_cuestionario1_idx` (`id_cues` ASC),
  CONSTRAINT `fk_seccion_cuestionario1`
    FOREIGN KEY (`id_cues`)
    REFERENCES `tutoria`.`cuestionario` (`id_cues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.tipo_usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`tipo_usuario` (
  `id_tusu` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_tusu` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tusu`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.tutor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`tutor` (
  `id_tuto` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usua` INT(11) NOT NULL,
  `id_peri` INT(11) NOT NULL,
  `motivos_tuto` VARCHAR(100) NULL DEFAULT NULL,
  `derivados_tuto` VARCHAR(100) NULL DEFAULT NULL,
  `obstaculos_tuto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuto`),
  INDEX `R_6` (`id_usua` ASC),
  INDEX `R_7` (`id_peri` ASC),
  CONSTRAINT `tutor_ibfk_1`
    FOREIGN KEY (`id_usua`)
    REFERENCES `tutoria`.`usuario` (`id_usua`),
  CONSTRAINT `tutor_ibfk_2`
    FOREIGN KEY (`id_peri`)
    REFERENCES `tutoria`.`periodo` (`id_peri`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table tutoria.usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tutoria`.`usuario` (
  `id_usua` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_usua` VARCHAR(100) NULL DEFAULT NULL,
  `clave_usua` VARCHAR(255) NULL DEFAULT NULL,
  `nombres_usua` VARCHAR(50) NULL DEFAULT NULL,
  `apellidos_usua` VARCHAR(50) NULL DEFAULT NULL,
  `email_usua` VARCHAR(50) NULL DEFAULT NULL,
  `telefono_usua` VARCHAR(20) NULL DEFAULT NULL,
  `direccion_usua` VARCHAR(255) NULL DEFAULT NULL,
  `nacimiento_usua` DATE NULL DEFAULT NULL,
  `id_tusu` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usua`),
  INDEX `usuario_ibfk_2` (`id_tusu` ASC),
  CONSTRAINT `usuario_ibfk_2`
    FOREIGN KEY (`id_tusu`)
    REFERENCES `tutoria`.`tipo_usuario` (`id_tusu`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Routine tutoria.actualizar_respuesta
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `actualizar_respuesta`(IN `v_id_cons` INT, IN `v_id_item` INT, IN `v_nombre_resp` VARCHAR(255))
    NO SQL
INSERT INTO respuesta (id_cons,id_item,nombre_resp) VALUES (v_id_cons,v_id_item,v_nombre_resp)
ON DUPLICATE KEY UPDATE nombre_resp=VALUES(nombre_resp)$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.crear_meta
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `crear_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` VARCHAR(1), IN `v_hice_meta` VARCHAR(100), IN `v_nodebohacer_meta` VARCHAR(100), IN `v_debohacer_meta` VARCHAR(100), IN `v_id_matr` INT, IN `v_fecha_meta` DATE)
    NO SQL
INSERT INTO `meta`(`metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `id_matr`,`fecha_meta`) VALUES (v_metapromedio_meta,v_promediomomento_meta,v_riesgo_meta,v_hice_meta,v_nodebohacer_meta,v_debohacer_meta,v_id_matr,v_fecha_meta)$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.editar_meta
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `editar_meta`(IN `v_metapromedio_meta` INT, IN `v_promediomomento_meta` INT, IN `v_riesgo_meta` CHAR(1), IN `v_hice_meta` CHAR(100), IN `v_nodebohacer_meta` CHAR(100), IN `v_debohacer_meta` CHAR(100), IN `v_id_meta` INT)
    NO SQL
UPDATE `meta` SET `metapromedio_meta`=v_metapromedio_meta,`promediomomento_meta`=v_promediomomento_meta,`riesgo_meta`=v_riesgo_meta,`hice_meta`=v_hice_meta,`nodebohacer_meta`=v_nodebohacer_meta,`debohacer_meta`=v_debohacer_meta WHERE `id_meta`=v_id_meta$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.listar_cuestionarios
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `listar_cuestionarios`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_cues` as cues,`nombre_cues`,`id_tusu`,(select count(*) from `respuesta` inner join `item` on `respuesta`.`id_item`=`item`.`id_item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `id_cons`=v_id_cons and `cuestionario`.`id_cues`=cues) as `Items Respondidos`,(select count(*) from `respuesta` inner join `item` on `respuesta`.`id_item`=`item`.`id_item` inner join `seccion` on `item`.`id_secc`=`seccion`.`id_secc` inner join `cuestionario` on `seccion`.`id_cues`=`cuestionario`.`id_cues` where `cuestionario`.`id_cues`=cues) as `Total de Items` FROM `cuestionario`$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.nombre_curso
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_curso`(IN `v_id_matr` INT)
    NO SQL
select `nombre_curs` from `curso`
inner join `matricula` on `matricula`.`id_matr`=v_id_matr and `matricula`.`id_curs`=`curso`.`id_curs`$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.nombre_estudiante
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_estudiante`(IN `v_id_estu` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
inner join `estudiante`
on `estudiante`.`id_estu`=v_id_estu and `estudiante`.`id_usua`=`usuario`.`id_usua`$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.nombre_tutor
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_tutor`(IN `v_id_tuto` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
inner join `tutor`
on `tutor`.`id_tuto`=v_id_tuto and `tutor`.`id_usua`=`usuario`.`id_usua`$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.nombre_usuario
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `nombre_usuario`(IN `v_id_usua` INT)
    NO SQL
select concat_ws(' ',nombres_usua,apellidos_usua)
from `usuario`
where `id_usua`=v_id_usua$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.ver_consejeria
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_consejeria`(IN `v_id_cons` INT)
    NO SQL
SELECT `id_tutor`, `id_estu` FROM `consejeria` WHERE `id_cons`=v_id_cons$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.ver_cuestionario
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_cuestionario`(IN `v_id_cues` INT)
    NO SQL
select `nombre_cues`,`inicio_cues`,`final_cues`,`nombre_tusu`
from `cuestionario`
inner join `tipo_usuario`
on `cuestionario`.`id_tusu`=`tipo_usuario`.`id_tusu`
where `id_cues`=v_id_cues$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.ver_items
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_items`(IN `v_id_cons` INT, IN `v_id_secc` INT)
    NO SQL
select `item`.`id_item`,`nombre_item`,`tipo_item`,`nombre_resp`,`id_cons` from `item`
left join `respuesta`
on `respuesta`.`id_item`=`item`.`id_item` and `id_cons`=v_id_cons
where `id_secc`=v_id_secc$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.ver_meta
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_meta`(IN `v_id_meta` INT)
    NO SQL
SELECT `nombre_curs`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`
FROM `meta`
inner join `matricula`
on `meta`.`id_meta`=v_id_meta and `meta`.`id_matr`=`matricula`.`id_matr`
inner join `curso`
on `matricula`.`id_curs`=`curso`.`id_curs`$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine tutoria.ver_secciones
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `tutoria`$$
CREATE DEFINER=`tutoria`@`%` PROCEDURE `ver_secciones`(IN `v_id_cues` INT)
    NO SQL
select `id_secc`,`nombre_secc` from `seccion` where `id_cues`=v_id_cues$$

DELIMITER ;
SET FOREIGN_KEY_CHECKS = 1;
