<?
header('Content-Type: text/html; charset=ISO-8859-1');
include("frontend.php");

function ver_meta($accion,$id_matrmeta)
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
		case 'crear_meta':
			$query="call nombre_curso('".$id_matrmeta."')";
			echo $query;
			$result=$conexion->query($query);
			$meta=array();
			while($row = mysqli_fetch_row($result))
			{
				$meta=$row;
			}
			mysqli_free_result($result);
			$conexion->next_result();
			$conexion->close();
			$meta[1]='';
			$meta[2]='';
			$meta[3]='';
			$meta[4]='';
			$meta[5]='';
			$meta[6]='';
			break;

		case 'editar_meta':
			$query="call ver_meta('".$id_matrmeta."')";
			$result=$conexion->query($query);
			$meta=array();
			while($row = mysqli_fetch_row($result))
			{
				$meta=$row;
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
									<h3><? echo $meta[0] ?></h3>
									<hr class="small">  
								</div>
							</div>
							<div class="  container">
								<!--formulario simple-->

							<form action='meta.php' method='post' id='formid_'>
							
								<!--textos largos-->
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">Promedios</h3>
											</div>
											
												<div class="panel-body">

														<div class="col-sm-6" >

															<div class="form-group">
																<label for="fecha">Meta Promedio Final</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input id='metpro' class="form-control" name='metapromedio' type="number" <? echo "value='".$meta[1]."'"; ?> >
	                              </div>
															</div>

														</div>

														<div class="col-sm-6" >
															<div class="form-group">
																<label for="fecha">Promedio hasta el momento</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input id='promom' class="form-control" name='promediomomento' type="number" <? echo "value='".$meta[2]."'"; ?> >
	                              </div>
															</div>
														</div>

												</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">¿Estás en riesgo?</h3>
											</div>
											
												<div class="panel-body">

														<div class="col-sm-6" >

															<?
																$si="";
																$no="";
																if($meta[3]=="S")
																{
																	$si="checked";
																}
																elseif ($meta[3]=="N")
																{
																	$no="checked";
																}
															?>

															<div class="form-group">
																<label for="fecha">¿Estás en riesgo?</label>
												  			<div class="input-group"> 
	                               	<div class="radio">
															    	<label><input type="radio" value="S" name='riesgo' <? echo $si; ?> >Si</label>
															    </div>
															    <div class="radio">
															    	<label><input type="radio" value="N" name='riesgo' <? echo $no; ?> >No</label>
															    </div>	                              
    														</div>
															</div>

														</div>

														<div class="col-sm-6" >

														</div>

												</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title">Acciones</h3>
											</div>
											
												<div class="panel-body">

														<div class="col-sm-6" >

															<div class="form-group">
																<label for="fecha">¿Qué hice?</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input class="form-control" name='hice' type="text" <? echo "value='".$meta[4]."'"; ?> >
	                              </div>
															</div>

														

															<div class="form-group">
																<label for="fecha">¿Qué no debo hacer?</label>
													  		<div class="input-group"> 
		                              <span class="input-group-addon"><span class=""></span></span>
		                           		<input class="form-control" name='nodebohacer' type="text" <? echo "value='".$meta[5]."'"; ?> >
		                            </div>
															</div>
														</div>


														<div class="col-sm-6" >

															<div class="form-group">
																<label for="fecha">¿Qué debo hacer?</label>
												  			<div class="input-group"> 
	                               	<span class="input-group-addon"><span class=""></span></span>
	                               	<input class="form-control" name='debohacer' type="text" <? echo "value='".$meta[6]."'"; ?> >
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
									case 'editar_meta':
										?>
										<input type="hidden" name='id_meta' value=<? echo $id_matrmeta; ?> >
										<input type="hidden" name='accion' value='update_meta' >
										<hr>
										<center>
										<input type="submit" value='Guardar' class="btn btn-primary btn-md text-center" role="button">
										</center>

										<? 
										break;

									case 'crear_meta':
										?>
										<input type="hidden" name='id_matr' value=<? echo $id_matrmeta; ?> >
										<input type="hidden" name='accion' value='create_meta' >
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
								<!-- 
								

									<div class="col-lg-4 col-md-6 ">
										<div class="service-box text-center">
											<a href="" class="btn btn-primary btn-block btn-md text-center" role="button"> <h4>Guardar</h4></a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 ">
									</div>

									
									<div class="col-lg-4 col-md-6 ">
										<div class="service-box text-center">
											<input type="submit" class="btn btn-primary btn-block btn-md text-center" role="button">
										</div>
									</div>  

								
								-->

								<? 
										
								?>



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
      	metapromedio : { required: true},
      	promediomomento : { required: true},
      	riesgo : { required: true},
      	hice : { required: true},
      	nodebohacer : { required: true},
      	debohacer : { required: true}
      },
      messages:
      {
      	metapromedio: "<font color='red'>Campo requerido</font>",
        promediomomento: "<font color='red'>Campo requerido</font>",
        riesgo : "<font color='red'>Campo Requerido</font>",
        hice : "<font color='red'>Campo requerido</font>",
        nodebohacer : "<font color='red'>Campo requerido</font>",
        debohacer : "<font color='red'>Campo requerido</font>"
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

	navegacion($_SESSION['id_usuario'],$_SESSION['tipo_usuario']);

	$query="call listar_tutores_periodo('".$_SESSION['id_peri']."')";
	$result=$conexion->query($query);
	$tutores=array();
	while($row = mysqli_fetch_row($result))
	{
		$tutores[]=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

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
														<h1 class="panel-title"><a data-toggle="collapse" <? echo "data-target='#collapse_".$tutores[$i][0]."'"; ?> <? echo "href='#collapse_2_".$tutores[$i][0]."'"; ?>><? echo $tutores[$i][1]." :: Estudiantes Asignados: ".$tutores[$i][2].", Reuniones Grupales Realizadas ".$tutores[$i][3]; ?></a></h1>
													</div>
														<div <? echo "id='collapse_".$tutores[$i][0]."'"; ?> class="panel-collapse collapse"> <!-- in -->
														<div class="panel-body"> 

															<?
																if ($_SESSION['tipo_usuario']=='admin')
																{
															?>
																	<a href='#' <? echo "onclick='crear_asignacion_".$tutores[$i][0].".submit(); return false'";?> ><i class="fa fa-plus"></i> Añadir meta</a>
															<?
																}
															?>
															
															<br>

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
																								<form <? echo "id='editar_asignacion_".$alumnos[$j][0]."'";?> action="asignacion.php" method="POST">
																									<input type="hidden" name='accion' value='editar_asignacion' >
																									<input type="hidden" name='id_cons' <? echo "value='".$alumnos[$j][0]."'"; ?> >
																								</form>

																								<form <? echo "id='editar_asignacion_".$alumnos[$j][0]."'";?> action="asignacion.php" method="POST">
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
																										<a href='#' <? echo "onclick='editar_asignacion_".$alumnos[$j][0].".submit(); return false'";?> ><i class="fa fa-pencil"></i> Editar</a>
																										<a href='#' <? echo "onclick='editar_asignacion_".$alumnos[$j][0].".submit(); return false'";?> ><i class="fa fa-eraser"></i> Eliminar</a>
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
	function create_meta($id_matr,$metapromedio,$promediomomento,$riesgo,$hice,$nodebohacer,$debohacer)
	{
		include("conexion.php");
		$query="call crear_meta('".$metapromedio."','".$promediomomento."','".$riesgo."','".$hice."','".$nodebohacer."','".$debohacer."','".$id_matr."','".date("y-m-d")."')";
		$conexion->query($query);
		$conexion->close();
	}
?>

<?
	function update_meta($id_meta,$metapromedio,$promediomomento,$riesgo,$hice,$nodebohacer,$debohacer)
	{
		include("conexion.php");
		$query="call editar_meta('".$metapromedio."','".$promediomomento."','".$riesgo."','".$hice."','".$nodebohacer."','".$debohacer."','".$id_meta."')";
		$conexion->query($query);
		$conexion->close();
	}
?>

<?
	function delete_meta($id_meta,$id_cons)
	{
		include("conexion.php");
		$query="call eliminar_meta('".$id_meta."')";
		$conexion->query($query);
		$conexion->close();
		ver_metas($id_cons);
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
	$_SESSION['tipo_usuario']='estudiante';
	$_SESSION['id_peri']=1;

	switch ($_POST['accion'])
  {
    case 'ver_asignaciones':
      ver_asignaciones();
      break;

    case 'crear_meta':
      ver_meta($_POST['accion'],$_POST['id_matr']);
      break;

    case 'editar_meta':
      ver_meta($_POST['accion'],$_POST['id_meta']);
      break;

    case 'create_meta':
      create_meta($_POST['id_matr'],$_POST['metapromedio'],$_POST['promediomomento'],$_POST['riesgo'],$_POST['hice'],$_POST['nodebohacer'],$_POST['debohacer']);
      break;

    case 'update_meta':
      update_meta($_POST['id_meta'],$_POST['metapromedio'],$_POST['promediomomento'],$_POST['riesgo'],$_POST['hice'],$_POST['nodebohacer'],$_POST['debohacer']);
      break;

     case 'delete_meta':
      delete_meta($_POST['id_meta'],$_POST['id_cons']);
      break;

    /*case 'insert_meta':
      ver_meta($_POST['accion'],$_POST['contexto'],$_POST['id_meta']);
      break;*/

    default:
      ver_asignaciones();
      break;
  }
?>