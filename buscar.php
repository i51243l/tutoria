<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Gestión de la Información Externa</title>

    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
   <div id="wrapper">
      <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand text-center" href="index.php"> GESIEX - Gestión de la Información Externa 08/05 2018</a>
         </div>
         
         <ul class="nav navbar-nav navbar-center">
            <li class="hidden">
               <a href="#page-top"></a>
            </li>    
            <li>
               <a class="page-scroll" href="index.php"><i class="fa fa-fw fa-home"></i> Home</a>
            </li>
            <li class="">
               <a href="index.php" class="page-scroll" >Noticias ADUANA </a>          
            </li>
            <li class="">
               <a href="index2.php" class="page-scroll">Noticias SUNAT</a>      
            </li>
         </ul>   
         
         <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
               </a>
               
               <ul class="dropdown-menu dropdown-user">
                   <li><a href="#"><i class="fa fa-user fa-fw"></i>admin</a>
                  </li>   
                  <li><a href="../../login.php"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesión</a>
                  </li>
               </ul>
            </li>
         </ul>

         <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
               <ul class="nav" id="side-menu">
                  <li class="sidebar-search">
                     <div class="input-group custom-search-form">
                        <img  class="img-responsive text-center" src="img/logoblanco.png" width="110" height="100" alt="">
                        <h5>Intendencia de Aduana de Tacna</h5>
                     </div>
                  </li>
                   <li>
                     <a class="navbar-default" href="ingresar.php"><i class="fa fa-edit fa-fw"></i> Agregar Noticia</a>
                  </li>
		  <li>
                     <a class="navbar-default" href="noticias.php"><i class="fa fa-list fa-fw"></i> Ver Noticias</a>
                  </li>
                  <li>
                     <a class="navbar-default" href="buscar.php"><i class="fa fa-search fa-fw"></i> Buscar Noticias</a>
                  </li>
                  <li>
                     <a class="navbar-default" href="infractor.php"><i class="fa fa-users fa-fw"></i> Infractores <span class="fa arrow"></span></a>    
                     <ul class="nav nav-second-level">
                        <li>
                           <a class="navbar-default" href="inf_del.php">Por Delito</a>
                        </li>
                        <li>
                           <a class="navbar-default" href="inf_lugar.php">Por Lugar</a>
                        </li>
                     </ul>
                  </li>
                  <!--<li>
                     <a class="navbar-default" href="programacion.php"><i class="fa fa-calendar fa-fw"></i> Programación Trimestral </a>       
                  </li> -->
                  <li>
                     <a class="navbar-default" href="diarios.php"><i class="fa fa-newspaper-o fa-fw"></i> Diarios de interés <span class="fa arrow"></span></a>    
                     <ul class="nav nav-second-level">
                        <li>
                           <a class="navbar-default" href="https://diariocorreo.pe/edicion/tacna/?ref=menu_edi" target="blank">Correo</a>
                        </li>
                        <li>
                           <a class="navbar-default" href="http://www.diariosinfronteras.pe/category/diariosf/tacna/" target="blank">Sin Fronteras</a>
                        </li>
                        <li>
                        <a class="navbar-default" href="https://larepublica.pe/tag/tacna">La República </a>
                        </li>
                        <li>
                           <a class="navbar-default" href="http://www.estrellaarica.cl" target="blank">La Estrella de Arica</a>
                        </li>
                        <li>
                           <a class="navbar-default" href="http://elperuano.pe/" target="blank">El Peruano</a>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
         </div>
      </nav>

      <<!-- Wrapper noticias por delito-->
      <div id="page-wrapper">
         <div class="container-fluid">
            <div class="row">
               <div class="row">
                  <div class="col-lg-1"></div>
                     <div class="col-lg-10">
                        <h3 class="page-header">
                           <ol class="breadcrumb">
                              <li><a href="index.php">Inicio</a></li>
                              <li class="active">/ Descripción de Noticia </li>
                       
                           </ol>
                        </h3>
                     </div>
                  <div class="col-lg-1"></div>
               </div>
            </div>        

            <body>           
            <div class="text-vertical-center">
               <div align="center">
                  <h3 class="section-subheading text-muted"> </h3>

			<?php

			include_once("conexion.php"); 
			error_reporting(-1);
			
			//LUGAR	
			$lugar=array();
			$query = "call lugar()";
			$result = $conexion->query($query);
			while($row = mysqli_fetch_row($result))
			{
				$lugar[] = $row;
			}
			mysqli_free_result($result);
			$conexion->next_result();

			//DELITO    
			$delito=array();
			$query = "call delito()";
			$result = $conexion->query($query);
			while($row = mysqli_fetch_row($result))
			{
				$delito[] = $row;
			}
			mysqli_free_result($result);
		    $conexion->next_result();       

			//INTERVENTOR
			$interventor=array();
			$query = "call interventor()";
			$result = $conexion->query($query);
			while($row = mysqli_fetch_row($result))
			{
				$interventor[] = $row;
			}
			mysqli_free_result($result);
			$conexion->next_result();     
			?>

                  <!-- añadir tabla con php--> 
                     
					<form role='form' method='POST' action='buscar.php' id='fecha' name='fecha'>
						<label>Buscar Por Fecha:</label><input type='hidden' id='accion' name='accion' value='fecha'>
					<input type="date" id='valor' name='valor'> <button type="submit" class="btn btn-info">Buscar</button>
					</form> <br>
					

			
			 <form role='form' method='POST' action='buscar.php' id='lugar' name='lugar'>
						<label>Buscar Por Lugar:</label><input type='hidden' id='accion' name='accion' value='lugar'>
			<select name="valor" id="valor">
				<?php 
					for ($i=0;$i<count($lugar);$i++)
					{
							echo "<option value='".$lugar[$i][1]."'>".$lugar[$i][1]."</option>";
					}                     
				?>
			</select> <button type="submit" class="btn btn-info">Buscar</button></form> <br>
				
                    
			
			 <form role='form' method='POST' action='buscar.php' id='delito' name='delito'>
					<label>Buscar Por Delito:</label><input type='hidden' id='accion' name='accion' value='nom_delito'>
			<select  name="valor" id="valor">
				<?php 
					for ($i=0;$i<count($delito);$i++)
					{
							echo "<option value='".$delito[$i][1]."'>".$delito[$i][1]."</option>";
					}                     
				?>
			 </select> <button type="submit" class="btn btn-info">Buscar</button></form> <br>
				

			
			<form role='form' method='POST' action='buscar.php' id='interventor' name='fecha'>
					<label>Buscar Por Interventor:</label><input type='hidden' id='accion' name='accion' value='nom_interventor'>
			<select name="valor" id="valor">
			 	<?php
					for ($i=0;$i<count($interventor);$i++)
		            {
							echo "<option value='".$interventor[$i][1]."'>".$interventor[$i][1]."</option>";
					}
				?>
			</select> <button type="submit" class="btn btn-info">Buscar</button></form> <br> <br>
			
			
               
               
                      
                 
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Fecha</th>
                                                <th>Titulo</th>     
                                                <th>Delito</th>             
                                                <th>Interventor</th> 
                                                <th>Lugar</th> 
                                                <th>Fuente</th>  
												<th>Acción</th>                   
                                            </tr>
										</thead>
										<tbody>
										<?php
											if(isset($_POST["accion"]))
											{
												if($_POST["accion"]=="lugar")
												{
													$_POST["accion"]="lugar.lugar";
												}
												$noticias=array();
												$query = "SELECT `id_intervencion`, `fecha`, `titulo`, `nom_delito`, `nom_interventor`, `lugar`.`lugar`, `nombre` FROM `intervencion` INNER JOIN `delito` ON `delito`=`id_delito` INNER JOIN `interventor` ON `interventor`=`id_interventor` INNER JOIN `lugar` ON `intervencion`.`lugar`=`lugar`.`id_lugar` INNER JOIN `diario` ON `fuente`=`id_diario` WHERE `eliminado`=0 AND ".$_POST["accion"]."='".$_POST["valor"]."' ORDER BY `fecha`";
												//echo $query;
												$result = $conexion->query($query);
												while($row = mysqli_fetch_row($result))
												{
											 		$noticias[] = $row;
												}
												mysqli_free_result($result);
												//$conexion->next_result();
												for($i=0;$i<count($noticias);$i++)
												{
													echo "<tr>";
													echo "<td>".$noticias[$i][1]."</td>";
													echo "<td>".$noticias[$i][2]."</td>";
													echo "<td>".$noticias[$i][3]."</td>";
													echo "<td>".$noticias[$i][4]."</td>";
													echo "<td>".$noticias[$i][5]."</td>";
													echo "<td>".$noticias[$i][6]."</td>";
													echo "<td> 
															<form role='form' method='POST' action='ingresar.php' id='ver' name='ver'>
																<input type='hidden' id='accion' name='accion' value='Ver Noticia'>
																<input type='hidden' id='id_intervencion' name='id_intervencion' value='".$noticias[$i][0]."'>
															</form>
															<!-- TODO: Implementar visualizacion en vez de edicion -->
															<form role='form' method='POST' action='ingresar.php' id='editar' name='editar'>
																<input type='hidden' id='accion' name='accion' value='Editar Noticia'>
																<input type='hidden' id='id_intervencion' name='id_intervencion' value='".$noticias[$i][0]."'>
															</form>
															<form role='form' method='POST' action='ingresar.php' id='eliminar' name='eliminar'>
																<input type='hidden' id='accion' name='accion' value='Eliminar Noticia'>
																<input type='hidden' id='id_intervencion' name='id_intervencion' value='".$noticias[$i][0]."'>
															</form>
															<button class='btn btn-success' form='ver'><i class='fa fa-eye'></i></button><button class='btn btn-warning' form='editar'><i class='fa fa-pencil'></i></button><button class='btn btn-danger' form='eliminar'><i class='fa fa-trash'></i></button>
														</td>";
													echo "</tr>";
												} 
											}      
										?>
										</tbody>
									</table>

                                </div>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                  <!---->
                  </h3>        
               </div>
            </div>
         </div>
      </div>

   </div>
                                
     
   </div>
<!--<footer class="bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    
                </div>
                <div class="col-md-4">
                  <center>
                    <span class="copyright">Copyright &copy; Intendencia de Aduana de Tacna 2017</span> <br>
                     <span> Parque Industrial  Mz.A Lt. 5-6 Pocollay - Tacna  <br>  Tel: 052-583120 </span>
                  </center>
                   
                </div>
                <div class="col-md-4">
                    
                </div>
            </div>
        </div>
    </footer> -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
