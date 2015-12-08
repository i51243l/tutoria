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

function ver_cuestionario($accion,$id_cons,$id_cues)
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

	$query="call ver_cuestionario('".$id_cues."')";
	$result=$conexion->query($query);
	$cuestionario=array();
	while($row = mysqli_fetch_row($result))
	{
		$cuestionario=$row;
	}
	mysqli_free_result($result);
	$conexion->next_result();

	$query="call cabecera_cuestionario('".$id_cons."')";
	$result=$conexion->query($query);
	$cabecera=array();
	while($row = mysqli_fetch_row($result))
	{
		$cabecera=$row;
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
						<div class=" modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl">
									</div>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-lg-10 col-lg-offset-1">
									<h3><? echo $cuestionario[0] ?></h3>
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
								
							<? echo $cuestionario[1] ?>

							<div class="  container">
								<!--formulario simple-->

							<form action='consejeria.php' method='post' id='editar'>

							<?
								$query="call ver_secciones('".$id_cues."')";
								$result=$conexion->query($query);
								$secciones=array();
								while($row = mysqli_fetch_row($result))
								{
									$secciones[]=$row;
								}
								mysqli_free_result($result);
								$conexion->next_result();
								for($i=0;$i<count($secciones);$i++)
								{
							?>

								<!--textos largos-->
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-info">
											<div class="panel-heading">
												<h3 class="panel-title"><? echo $secciones[$i][1] ?></h3>
											</div>
											
												<div class="panel-body">
													
													<?
														$query="call ver_items('".$id_cons."','".$secciones[$i][0]."')";
														$result=$conexion->query($query);
														$items=array();
														while($row = mysqli_fetch_row($result))
														{
															$items[]=$row;
														}
														mysqli_free_result($result);
														$conexion->next_result();
													?>
														<div class="col-sm-6" >
													<?
														for($j=0;$j<count($items);$j=$j+2)
														{

													?>

														<div class="form-group">
															<label for="fecha"> <? echo $items[$j][1] ?>:</label>
														  <?
														  	switch ($accion)
														  	{
														  		case 'ver_cuestionario':
														  			?>
														  				<div class="input-group"> 
                                      	<span class="input-group-addon"><span class=""></span></span>
                                      	<input class="form-control" type="text" <? echo "value='".$items[$j][3]."''"; ?> readonly>
                                      </div>
														  			<?
														  			break;
														  		case 'editar_cuestionario':
														  			item($items[$j][0],$items[$j][2],$items[$j][3]);
														  			break;
														  		
														  		default:
														  			# code...
														  			break;
														  	}
														  ?>
														</div>

													<? 
														}
													?>
														</div>
														<div class="col-sm-6" >
														<?
															for($j=1;$j<count($items);$j=$j+2)
															{
														?>
														
														<div class="form-group">
															<label for="fecha"> <? echo $items[$j][1] ?>:</label>
														  <?
														  	switch ($accion)
														  	{
														  		case 'ver_cuestionario':
														  			?>
														  				<div class="input-group"> 
                                      	<span class="input-group-addon"><span class=""></span></span>
                                      	<input class="form-control" type="text" <? echo "value='".$items[$j][3]."''"; ?> readonly>
                                      </div>
														  			<?
														  			break;
														  		case 'editar_cuestionario':
														  			item($items[$j][0],$items[$j][2],$items[$j][3]);
														  			break;
														  		
														  		default:
														  			# code...
														  			break;
														  	}
														  ?>
														</div>

													<? } ?>

													</div>
												</div>
										</div>
									</div>
								</div>

							<? 
								}
								$conexion->close();
							?>

							<div class="text-right">
								<p>Tacna, <? echo date('d'); ?> de <? mes(date('F')); ?> de <? echo date('Y'); ?></p>
							</div>


							<div class="row text-center">

							<? 
								switch ($accion)
								{
									case 'editar_cuestionario':
							?>
										<input type="hidden" name='id_cons' value=<? echo $id_cons; ?> >
										<input type="hidden" name='accion' value='update_cuestionario' >

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
		echo $query;
		$conexion->multi_query($query);
		$conexion->close();
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
		header('Location: inicio.php');
		exit;
	}

	switch ($_POST['accion'])
  {
    case 'ver_cuestionario':
      ver_cuestionario($_POST['accion'],$_POST['id_cons'],$_POST['id_cues']);
      break;

     case 'editar_cuestionario':
      ver_cuestionario($_POST['accion'],$_POST['id_cons'],$_POST['id_cues']);
      break;

    case 'update_cuestionario':
      update_cuestionario($_POST['id_cons'],$_POST['item'],$_POST['respuesta']);
      break;

    default:
      break;
  }
?>