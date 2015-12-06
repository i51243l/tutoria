<?
header('Content-Type: text/html; charset=ISO-8859-1');
include("frontend.php");

function ver_reserva($accion,$id_consrese,$modalidad,$id_cons)
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
	navegacion($_SESSION['id_usuario'],$_SESSION['tipo_usuario']);
	
	switch ($accion)
	{
		case 'crear_reserva':
			$reserva[0]='';
			$reserva[1]='';
			$reserva[2]='';
			break;

		case 'editar_reserva':
			$query="call ver_reserva('".$id_consrese."')";
			$result=$conexion->query($query);
			$reserva=array();
			while($row = mysqli_fetch_row($result))
			{
				$reserva=$row;
			}
			mysqli_free_result($result);
			$conexion->next_result();
			$conexion->close();
			break;
	}
?>

		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="container">
					<br>
					<br>
					<div class="row">
						<div class=" modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl">
									</div>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-lg-10 col-lg-offset-1">
									<h3>Nueva Reserva</h3>
									<hr class="small">  
								</div>
							</div>
							<div class="  container">
								<!--formulario simple-->

							<form action='reserva.php' method='post' id='formid_'>
							
								<!--textos largos-->
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">Fecha y Hora</h3>
											</div>
												<div class="panel-body">
														
														<div class="col-sm-6" >
															<div class="form-group">
																<label for="fecha">Fecha</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input class="form-control" name='fecha' type="date" <? echo "value='".$reserva[0]."'"; ?> >
	                              </div>
															</div>
														</div>

														<div class="col-sm-6" >

															<div class="form-group">
																<label for="fecha">Hora de Inicio</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input class="form-control" name='horainicio' type="time" <? echo "value='".$reserva[1]."'"; ?> >
	                              </div>
															</div>

															<div class="form-group">
																<label for="fecha">Hora de Fin</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input class="form-control" name='horafin' type="time" <? echo "value='".$reserva[2]."'"; ?> >
	                              </div>
															</div>

														</div>

												</div>
										</div>
									</div>
								</div>

							<div class="row text-center">

							<?
								switch ($accion)
								{
									case 'editar_reserva':
										?>
										<input type="hidden" name='id_rese' value=<? echo $id_consrese; ?> >
										<input type="hidden" name='accion' value='update_reserva' >
										<input type="hidden" name='id_cons' value=<? echo $id_cons; ?> >
										<hr>
										<center>
										<input type="submit" value='Guardar' class="btn btn-primary btn-md text-center" role="button">
										</center>
										<? 
										break;

									case 'crear_reserva':
										?>
										<input type="hidden" name='id_cons' value=<? echo $id_consrese; ?> >
										<input type="hidden" name='modalidad' value=<? echo $modalidad; ?> >
										<input type="hidden" name='accion' value='create_reserva' >
										<hr>
										<center>
										<input type="submit" value='Crear' class="btn btn-primary btn-md text-center" role="button">
										</center>
										<? 
										break;
									
									default:
										# code...
										break;
								}
							?>

							</div>

								<br> 

								</form>   

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
	<script src="js/jquery.validate.js"></script>

	<script type="text/javascript">
	$(document).ready(function()
	{
    $("#formid_").validate
    ({
      rules:
      {
      	fecha : { required: true},
      	horainicio : { required: true},
      	horafin : { required: true},
      	asunto : { required: true},
      	motivo : { required: true}
      },
      messages:
      {
      	fecha: "<font color='red'>Campo requerido</font>",
        horainicio: "<font color='red'>Campo requerido</font>",
        horafin : "<font color='red'>Campo Requerido</font>",
        asunto : "<font color='red'>Campo requerido</font>",
        motivo : "<font color='red'>Campo requerido</font>"
      },
      errorPlacement: function(error, element)
      {
          error.appendTo(element.parents('.form-group'));
      }
    });
	});
	</script>

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
function ver_reservas()
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

	navegacion($_SESSION['id_usuario'],$_SESSION['tipo_usuario']);

	if ($_SESSION['tipo_usuario']=='estudiante')
	{
		$query="call ver_reservas_estudiante('".$id_cons."')";
		$result=$conexion->query($query);
		$reunioni=array();
		while($row = mysqli_fetch_row($result))
		{
			$reunioni[]=$row;
		}
		mysqli_free_result($result);
		$conexion->next_result();
	}
	if ($_SESSION['tipo_usuario']=='docente')
	{
		$query="call ver_reservas_docente('".$id_cons."')";
		$result=$conexion->query($query);
		$reunioni=array();
		while($row = mysqli_fetch_row($result))
		{
			$reunioni[]=$row;
		}
		mysqli_free_result($result);
		$conexion->next_result();
	}

	$query="call ver_individual_reuniones('".$id_cons."')";
	$result=$conexion->query($query);
	$reunioni=array();
	while($row = mysqli_fetch_row($result))
	{
		$reunioni[]=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call ver_grupal_reuniones('".$id_cons."')";
	$result=$conexion->query($query);
	$reuniong=array();
	while($row = mysqli_fetch_row($result))
	{
		$reuniong[]=$row;
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
            	<h1 class="page-header">Reserva de Reuniones <small>Sistema de tutoría</small>
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
									<h3>Registro de la Consejería - Tutoría Académica</h3>
									<hr class="small">
								</div>
							</div>

							<div class="col-sm-6" >
								<div class="form-group">
									<label for="fecha">Facultad:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" value='Ingeniería' readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="fecha">Estudiante:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" <? echo "value='".$cabecera[2]."'"; ?>  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="fecha">Docente:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" <? echo "value='".$cabecera[4]."'"; ?>  readonly>
									</div>
								</div>
							</div>
							<div class="col-sm-6" >
								<div class="form-group">
									<label for="fecha">Escuela:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" value='Ingeniería en Informática y Sistemas' readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="fecha">Código:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" <? echo "value='".$cabecera[3]."'"; ?>  readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="fecha">Semestre:</label>
									<div class="input-group"> 
										<span class="input-group-addon"><span class=""></span></span>
										<input class="form-control" type="text" <? echo "value='".$cabecera[5]."'"; ?>  readonly>
									</div>
								</div>
							</div>

							<div class="container">

										<form <? echo "id='crear_reunion_individual'";?> action="reunion.php" method="POST">
											<input type="hidden" name='accion' value='crear_reunion' >
											<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'";?> >
											<input type="hidden" name='modalidad' value='I' >
										</form>
										<form <? echo "id='crear_reunion_grupal'";?> action="reunion.php" method="POST">
											<input type="hidden" name='accion' value='crear_reunion' >
											<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'";?> >
											<input type="hidden" name='modalidad' value='G' >
										</form>
										<div class="row" id="collapse_asistidos_2">
											<div class='col-sm-12'>
												<div class='panel panel-info'>
													<div class="panel-heading">
														<h1 class="panel-title"><a data-toggle="collapse" data-target='#collapse_reunion_individual' href='#collapse_asistidos_2'>Reuniones Individuales</a></h1>
													</div>
														<div id='collapse_reunion_individual' class="panel-collapse collapse in"> <!-- in -->
														<div class="panel-body"> 
															<?
																if ($_SESSION['tipo_usuario']=='docente')
																{
															?>
																	<a href='#' onclick='crear_reunion_individual.submit(); return false'><i class="fa fa-plus"></i> Crear Reunión Individual</a>
															<?
																}
															?>
																	<br>
																	<?
																		if(count($reunioni)>0)
																		{
																	?>
																			<br>
																			<table class="responsive table table-striped table-bordered table-hover table-condensed">
																				<tr class="info">
																					<th>Fecha y Hora</th>
																					<th>Motivo</th>
																					<th>Asunto</th>
																					<?
																						if ($_SESSION['tipo_usuario']=='docente')
																						{
																					?>
																							<th>Acciones</th>
																					<?
																						}
																					?>
																				</tr>



																				<?
																					for ($i=0; $i<count($reunioni); $i++)
																					{
																				?>
																						<?
																							if ($_SESSION['tipo_usuario']=='docente')
																							{
																						?>
																								<form <? echo "id='editar_reunioni_".$reunioni[$i][0]."'";?> action="reunion.php" method="POST">
																									<input type="hidden" name='accion' value='editar_reunion' >
																									<input type="hidden" name='id_reun' <? echo "value='".$reunioni[$i][0]."'"; ?> >
																									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																								</form>

																								<form <? echo "id='delete_reunioni_".$reunioni[$i][0]."'";?> action="reunion.php" method="POST">
																									<input type="hidden" name='accion' value='delete_reunion' >
																									<input type="hidden" name='id_reun' <? echo "value='".$reunioni[$i][0]."'"; ?> >
																									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																								</form>
																						<?
																							}
																						?>
																							<tr class='success'>

																								<td><? echo $reunioni[$i][1]; ?></td>
																								<td><? echo $reunioni[$i][2]; ?></td>
																								<td><? echo $reunioni[$i][3]; ?></td>
																								<?
																									if ($_SESSION['tipo_usuario']=='docente')
																									{
																								?>
																										<td>
																											<a href='#' <? echo "onclick='editar_reunioni_".$reunioni[$i][0].".submit(); return false'";?> ><i class="fa fa-pencil"></i> Editar</a>
																											<a href='#' <? echo "onclick='delete_reunioni_".$reunioni[$i][0].".submit(); return false'";?> ><i class="fa fa-eraser"></i> Eliminar</a>
																										</td>
																								<?
																									}
																								?>

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

										<div class="row" id="collapse_asistidos_4">
											<div class='col-sm-12'>
												<div class='panel panel-info'>
													<div class="panel-heading">
														<h1 class="panel-title"><a data-toggle="collapse" data-target='#collapse_reunion_grupal' href='#collapse_asistidos_4'>Reuniones Grupales</a></h1>
													</div>
														<div id='collapse_reunion_grupal' class="panel-collapse collapse in"> <!-- in -->
														<div class="panel-body"> 
																	<?
																		if ($_SESSION['tipo_usuario']=='docente')
																		{
																	?>
																			<a href='#' onclick='crear_reunion_grupal.submit(); return false'><i class="fa fa-plus"></i> Crear Reunión Grupal</a>
																	<?
																		}
																	?>

																	<br>
																	<?
																		if(count($reuniong)>0)
																		{
																	?>
																			<br>
																			<table class="responsive table table-striped table-bordered table-hover table-condensed">
																				<tr class="info">
																					<th>Fecha y Hora</th>
																					<th>Motivo</th>
																					<th>Asunto</th>
																					<?
																						if ($_SESSION['tipo_usuario']=='docente')
																						{
																					?>
																							<th>Acciones</th>
																					<?
																						}
																					?>
																				</tr>

																				<?
																					for ($i=0; $i<count($reuniong); $i++)
																					{
																				?>
																						<?
																							if ($_SESSION['tipo_usuario']=='docente')
																							{
																						?>
																								<form <? echo "id='editar_reuniong_".$reuniong[$i][0]."'";?> action="reunion.php" method="POST">
																									<input type="hidden" name='accion' value='editar_reunion' >
																									<input type="hidden" name='id_reun' <? echo "value='".$reuniong[$i][0]."'"; ?> >
																									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																								</form>

																								<form <? echo "id='delete_reuniong_".$reuniong[$i][0]."'";?> action="reunion.php" method="POST">
																									<input type="hidden" name='accion' value='delete_reunion' >
																									<input type="hidden" name='id_reun' <? echo "value='".$reuniong[$i][0]."'"; ?> >
																									<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
																								</form>
																						<?
																							}
																						?>


																						<tr class='warning'>

																							<td><? echo $reuniong[$i][1]; ?></td>
																							<td><? echo $reuniong[$i][2]; ?></td>
																							<td><? echo $reuniong[$i][3]; ?></td>
																							<?
																								if ($_SESSION['tipo_usuario']=='docente')
																								{
																							?>
																									<td>
																										<a href='#' <? echo "onclick='editar_reuniong_".$reuniong[$i][0].".submit(); return false'";?> ><i class="fa fa-pencil"></i> Editar</a>
																										<a href='#' <? echo "onclick='delete_reuniong_".$reuniong[$i][0].".submit(); return false'";?> ><i class="fa fa-eraser"></i> Eliminar</a>
																									</td>
																							<?
																								}
																							?>

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

										<div class="text-right">
											<p>Tacna, <? echo date('d'); ?> de <? mes(date('F')); ?> de <? echo date('Y'); ?></p>
										</div>
										<br>


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

	function create_reserva($id_cons,$fecha,$horainicio,$horafin,$modalidad)
	{
		include("conexion.php");
		$query="";
		if ($modalidad=='I')
		{
			$query="call crear_individual_reserva('".$fecha."','".$horainicio."','".$horafin."','".$id_cons."')";
		}
		elseif ($modalidad=='G')
		{
			$query="call crear_grupal_reserva('".$fecha."','".$horainicio."','".$horafin."','".$id_cons."')";
		}
		echo $query;
		$conexion->query($query);
		$conexion->close();
		ver_reuniones($id_cons);
	}
?>

<?
	function update_reserva($id_rese,$fecha,$horainicio,$horafin,$id_cons)
	{
		include("conexion.php");
		$query="call editar_reserva('".$id_rese."','".$fecha."','".$horainicio."','".$horafin."')";
		$conexion->query($query);
		$conexion->close();
		ver_reuniones($id_cons);
	}
?>

<?
	function delete_reunion($id_rese,$id_cons)
	{
		include("conexion.php");
		$query="call eliminar_reunion('".$id_rese."')";
		$conexion->query($query);
		$conexion->close();
		ver_reuniones($id_cons);
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

	$_SESSION['id_usuario']=10;
	$_SESSION['id_peri']=1;
	$_SESSION['tipo_usuario']='estudiante';

	switch ($_POST['accion'])
  {
    case 'ver_reservas':
      ver_reuniones($_POST['id_cons']);
      break;

    case 'crear_reserva':
      ver_reserva($_POST['accion'],$_POST['id_cons'],$_POST['modalidad'],$_POST['id_cons']);
      break;

    case 'editar_reserva':
      ver_reserva($_POST['accion'],$_POST['id_rese'],1,$_POST['id_cons']);
      break;

    case 'create_reserva':
      create_reserva($_POST['id_cons'],$_POST['fecha'],$_POST['horainicio'],$_POST['horafin'],$_POST['modalidad']);
      break;

    case 'update_reserva':
      update_reserva($_POST['id_rese'],$_POST['fecha'],$_POST['horainicio'],$_POST['horafin'],$_POST['id_cons']);
      break;

     case 'delete_reserva':
      delete_reunion($_POST['id_rese'],$_POST['id_cons']);
      break;

    default:
      ver_reserva('editar_reserva',12,'I',1);
      break;
  }
?>