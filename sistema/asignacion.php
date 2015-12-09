<?
session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true)
{}
else
{
	header('Location: login.php');
	exit;
}
if($_SESSION['tipo_usuario']!='admin' and $_SESSION['tipo_usuario']!='docente')
{
	header('Location: inicio.php');
	exit;
}

header('Content-Type: text/html; charset=ISO-8859-1');
include("frontend.php");

function ver_asignaciones()
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

	if($_SESSION['tipo_usuario']=='admin')
	{

		$query="call listar_tutores_periodo('".$_SESSION['id_peri']."')";
		$result=$conexion->query($query);
		$tutores=array();
		while($row = mysqli_fetch_row($result))
		{
			$tutores[]=$row;
		}
		mysqli_free_result($result);
		$conexion->next_result();
	
	}
	else
	{
		$tutores=array();
		$tutores[0][0]=$_SESSION['id_tuto'];
		$tutores[0][1]='Alumnos Tutorados';
		$tutores[0][2]='';
		$tutores[0][3]='';
	}

	$query="call nombre_periodo('".$_SESSION['id_peri']."')";
	$result=$conexion->query($query);
	$periodo=array();
	while($row = mysqli_fetch_row($result))
	{
		$periodo=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();


?>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="container">
					<br>
					<br>
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
									<h3>Periodo: <? echo $periodo[0]; ?></h3>
									<h4>Asignaciones</h4>
									<hr class="small">
								</div>
							</div>
							<div class="container">

								
								<?
									$abierto='';
									if(count($tutores)==1)
									{
										$abierto='in';
									}
									for ($i=0; $i < count($tutores) ; $i++) //falta arreglar
									{ 
										if($tutores[$i][2]=='0')
										{
											$colorpanel='danger';
										}
										else
										{
											if ($tutores[$i][3]=='0')
											{
												$colorpanel='warning';
											}
											else
											{
												$colorpanel='info';
											}
										}
								?>
										<form <? echo "id='crear_asignacion_".$tutores[$i][0]."'";?> action="asignacion.php" method="POST">
											<input type="hidden" name='accion' value='crear_asignacion' >
											<input type="hidden" name='id_tuto' <? echo "value='".$tutores[$i][0]."'";?> >
										</form>

										<div class="row" <? echo "id='#collapse_2_".$tutores[$i][0]."'"; ?>>
											<div class="col-sm-12">
												<div <? echo "class='panel panel-".$colorpanel."'"; ?> >
													<div class="panel-heading">
														<h1 class="panel-title"><a data-toggle="collapse" <? echo "data-target='#collapse_".$tutores[$i][0]."'"; ?> <? echo "href='#collapse_2_".$tutores[$i][0]."'"; ?>>
														<? 
																if($_SESSION['tipo_usuario']=='admin'){echo $tutores[$i][1]." :: Estudiantes Asignados: ".$tutores[$i][2].", Reuniones Grupales Realizadas ".$tutores[$i][3];} else{echo "Estudiantes Tutorados";}
														?>
														</a></h1>
													</div>
													<div <? echo "id='collapse_".$tutores[$i][0]."'"; ?> <? echo "class='panel-collapse collapse ".$abierto."'"; ?>  > <!-- in -->
														<div class="panel-body"> 

															<?
																if ($_SESSION['tipo_usuario']=='admin')
																{
															?>
																	<a href='#' <? echo "onclick='crear_asignacion_".$tutores[$i][0].".submit(); return false'";?> ><i class="fa fa-plus"></i> Crear Asignación</a>
															<?
																}
															?>
															

															<?
																if($tutores[$i][2]!='0')
																{
															?>
																	<br>
																	<table class="responsive table table-striped table-bordered table-hover table-condensed">
																		<tr class="info">
																			<th>Código</th>
																			<th>Estudiante</th>
																			<th>Nro. de Reuniones Individuales</th>
																			<th>Acciones</th>
																		</tr>

																		<?
																			$query="call listar_alumnos_tutor('".$tutores[$i][0]."')";
																			$result=$conexion->query($query);
																			$alumnos=array();
																			while($row = mysqli_fetch_row($result))
																			{
																				$alumnos[]=$row;
																			}
																			mysqli_free_result($result);
																			$conexion->next_result();

																			for ($j=0; $j<count($alumnos); $j++)
																			{ 
																					if($alumnos[$j][4]=='0')
																					{
																						$trclass='danger';
																						$riesgo='Si';
																					}
																					else
																					{
																						$trclass='success';
																						$riesgo='No';
																					}

																					if ($_SESSION['tipo_usuario']=='admin')
																					{
																		?>
																								<form <? echo "id='eliminar_asignacion_".$alumnos[$j][0]."'";?> action="asignacion.php" method="POST">
																									<input type="hidden" name='accion' value='delete_asignacion' >
																									<input type="hidden" name='id_cons' <? echo "value='".$alumnos[$j][0]."'"; ?> >
																								</form>
																				<?
																					}
																				?>
																						<form <? echo "id='ver_consejeria_".$alumnos[$j][0]."'";?> action="consejeria.php" method="POST">
																							<input type="hidden" name='accion' value='ver_consejeria' >
																							<input type="hidden" name='id_cons' <? echo "value='".$alumnos[$j][0]."'"; ?> >
																						</form>
																						
																						<tr <? echo "class='".$trclass."'"; ?> >
																							
																							<td><? echo $alumnos[$j][1]; ?></td>
																							<td><? echo $alumnos[$j][2]; ?></td>
																							<td><? echo $alumnos[$j][4]; ?></td>
																							<td>
																								<a href='#' <? echo "onclick='ver_consejeria_".$alumnos[$j][0].".submit(); return false'";?> ><i class="fa fa-eye"></i> Ver</a>
																								<?
																									if ($_SESSION['tipo_usuario']=='admin')
																									{
																								?>
																										<a href='#' <? echo "onclick='eliminar_asignacion_".$alumnos[$j][0].".submit(); return false'";?> ><i class="fa fa-eraser"></i> Eliminar</a>
																								<?
																									}
																								?>
																							</td>
																						</tr>
																						
																					<?
																			}
																		?>
																	</table>
															<?
																}
															?>


														</div>
													</div>
												</div>
											</div>
										</div>

								<?
									}
								?>


								<!-- </form> -->   

							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- /.container-fluid -->
			<br>
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
function crear_asignacion($id_tuto)
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

	$query="call nombre_periodo('".$_SESSION['id_peri']."')";
	$result=$conexion->query($query);
	$periodo=array();
	while($row = mysqli_fetch_row($result))
	{
		$periodo=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call nombre_tutor('".$id_tuto."')";
	$result=$conexion->query($query);
	$tutor=array();
	while($row = mysqli_fetch_row($result))
	{
		$tutor=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

?>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="container">
					<br>
					<br>
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
									<h4>Nueva Asignación: <? echo $tutor[0]; ?></h4>
									<h3>Periodo: <? echo $periodo[0]; ?></h3>
									<hr class="small">
								</div>
							</div>
							<div class="container">


								<form action='asignacion.php' method='post' id='formid_'>
									<input type="hidden" name='accion' value='create_asignacion' >
									<input type="hidden" name='id_tuto' <? echo "value='".$id_tuto."'"; ?> >

										<div class="row">
											<div class="col-sm-12">
												<div class='panel panel-info' >
													<div class="panel-heading">
														<h1 class="panel-title">Alumnos sin Tutor asignado</h1>
													</div>
													
														<div class="panel-body"> 
													
															<br>
															<br>

															<table class="responsive table table-striped table-bordered table-hover table-condensed">
																<tr class="info">
																	<th>Check</th>
																	<th>Código</th>
																	<th>Apellidos y Nombres</th>
																	<th>Nro Matricula Mayor</th>
																</tr>

																<?
																	$query="call estudiantes_no_asignados('".$_SESSION['id_peri']."')";
																	$result=$conexion->query($query);
																	$alumnos=array();
																	while($row = mysqli_fetch_row($result))
																	{
																		$alumnos[]=$row;
																	}
																	mysqli_free_result($result);
																	$conexion->next_result();

																	for ($j=0; $j<count($alumnos); $j++)
																	{ 
																			if($alumnos[$j][3]=='1')
																			{
																				$trclass='success';
																			}
																			elseif ($alumnos[$j][3]=='2')
																			{
																				$trclass='warning';
																			}
																			else
																			{
																				$trclass='danger';
																			}

																			
																?>
																				
																				

																				<tr <? echo "class='".$trclass."'"; ?> >
																					
																					<td>
																						<input type="hidden" name= <? echo "item[] "; ?> value=<? echo $alumnos[$j][0]; ?> >
																						<input type="checkbox" value="S" <? echo "name='respuesta[".$alumnos[$j][0]."]'"; ?> >
																					</td>
																					<td><? echo $alumnos[$j][1]; ?></td>
																					<td><? echo $alumnos[$j][2]; ?></td>
																					<td><? echo $alumnos[$j][3]; ?></td>

																				</tr>
																				
																			<?
																	}
																?>
															</table>
														</div>
													
												</div>
											</div>
										</div>

										<div class="row text-center">
											<div class="col-lg-4">
											</div>
											<div class="col-lg-4">
												<div class="service-box text-center">
													<input type="submit" class="btn btn-primary btn-block btn-md text-center" role="button" form='formid_'>
												</div>
											</div>
											<div class="col-lg-4">
											</div>
										</div>
										</form>
										<br>

							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- /.container-fluid -->
		<br>
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
	function create_asignacion($id_tuto,$item,$respuesta)
	{
		$query="";
		include("conexion.php");
		for ($i=0; $i < count($item); $i++)
		{ 
			if(key_exists($item[$i],$respuesta)==TRUE and $respuesta[$item[$i]]=='S')
			{
				$query.="call crear_asignacion('".$id_tuto."','".$item[$i]."');";
			}
		}
		$conexion->multi_query($query);
		$conexion->close();
	ver_asignaciones($id_cons);
	}
?>



<?
	function delete_asignacion($id_cons)
	{
		

		include("conexion.php");
		$query="call eliminar_asignacion('".$id_cons."')";
		$conexion->query($query);
		$conexion->close();
		ver_asignaciones($id_cons);
?>
		<script type='text/javascript'>
		alert ('Solo son eliminables las asignaciones que no tengan cuestionarios llenados. Verifique que la asginaciÃ³n halla sido eliminada.');
		</script>
<?
	}
?>


<?
	//accion=ver,editar,actualizar,imprimir
	//contexto=tutor,admin,alumno

	//ver,editar <-- si se puede combinar
	//crear <-- siempre separado
	//create,update,delete <-- acciones en la db

	//solo se podra: crear,editar

	//no existe contexto, solo se puede crear o editar por el alumno

	if(!isset($_POST['accion']))
	{
		if($_SESSION['tipo_usuario']=='estudiante')
		{
			header('Location: consejeria.php');
		}
		else
		{
			ver_asignaciones();
		}
		exit;
	}

	switch ($_POST['accion'])
	{
		case 'ver_asignaciones':
			ver_asignaciones();
			break;

		case 'crear_asignacion':
			crear_asignacion($_POST['id_tuto']);
			break;

		case 'create_asignacion':
			create_asignacion($_POST['id_tuto'],$_POST['item'],$_POST['respuesta']);
			break;

		 case 'delete_asignacion':
			delete_asignacion($_POST['id_cons']);
			break;

		/*case 'insert_meta':
			ver_meta($_POST['accion'],$_POST['contexto'],$_POST['id_meta']);
			break;*/

		default:
			ver_asignaciones();
			break;
	}
?>