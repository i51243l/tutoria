<?
session_start();
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true)
{}
else
{
	header('Location: login.php');
	exit;
}

header('Content-Type: text/html; charset=ISO-8859-1');
include("frontend.php");

function ver_consejeria($id_cons)
{
	include("conexion.php");
?>
<!DOCTYPE html>
<html lang="es">

<?
	all_head();
?>

<body>

	<div id="wrapper">
		<!-- Navigation -->

<?

	navegacion($_SESSION['id_usua'],$_SESSION['tipo_usuario']);

	$query="call ver_consejeria('".$id_cons."')";
	$result=$conexion->query($query);
	$consejeria=array();
	while($row = mysqli_fetch_row($result))
	{
		$consejeria=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call nombres_consejeria('".$id_cons."')";
	$result=$conexion->query($query);
	$nombres=array();
	while($row = mysqli_fetch_row($result))
	{
		$nombres=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call listar_cuestionarios(".$id_cons.")";
	$result=$conexion->query($query);
	$cuestionario=array();
	while($row = mysqli_fetch_row($result))
	{
		$cuestionario[]=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

?>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="container">
					<div class="row">
          	<div class="col-lg-12">
            	<h1 class="page-header">Consejería <small>Sistema de tutoría</small>
              </h1>
						</div>
          </div>

					<div class="row">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl">
									</div>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-lg-10 col-lg-offset-1">
									<h3><? echo $nombres[2] ?></h3>
									<h4>Alumno(a)</h4>
									<hr class="small">
								</div>
							</div>
							<div class="container">

								
								<!--inicio panel-->
								<div class="row" id='#collapse_alumno_1'>
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h1 class="panel-title"><a data-toggle="collapse" data-target="#collapse_alumno" href="#collapse_alumno_1">Formatos</a></h1>
											</div>
												<div id="collapse_alumno" class="panel-collapse collapse in"> <!-- in -->
												<div class="panel-body"> 
													<br>
													<table class="responsive table table-striped table-bordered table-hover table-condensed">
														<tr class="info">
															<th>Nombre </th>
															<th>Estado </th>
															<th>Acciones</th>
														</tr>

														<?
															for ($i=0; $i<count($cuestionario); $i++)
															{ 
																if($cuestionario[$i][2]==1)
																{
																	if($cuestionario[$i][3]==0)
																	{
																		$trclass='warning';
																		$estado='Vacio';
																	}
																	elseif ($cuestionario[$i][3]==$cuestionario[$i][4])
																	{
																		$trclass='success';
																		$estado='Completo';
																	}
																	else
																	{
																		$trclass='danger';
																		$estado='Incompleto';
																	}

																	?>
																		<form <? echo "id='alumno_cuestionario_ver".$cuestionario[$i][0]."'";?> action="cuestionario.php" method="POST">
																			<input type="hidden" name='accion' value='ver_cuestionario' >
																			<input type="hidden" name='id_cues' <? echo "value='".$cuestionario[$i][0]."'"; ?> >
																			<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																		</form>

																		<?
																			if ($_SESSION['tipo_usuario']=='estudiante')
																			{
																		?>
																				<form <? echo "id='alumno_cuestionario_editar".$cuestionario[$i][0]."'";?> action="cuestionario.php" method="POST">
																					<input type="hidden" name='accion' value='editar_cuestionario' >
																					<input type="hidden" name='id_cues' <? echo "value='".$cuestionario[$i][0]."'"; ?> >
																					<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																				</form>
																		<?
																			}
																		?>

																		<tr <? echo "class='".$trclass."'"; ?> >
																			<td><? echo $cuestionario[$i][1]; ?></td>
																			<td><? echo $estado; ?></td>
																			<td>	
																				<a href='#' <? echo "onclick='alumno_cuestionario_ver".$cuestionario[$i][0].".submit(); return false'";?> ><i class="fa fa-eye"></i>Ver</a>

																					<?
																						if ($_SESSION['tipo_usuario']=='estudiante')
																						{
																					?>
																							<a href='#' <? echo "onclick='alumno_cuestionario_editar".$cuestionario[$i][0].".submit(); return false'";?> ><i class="fa fa-pencil"></i>Editar</a>
																					<?
																						}
																					?>
																				</td>
																			</tr>
																		
																	<?
																}
															}
														?>
													</table>


												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- fin panel-->
								<!--inicio panel -->
								
								<form id='ver_metas' action="meta.php" method="POST">
									<input type="hidden" name='accion' value='ver_metas' >
									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
								</form>

								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-success">
											<div class="panel-heading">
												<h3 class="panel-title"><a href='#' onclick='ver_metas.submit(); return false'><i class="fa fa-file-text-o"></i> Ver Reporte de metas</a></h3>
											</div>
										</div>
									</div>
								</div>
								<!-- fin panel-->


								<!-- </form> -->   

							</div>


							<div class="row text-center">
								<div class="col-lg-10 col-lg-offset-1">
									<h3><? echo $nombres[3] ?></h3>
									<h4>Consejero(a) - Tutor(a)</h4>
									<hr class="small">
								</div>
							</div>


							<div class="container">

								
								<!--inicio panel-->
								<div class="row" id='#collapse_docente_1'>
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h1 class="panel-title"><a data-toggle="collapse" data-target="#collapse_docente" href="#collapse_docente_1">Formatos</a></h1>
											</div>
												<div id="collapse_docente" class="panel-collapse collapse in"> <!-- in -->
												<div class="panel-body"> 
													<br>
													<table class="responsive table table-striped table-bordered table-hover table-condensed">
														<tr class="info">
															<th>Nombre </th>
															<th>Estado </th>
															<th>Acciones</th>
														</tr>

														<?
															for ($i=0; $i<count($cuestionario); $i++)
															{ 
																if($cuestionario[$i][2]==2)
																{
																	if($cuestionario[$i][3]==0)
																	{
																		$trclass='warning';
																		$estado='Vacio';
																	}
																	elseif ($cuestionario[$i][3]==$cuestionario[$i][4])
																	{
																		$trclass='success';
																		$estado='Completo';
																	}
																	else
																	{
																		$trclass='danger';
																		$estado='Incompleto';
																	}

																	?>
																		<form <? echo "id='alumno_cuestionario_ver".$cuestionario[$i][0]."'";?> action="cuestionario.php" method="POST">
																			<input type="hidden" name='accion' value='ver_cuestionario' >
																			<input type="hidden" name='id_cues' <? echo "value='".$cuestionario[$i][0]."'"; ?> >
																			<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																		</form>

																		<?
																			if ($_SESSION['tipo_usuario']=='docente')
																			{
																		?>
																				<form <? echo "id='alumno_cuestionario_editar".$cuestionario[$i][0]."'";?> action="cuestionario.php" method="POST">
																					<input type="hidden" name='accion' value='editar_cuestionario' >
																					<input type="hidden" name='id_cues' <? echo "value='".$cuestionario[$i][0]."'"; ?> >
																					<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																				</form>
																		<?
																			}
																		?>

																		<tr <? echo "class='".$trclass."'"; ?> >
																			<td><? echo $cuestionario[$i][1]; ?></td>
																			<td><? echo $estado; ?></td>
																			<td>	
																				<a href='#' <? echo "onclick='alumno_cuestionario_ver".$cuestionario[$i][0].".submit(); return false'";?> ><i class="fa fa-eye"></i>Ver</a>

																					<?
																						if ($_SESSION['tipo_usuario']=='docente')
																						{
																					?>
																							<a href='#' <? echo "onclick='alumno_cuestionario_editar".$cuestionario[$i][0].".submit(); return false'";?> ><i class="fa fa-pencil"></i>Editar</a>
																					<?
																						}
																					?>
																				</td>
																			</tr>
																		
																	<?
																}
															}
														?>
													</table>


												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- fin panel-->
								
								<!--inicio panel -->
								
								<?
									$query="call consejeria_2_tutor(".$id_cons.")";
									$result=$conexion->query($query);
									$tutor=array();
									while($row = mysqli_fetch_row($result))
									{
										$tutor=$row;
									}
									mysqli_free_result($result);
									$conexion->close();		
								?>						

								<?
									if ($_SESSION['tipo_usuario']!='estudiante')
									{
								?>

								<form id='ver_informe' action="informe.php" method="POST">
									<input type="hidden" name='accion' value='ver_informe' >
									<input type="hidden" name='id_tuto' <? echo "value='".$tutor[0]."'"; ?> >
									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
								</form>

								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-success">
											<div class="panel-heading">
												<h3 class="panel-title"><a href='#' onclick='ver_informe.submit(); return false'><i class="fa fa-file-text-o"></i> Ver Informe Semestral de Labor de Consejería - Tutoría Académica</a></h3>
											</div>
										</div>
									</div>
								</div>

								<?
									if($_SESSION['tipo_usuario']=='docente')
									{
								?>
											<form id='editar_informe' action="informe.php" method="POST">
												<input type="hidden" name='accion' value='editar_informe' >
												<input type="hidden" name='id_tuto' <? echo "value='".$tutor[0]."'"; ?> >
												<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
											</form>

											<div class="row">
												<div class="col-sm-12">
													<div class="panel panel-info">
														<div class="panel-heading">
															<h3 class="panel-title"><a href='#' onclick='editar_informe.submit(); return false'><i class="fa fa-file-text-o"></i> Editar Informe Semestral de Labor de Consejería - Tutoría Académica</a></h3>
													</div>
												</div>
											</div>
										</div>
										<?
											}
										?>
								<?
									}
								?>

								<!-- fin panel-->


								<!-- </form> -->   

							</div>

							<div class="row text-center">
								<div class="col-lg-10 col-lg-offset-1">
									<h3>Reuniones</h3>
									<hr class="small">
								</div>
							</div>
							<div class="container">

								
								<!--inicio panel-->

								<!-- fin panel-->
								
								<!--inicio panel-->
								
								<form id='ver_reuniones' action="reunion.php" method="POST">
									<input type="hidden" name='accion' value='ver_reuniones' >
									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
								</form>

								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-success">
											<div class="panel-heading">
												<h3 class="panel-title"><a href='#' onclick='ver_reuniones.submit(); return false'><i class="fa fa-file-text-o"></i> Ver Registro de la Consejería - Tutoría Académica</a></h3>
											</div>
										</div>
									</div>
								</div>

								<!-- fin panel-->


								<!-- </form> -->   

							</div>

						</div>
					</div>
				</div>


			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->



	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>

<?
}
?>

<?
	function update_cuestionario($id_cons,$item,$respuesta)
	{
		$query="";
		include("conexion.php");
		for ($i=0; $i < count($item); $i++)
		{ 
			if(key_exists($item[$i],$respuesta)==TRUE and $respuesta[$item[$i]]!='')
			{
				$query.="call actualizar_respuesta('".$id_cons."','".$item[$i]."','".$respuesta[$item[$i]]."');";
			}
		}
		$conexion->multi_query($query);
		$conexion->close();
		ver_consejeria($id_cons);
	}
?>


<?
	function update_informe($accion,$id_cons,$tema,$situacion,$motivos,$derivados,$obstaculos,$id_tuto,$consejeria)
	{
		$query="";
		include("conexion.php");
		for ($i=0; $i < count($id_cons); $i++)
		{ 
			if(key_exists($id_cons[$i],$tema)==TRUE and key_exists($id_cons[$i],$situacion)==TRUE and $tema[$id_cons[$i]]!='' and $situacion[$id_cons[$i]]!='')
			{
				$query.="call actualizar_asistido_informe('".$id_cons[$i]."','".$tema[$id_cons[$i]]."','".$situacion[$id_cons[$i]]."');";
			}
		}
		$query.="call actualizar_mo_de_ob_informe('".$id_tuto."','".$motivos."','".$derivados."','".$obstaculos."');";
		//echo $query;
		$conexion->multi_query($query);
		$conexion->close();
		ver_consejeria($consejeria);
	}
?>

<?
	//accion=ver,editar,actualizar,imprimir
	
	//ver,editar <-- si se puede combinar
	//crear <-- siempre separado
	//create,update,delete <-- acciones en la db

	//solo se podra: ver,editar

	if(!isset($_POST['accion']))
	{
		if($_SESSION['tipo_usuario']=='estudiante')
		{
			include("conexion.php");

			$query="call id_cons('".$_SESSION['id_estu']."')";
			$result=$conexion->query($query);
			while($row = mysqli_fetch_row($result))
			{
				$id_estu=$row;
			}
			mysqli_free_result($result);
			$conexion->next_result();
			ver_consejeria($id_estu[0]);
		}
		else
		{
			header('Location: asignacion.php');
		}
		exit;

	}

	switch ($_POST['accion'])
	{
		case 'ver_consejeria':
			ver_consejeria($_POST['id_cons']);
			break;

		case 'ver_consejeria_alumno':
			ver_consejeria($_POST['id_cons']);
			break;

		case 'update_cuestionario':
      update_cuestionario($_POST['id_cons'],$_POST['item'],$_POST['respuesta']);
      break;

    case 'update_informe':
      update_informe($_POST['accion'],$_POST['id_cons'],$_POST['tema'],$_POST['situacion'],$_POST['motivos'],$_POST['derivados'],$_POST['obstaculos'],$_POST['id_tuto'],$_POST['consejeria']);
      break;

		default:
			break;
	}
?>	