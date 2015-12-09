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

function ver_informe($accion,$id_tuto,$id_cons)
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

	$query="call cabecera_informe('".$id_tuto."')";
	$result=$conexion->query($query);
	$cabecera=array();
	while($row = mysqli_fetch_row($result))
	{
		$cabecera=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call ver_asistidos_informe('".$id_tuto."')";
	$result=$conexion->query($query);
	$asistidos=array();
	while($row = mysqli_fetch_row($result))
	{
		$asistidos[]=$row;
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
            	
          		<form id='volver' action="consejeria.php" method="POST">
								<input type="hidden" name='accion' value='ver_consejeria' >
								<input type="hidden" name='id_cons' <? echo "value='".$id_cons."'"; ?> >
							</form>
	          	<h1 class="page-header"><a href='#' onclick='volver.submit(); return false'><i class="fa fa-chevron-circle-left "></i></a> Informe Semestral <small>Sistema de tutoría</small>
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
									<h3>Informe Semestral de Labor de Consejería - Tutoría Académica</h3>
									<hr class="small">
								</div>
							</div>

							<div class="col-sm-6" >
								<div class="form-group">
									<label for="fecha">Facultad:</label>
									Ingeniería
								</div>
								<div class="form-group">
									<label for="fecha">Docente:</label>
									<? echo $cabecera[0] ?>
								</div>
							</div>
							<div class="col-sm-6" >
								<div class="form-group">
									<label for="fecha">Escuela:</label>
									Ingeniería en Informática y Sistemas
								</div>
								<div class="form-group">
									<label for="fecha">Semestre:</label>
									<? echo $cabecera[1] ?>
								</div>
							</div>

							<div class="container">

										<?
											if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
											{
										?>
												<form id='editar_asistidos' action="consejeria.php" method="POST">
													<input type="hidden" name='consejeria' value=<? echo $id_cons; ?> >
										<?
											}
										?>

										<div class="row" id="collapse_asistidos_2">
											<div class='col-sm-12'>
												<div class='panel panel-info'>
													<div class="panel-heading">
														<h1 class="panel-title"><a data-toggle="collapse" data-target='#collapse_asistidos' href='#collapse_asistidos_2'>Estudiantes Asistidos</a></h1>
													</div>
														<div id='collapse_asistidos' class="panel-collapse collapse in"> <!-- in -->
														<div class="panel-body"> 
																	<br>

																	<table class="responsive table table-striped table-bordered table-hover table-condensed">
																		<tr class="info">
																			<th>Código</th>
																			<th>Nombre del Estudiante</th>
																			<th>Tema</th>
																			<th>Situación Académica</th>
																		</tr>

																		<?
																			for ($i=0; $i<count($asistidos); $i++)
																			{
																		?>

																				<?
																					if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
																					{
																				?>
																						<input type="hidden" name= <? echo "id_cons[] "; ?> value=<? echo $asistidos[$i][0]; ?> >
																				<?
																					}
																				?>

																						<tr>

																							<td><? echo $asistidos[$i][2]; ?></td>
																							<td><? echo $asistidos[$i][3]; ?></td>
																							<td>
																								<?
																									if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
																									{
																								?>
																										<input class="form-control" type="text" <? echo "name='tema[".$asistidos[$i][0]."]'"; ?> <? echo "value='".$asistidos[$i][4]."'"; ?> >
																								<?
																									}
																									else
																									{
																								?>
																										<? echo $asistidos[$i][4]; ?>
																								<?
																									}
																								?>
																							</td>

																							<td>
																								<?
																									if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
																									{
																								?>
																										<input class="form-control" type="text" <? echo "name='situacion[".$asistidos[$i][0]."]'"; ?> <? echo "value='".$asistidos[$i][5]."'"; ?> >
																								<?
																									}
																									else
																									{
																								?>
																										<? echo $asistidos[$i][5]; ?>
																								<?
																									}
																								?>
																							</td>

																						</tr>
																						
																		<?
																			}
																		?>
																	</table>
															
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row" id="collapse_asistidos_4">
											<div class='col-sm-12'>
												<div class='panel panel-info'>
													<div class="panel-heading">
														<h1 class="panel-title"><a data-toggle="collapse" data-target='#collapse_asistidos_3' href='#collapse_asistidos_4'>Estudiantes Asistidos</a></h1>
													</div>
														<div id='collapse_asistidos_3' class="panel-collapse collapse in"> <!-- in -->
														<div class="panel-body"> 
															<br>

															<?
																$modificable='readonly';
																if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
																{
																	$modificable='';
																}
															?>

															<div class="col-sm-6" >
																<div class="form-group">
																	<label for="fecha">Motivos comunes de visita al Docente Consejero - Tutor:</label>
												  				<div class="input-group"> 
                                   	<span class="input-group-addon"><span class=""></span></span>
                                   	<input class="form-control" name='motivos' type="text" <? echo "value='".$cabecera[2]."'"; ?> <? echo $modificable; ?> >
																	</div>
																</div>
																<div class="form-group">
																	<label for="fecha">Los estudiantes tutorados fueron derivados mayormente a:</label>
												  				<div class="input-group"> 
                                   	<span class="input-group-addon"><span class=""></span></span>
                                   	<textarea class="form-control" name='derivados' <? echo $modificable; ?>  ><? echo $cabecera[4]; ?> </textarea>
																	</div>
																</div>
															</div>

															<div class="col-sm-6" >
																<div class="form-group">
																	<label for="fecha">Principales obstáculos encontrados para orientar adecuadamente:</label>
												  				<div class="input-group"> 
                                   	<span class="input-group-addon"><span class=""></span></span>
                                   	<input class="form-control" name='obstaculos' type="text" <? echo "value='".$cabecera[3]."'"; ?> <? echo $modificable; ?> >
																	</div>
																</div>
															</div>
															
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="text-right">
											<p>Tacna, <? echo date('d'); ?> de <? mes(date('F')); ?> de <? echo date('Y'); ?></p>
										</div>


										<div class="row text-center">

										<? 
											switch ($accion)
											{
												case 'editar_informe':
										?>
													<div class="col-lg-4">
													</div>

													<div class="col-lg-4">
														<div class="service-box text-center">
															<input type="submit" class="btn btn-primary btn-block btn-md text-center" role="button">
														</div>
													</div>

													<div class="col-lg-4">
													</div>

													<? 
													break;
												
												case 'ver_informe':
												?>
													<div class="col-lg-4">
													</div>

													<div class="col-lg-4">
														<div class="service-box text-center">
															<input name="Imprimir" class="btn btn-primary btn-block btn-md text-center" id="imprimir" onclick="DescargarPDF('page-wrapper','informe')" value="DescargarPDF">
														</div>
													</div>

													<div class="col-lg-4">
													</div>
												<?

												default:
													# code...
													break;
											}
										?>

										</div>
										<br>



										<?
											if ($_SESSION['tipo_usuario']=='docente' and $accion=='editar_informe')
											{
										?>
													<input type="hidden" name='accion' value='update_informe' >
													<input type="hidden" name='id_tuto' <? echo "value='".$id_tuto."'"; ?> >
												</form>
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

		</div>
		<!-- /#page-wrapper -->


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<script src="js/jspdf.debug.js"></script>
  <script>
  	function DescargarPDF(ContenidoID,nombre){
    var pdf = new jsPDF('p','pt','letter');
    html = $('#'+ContenidoID).html();
    specialElementHandlers = {};
    margins = {top: 10, bottom: 20, left: 20, width:522};
    pdf.fromHTML(html, margins.left, margins.top, {'width': margins.width},function(dispose) {pdf.save(nombre+'.pdf')},margins);
    }
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
	/*function update_informe($accion,$id_cons,$tema,$situacion,$motivos,$derivados,$obstaculos,$id_tuto)
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
		echo $query;
		$conexion->multi_query($query);
		$conexion->close();
	}*/
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
		header('Location: inicio.php');
		exit;
	}

	switch ($_POST['accion'])
  {
    case 'ver_informe':
      ver_informe($_POST['accion'],$_POST['id_tuto'],$_POST['id_cons']);
      break;

    case 'editar_informe':
      ver_informe($_POST['accion'],$_POST['id_tuto'],$_POST['id_cons']);
      break;

    /*case 'update_informe':
      update_informe($_POST['accion'],$_POST['id_cons'],$_POST['tema'],$_POST['situacion'],$_POST['motivos'],$_POST['derivados'],$_POST['obstaculos'],$_POST['id_tuto']);
      break;*/

    /*case 'insert_meta':
      ver_meta($_POST['accion'],$_POST['contexto'],$_POST['id_meta']);
      break;*/

    default:
      break;
  }
?>