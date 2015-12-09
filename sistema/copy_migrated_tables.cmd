REM Workbench Table Data copy script
REM Workbench Version: 6.3.5
REM 
REM Execute this to copy table data from a source RDBMS to MySQL.
REM Edit the options below to customize it. You will need to provide passwords, at least.
REM 
REM Source DB: Mysql@198.96.89.162:3306 (MySQL)
REM Target DB: Mysql@localhost:3306


@ECHO OFF
REM Source and target DB passwords
set arg_source_password=
set arg_target_password=

IF [%arg_source_password%] == [] (
    IF [%arg_target_password%] == [] (
        ECHO WARNING: Both source and target RDBMSes passwords are empty. You should edit this file to set them.
    )
)
set arg_worker_count=2
REM Uncomment the following options according to your needs

REM Whether target tables should be truncated before copy
REM set arg_truncate_target=--truncate-target
REM Enable debugging output
REM set arg_debug_output=--log-level=debug3


REM Creation of file with table definitions for copytable

set table_file="%TMP%\wb_tables_to_migrate.txt"
TYPE NUL > "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`seccion`	`tutoria`	`seccion`	`id_secc`	`id_secc`	`id_secc`, `nombre_secc`, `id_cues` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`modalidad_reunion`	`tutoria`	`modalidad_reunion`	`id_mreu`	`id_mreu`	`id_mreu`, `nombre_mreu` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`consejeria`	`tutoria`	`consejeria`	`id_cons`	`id_cons`	`id_cons`, `id_tutor`, `id_estu`, `tema_cons`, `situacion_cons` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`meta`	`tutoria`	`meta`	`id_meta`	`id_meta`	`id_meta`, `metapromedio_meta`, `promediomomento_meta`, `riesgo_meta`, `hice_meta`, `nodebohacer_meta`, `debohacer_meta`, `fecha_meta`, `id_matr` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`estado_reunion`	`tutoria`	`estado_reunion`	`id_ereu`	`id_ereu`	`id_ereu`, `nombre_ereu` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`tipo_usuario`	`tutoria`	`tipo_usuario`	`id_tusu`	`id_tusu`	`id_tusu`, `nombre_tusu` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`tutor`	`tutoria`	`tutor`	`id_tuto`	`id_tuto`	`id_tuto`, `id_usua`, `id_peri`, `motivos_tuto`, `derivados_tuto`, `obstaculos_tuto` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`item`	`tutoria`	`item`	`id_item`	`id_item`	`id_item`, `nombre_item`, `tipo_item`, `id_secc` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`reunion`	`tutoria`	`reunion`	`id_reun`	`id_reun`	`id_reun`, `fecha_reun`, `horainicio_reun`, `horafin_reun`, `motivo_reun`, `asunto_reun`, `id_ereu`, `id_mreu`, `id_estu`, `id_tutor` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`curso`	`tutoria`	`curso`	`id_curs`	`id_curs`	`id_curs`, `nombre_curs`, `semestre_curs` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`matricula`	`tutoria`	`matricula`	`id_matr`	`id_matr`	`id_matr`, `num_matr`, `id_curs`, `id_estu` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`periodo`	`tutoria`	`periodo`	`id_peri`	`id_peri`	`id_peri`, `nombre_peri` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`estudiante`	`tutoria`	`estudiante`	`id_estu`	`id_estu`	`id_estu`, `id_peri`, `id_usua` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`respuesta`	`tutoria`	`respuesta`	`id_item`,`id_cons`	`id_item`,`id_cons`	`id_item`, `id_cons`, `nombre_resp` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`usuario`	`tutoria`	`usuario`	`id_usua`	`id_usua`	`id_usua`, `codigo_usua`, `clave_usua`, `nombres_usua`, `apellidos_usua`, `email_usua`, `telefono_usua`, `direccion_usua`, `nacimiento_usua`, `id_tusu` >> "%TMP%\wb_tables_to_migrate.txt"
ECHO `tutoria`	`cuestionario`	`tutoria`	`cuestionario`	`id_cues`	`id_cues`	`id_cues`, `nombre_cues`, `inicio_cues`, `final_cues`, `id_tusu` >> "%TMP%\wb_tables_to_migrate.txt"


wbcopytables.exe --mysql-source="tutoria@198.96.89.162:3306" --target="root@localhost:3306" --source-password="%arg_source_password%" --target-password="%arg_target_password%" --table-file="%table_file%" --thread-count=%arg_worker_count% %arg_truncate_target% %arg_debug_output%

REM Removes the file with the table definitions
DEL "%TMP%\wb_tables_to_migrate.txt"


