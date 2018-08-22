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

<?php 
	
	include_once("conexion.php"); 
	error_reporting(-1);

	if(!isset($_POST["accion"]))
	{
		$_POST["accion"]="Agregar Noticia";
	}

		if($_POST["accion"]=="Insertar Noticia") //cuando ya se tienen los datos
		{
			$query = "INSERT INTO intervencion(`fecha`, `lugar`, `titulo`, `resumen`, `delito`, `interventor`, `fuente`, `pagina`, `link`) VALUES ('".$_POST["fecha"]."','".$_POST["lugar"]."','".$_POST["titulo"]."','".$_POST["resumen"]."','".$_POST["delito"]."','".$_POST["interventor"]."','".$_POST["fuente"]."','".$_POST["pagina"]."','".$_POST["link"]."')";
			$result = $conexion->query($query);
			//mysqli_free_result($result);
			//$conexion->next_result(); 
		
			$query = "SELECT * FROM intervencion ORDER BY id_intervencion DESC LIMIT 1";
			$result = $conexion->query($query);
			$intervencion=array();			
			while($row = mysqli_fetch_row($result))
			{
				$intervencion = $row;
			}
			mysqli_free_result($result);
			//$conexion->next_result();

			$_POST["accion"]="Editar Noticia";

			//header('Location: noticias.php');
			//exit;
		}
		elseif($_POST["accion"]=="Agregar Noticia") //cuando aun no se tienen los datos
		{
			$intervencion=array();
			$intervencion[0]="";
			$intervencion[1]="";
			$intervencion[2]="";
			$intervencion[3]="";
			$intervencion[4]="";
			$intervencion[5]="";
			$intervencion[6]="";
			$intervencion[7]="";
			$intervencion[8]="";
			$intervencion[9]="";
		}
		elseif($_POST["accion"]=="Editar Noticia") 
		{	
			if(isset($_POST["fecha"])) //cuando ya se tienen los datos, sino recien se empezara a editar
			{
				$query = "UPDATE `intervencion` SET `fecha`='".$_POST["fecha"]."',`lugar`='".$_POST["lugar"]."',`titulo`='".$_POST["titulo"]."',`resumen`='".$_POST["resumen"]."',`delito`='".$_POST["delito"]."',`interventor`='".$_POST["interventor"]."',`fuente`='".$_POST["fuente"]."',`pagina`='".$_POST["pagina"]."',`link`='".$_POST["link"]."' WHERE `id_intervencion`='".$_POST["id_intervencion"]."'";
				echo $query;
				$result = $conexion->query($query);
				//mysqli_free_result($result);
				//$conexion->next_result();
				header('Location: noticias.php');
				exit;
			}
			$query = "SELECT * FROM intervencion WHERE id_intervencion='".$_POST["id_intervencion"]."'";
			$result = $conexion->query($query);
			$intervencion=array();			
			while($row = mysqli_fetch_row($result))
			{
				$intervencion = $row;
			}
			mysqli_free_result($result);
			//$conexion->next_result();

			//header('Location: noticias.php');
			//exit;
		}
		elseif($_POST["accion"]=="Ver Noticia")
		{	
			$query = "SELECT * FROM intervencion WHERE id_intervencion='".$_POST["id_intervencion"]."'";
			$result = $conexion->query($query);
			$intervencion=array();			
			while($row = mysqli_fetch_row($result))
			{
				$intervencion = $row;
			}
			mysqli_free_result($result);
			//$conexion->next_result();

			//header('Location: noticias.php');
			//exit;
		}
		elseif($_POST["accion"]=="Eliminar Noticia")
		{	
			$query = "UPDATE `intervencion` SET `eliminado`=1 WHERE `id_intervencion`='".$_POST["id_intervencion"]."'";
			echo $query;
			$result = $conexion->query($query);
			$intervencion=array();			
			while($row = mysqli_fetch_row($result))
			{
				$intervencion = $row;
			}
			//mysqli_free_result($result);
			//$conexion->next_result();

			header('Location: noticias.php');
			exit;
		}
		

	//NACIONALIDAD	
	$nacionalidad=array();
	$query = "call pais()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
    {
		$nacionalidad[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();
                                    
	//TIPO DE INFRACTOR	
	$tipo_infractor=array();
	$query = "call tipo_infractor()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
		$tipo_infractor[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                         
	
	/*for ($i=0;$i<count($tipo_infractor);$i++)
	{
		if (strcmp(($tipo_infractor[$i][1]), $tipo_in)==0)
		{
              $tipoin = $tipo_infractor[$i][0];
            }
        }*/  

   /*$query = "INSERT INTO persona VALUES (NULL, '".$nombres."', '".$apellidos."', '".$alias."', '".$edad."', '".$nac."', '".$organizacion."', '".$dni."', '".$tipoin."')";
   //  $query= "call i_persona($id_persona, $nombres, $apellidos, $alias, $edad, $nacionalidad, $organizacion)";
     $result=$conexion->query($query); */


   /*$query = "INSERT INTO empresa VALUES (NULL, '".$nom_empresa."', '".$nac."', '".$rubro."', '".$ruc."')";
     $result=$conexion->query($query); */

	//ITEM MERCANCIA
	$item=array();
	$query = "call item_mercancia()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
		$item[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();
	/*for($i=0;$i<count($item);$i++)
	{
		if(strcmp(($item[$i][1]), $it)==0)
		{
              $item_m= $item[$i][0];
		}  
	}*/  
      
	//UNIDAD
	$unidad=array();
	$query = "call unidad()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
		$unidad[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                            

	//MONEDA
	$moneda=array();
    	$query = "call moneda()";
    	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
 		$moneda[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                            
	
	/*$query = "INSERT INTO mercancia VALUES (NULL, '".$item_m."', '".$cantidad."', '".$uni."', '".$id_moneda."', '".$valor."')";
	$result=$conexion->query($query);*/ 


	//TIPO DE VEHICULO
	$tipo_vehiculo=array();
	$query = "call tipo_vehiculo()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
 	{
		$tipo_vehiculo[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                            
    
	//MARCA
	$marca=array();
	$query = "call marca()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
		$marca[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                            

	/*$query = "INSERT INTO vehiculo VALUES (NULL, '".$tipove."', '".$marc."', '".$placa."', '".$caracteristicas."')";
    $result=$conexion->query($query);*/

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

	//DIARIO
	$diario=array();
	$query = "call diario()";
	$result = $conexion->query($query);
	while($row = mysqli_fetch_row($result))
	{
		$diario[] = $row;
	}
	mysqli_free_result($result);
	$conexion->next_result();                      
  
    /*$query = "INSERT INTO intervencion VALUES (NULL, '".$fecha."', '".$lug."', '".$titulo."', '".$resumen."','".$del."','".$inter."')";
   $result=$conexion->query($query);*/
?>

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
            <a class="navbar-brand text-center" href="index.php"> GESIEX - Gestión de la Información Externa</a>
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
                  <li class="divider"></li>
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
                     <a class="navbar-default" href="#"><i class="fa fa-users fa-fw"></i> Infractores <span class="fa arrow"></span></a>    
                     <ul class="nav nav-second-level">
                           <li>
                              <a class="navbar-default" href="inf_del.php">Por Delito</a>
                           </li>
                           <li>
                              <a class="navbar-default" href="inf_lugar.php">Por Lugar</a>
                           </li>
                     </ul>
                  </li>
                  <li>
                     <a class="navbar-default" href="programacion.php"><i class="fa fa-calendar fa-fw"></i> Programación Trimestral </a>      
                  </li>
               </ul>
            </div>
         </div>
    </nav>

    <div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h2 class="page-header">Registro de Noticia</h2>
          </div>
        </div>   
    
          <div class="row">
            <form role="form" method="POST" action="ingresar.php" id="ingresar" name="ingresar">
              <div class="col-lg-7">
                <div class="panel panel-success">
                  <div class="panel-heading">Intervención <?php echo $intervencion[0]; ?> <input type="hidden" name='id_intervencion' <?php echo "value='".$intervencion[0]."'"; ?> > </div>
                  <div class="panel-body">
                   
                      <div class="form-group">
                          <label>Título</label>
                          <input name="titulo" id="titulo" class="form-control" <?php echo "value='".$intervencion[3]."'"; ?> <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> >
                          <p class="help-block"></p>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label>Fecha</label>
                           <input name="fecha" id="fecha" type="date" class="form-control" placeholder="AAAA-MM-DD" <?php echo "value='".$intervencion[1]."'"; ?> <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> >
                            <p class="help-block"></p>
                          </div>
                        </div>
                        <div class="col-md-6"> 
                          <div class="form-group">
                            <label>Lugar</label>
                            <select name="lugar" id="lugar" class="form-control" <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?>>
                             <?php 
                                for ($i=0;$i<count($lugar);$i++)
                                {
                                    if($lugar[$i][0]!=$intervencion[2])
										echo "<option value='".$lugar[$i][0]."'>".$lugar[$i][1]."</option>";
									else
										echo "<option selected value='".$lugar[$i][0]."'>".$lugar[$i][1]."</option>";
                                    
                                }                     
                              ?>
                             
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6">  
                              <div class="form-group">
                                <label>Delito</label>
                                <select  name="delito" id="delito" class="form-control" <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?>>
                                <?php
                                  for ($i=0;$i<count($delito);$i++)
                                  {
                                      if($delito[$i][0]!=$intervencion[5])
										echo "<option value='".$delito[$i][0]."'>".$delito[$i][1]."</option>";
									else
										echo "<option selected value='".$delito[$i][0]."'>".$delito[$i][1]."</option>";
                                      
                                  }
                           
                              ?>
                                </select>
                              </div>
                          </div>
                          <div class="col-md-6">  
                              <div class="form-group" >
                                <label>Interventor</label>
                                <select name="interventor" id="interventor" class="form-control" <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?>>
                                 <?php
                                  for ($i=0;$i<count($interventor);$i++)
                                  {
										if($interventor[$i][0]!=$intervencion[6])
											echo "<option value='".$interventor[$i][0]."'>".$interventor[$i][1]."</option>";
										else
											echo "<option selected value='".$interventor[$i][0]."'>".$interventor[$i][1]."</option>";
                                  }

                                 ?>
                                </select>
                              </div>
                          </div>
                      </div>                  
                      <div class="form-group">
                        <label>Resumen</label>
                        <textarea name="resumen" id="resumen" class="form-control" rows="3" <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> ><?php echo $intervencion[4]; ?></textarea>
                      </div>    
                      <div class="row">
                        <div class="col-md-4"> 
                          <div class="form-group">
                            <label>Fuente</label>
                            <select name="fuente" id="fuente" class="form-control" <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> >
                              <?php
                                for ($i=0;$i<count($diario);$i++)
                                  {
                                      if($diario[$i][0]!=$intervencion[7])
										echo "<option value='".$diario[$i][0]."'>".$diario[$i][1]."</option>";
									else
										echo "<option selected value='".$diario[$i][0]."'>".$diario[$i][1]."</option>";
                                  }
                              ?>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="form-group">
                            <label>Página</label>
                            <input name="pagina" id="pagina" class="form-control" <?php echo "value='".$intervencion[8]."'"; ?> <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> >
                            <p class="help-block"></p>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label>Link</label>
                            <input name="link" id="link" class="form-control" <?php echo "value='".$intervencion[9]."'"; ?> <?php if($_POST["accion"]=="Ver Noticia") echo " disabled"; ?> >
                            <p class="help-block"></p>
                          </div>
                        </div>
                      </div>
		      <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4 text-center">
                          	<?php
								if($_POST["accion"]=="Editar Noticia")
								{
									echo "<input name='accion' class='btn btn-info btn-md' type='submit' id='accion' value='Editar Noticia' form='ingresar'/>";
								}
								if($_POST["accion"]=="Agregar Noticia")
								{
									echo "<input name='accion' class='btn btn-info btn-md' type='submit' id='accion' value='Insertar Noticia' form='ingresar'/>";
								}
							?>
                        </div>
                        <div class="col-md-4"></div>
                        <br> <br>
                      </div>
                      <label>Infractor</label>
                      <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Edad </th>
                                            <th>Tipo infractor</th>
                                            <th>Nacionalidad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>36</td>
                                            <td>Conductor</td>
                                            <td>Perú</td>
                                        </tr>
                                    </tbody>
                                </table>
                      </div> 
                      <label>Mercancía</label>
                      <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Item</th>
                                            <th>Cantidad</th>
                                            <th>Unidad </th>
                                            <th>Valor</th>
                                            <th>Moneda</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Marihuana</td>
                                            <td>13</td>
                                            <td>Kg</td>
                                            <td>6000.00</td>
                                            <td>Soles</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                      </div>
                      <label>Vehículo</label>
                      <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Tipo</th>
                                            <th>Marca</th>
                                            <th>Placa</th>
                                            <th>Características</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Camioneta</td>
                                            <td>Toyota</td>
                                            <td>PCQ-345</td>
                                            <td>Rojo</td>
                                        </tr>
                                    </tbody>tipo_infractor
                                </table>
                      </div>
                      
		      <!--<div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4 text-center">
                          
                          <input name="Enviar" class="btn btn-info btn-md" type="button" id="Enviar" value="Guardar" onClick="valida_envia5()"/> 
                        </div>
                        <div class="col-md-4"></div>
                        <br> <br>
                      </div>-->
                  </div>
                </div>
              </div>
            </form>
              
              <div class="col-lg-5">
             
                <form role="form" method="POST" action="ingresar.php" id="ingresar" name="ingresar">
                <div class="panel-group">
                  <div class="panel panel-success">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse1">Agregar Infractor - Persona</a>
                      </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                      <div class="panel-body">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label>Nombres y Apellidos</label>
                                <input id="nombres" name="nombres" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                            <div class="col-md-6"> 
                              <div class="form-group">
                                <label>Apellidos</label>
                                <input id="apellidos"  name="apellidos" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                          </div>
                          
                          <div class="row">
                            <div class="col-md-4">
                              <div class="form-group">
                                <label>DNI</label>
                                <input id="dni" name="dni" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                            <div class="col-md-4"> 
                              <div class="form-group">
                                <label>Alias</label>
                                <input id="alias" name="alias" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                            <div class="col-md-4"> 
                              <div class="form-group">
                                <label>Organizacion</label>
                                <input id="organizacion" name="organizacion" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                          </div> 

                          <div class="row">
                              <div class="col-md-4">  
                                <div class="form-group">
                                  <label>Edad</label>
                                  <input id="edad" name="edad" class="form-control">
                                  <p class="help-block"></p>
                                </div>
                              </div>
                              <div class="col-md-4">  
                                  <div class="form-group">
                                <label>Tipo Infractor</label>
                                <select id="tipo_infractor" name="tipo_infractor" class="form-control">
                                <?php
					for ($i=0;$i<count($tipo_infractor);$i++)
                                  {
                                      echo "<option value='".$tipo_infractor[$i][0]."'>".$tipo_infractor[$i][1]."</option>";
                                  }
                                  
                                ?>
                                </select>
                              </div>
                              </div>
                              <div class="col-md-4">  
                                  <div class="form-group">
                                <label>Nacionalidad</label>
                                <select id="nacionalidad" name="nacionalidad" class="form-control">
                                  <?php
                                  for ($i=0;$i<count($nacionalidad);$i++)
                                  {
                                      echo "<option value='".$nacionalidad[$i][0]."'>".$nacionalidad[$i][1]."</option>";
                                      
                                  }

                                  ?>
                                </select>
                              </div>
                              </div>
                          </div>    
                             <input name="Enviar" class="btn btn-info btn-md" type="button" id="Enviar" value="Guardar"/>           
                      </div>
                      
                    </div>
                  </div>
                </div>
              </form>
              <form role="form" method="POST" action="ingresar.php" id="ingresar2" name="ingresar2">
                <div class="panel-group">
                  <div class="panel panel-success">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse4">Agregar Infractor - Empresa</a>
                      </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse">
                      <div class="panel-body">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label>Razon Social</label>
                                <input name="nom_empresa" id="nom_empresa" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>
                            <div class="col-md-6"> 
                              <div class="form-group">
                                <label>Ruc</label>
                                <input class="form-control" name="ruc" id="ruc">
                                <p class="help-block"></p>
                              </div>
                            </div>
                          </div>
                          
                          <div class="row">
                              <div class="col-md-6">  
                                <div class="form-group">
                                  <label>Rubro</label>
                                  <input name="rubro" id="rubro" class="form-control">
                                  <p class="help-block"></p>
                                </div>
                              </div>
                                <div class="col-md-6">  
                                  <div class="form-group">
                                <label>Nacionalidad</label>
                                <select name="nacionalidad" id="nacionalidad" class="form-control">
                                 <?php
                                   for ($i=0;$i<count($nacionalidad);$i++)
                                  {
                                      echo "<option value='".$nacionalidad[$i][0]."'>".$nacionalidad[$i][1]."</option>";
                                      
                                  }
                                  ?>
                                </select>
                              </div>
                              </div>
                          </div> 
                            <input name="Enviar2" class="btn btn-info btn-md" type="button" id="Enviar2" value="Guardar" onClick="valida_envia2()"/>                
                      </div>
                      
                    </div>
                  </div>
                </div>
              </form>
              <form role="form" method="POST" action="ingresar.php" id="ingresar3" name="ingresar3">
                <div class="panel-group">
                  <div class="panel panel-success">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse2">Agregar Mercancía</a>
                      </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                      <div class="panel-body">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label>Item</label>
                                <select name="item" id="item" class="form-control">
                                  <?php
                                  for ($i=0;$i<count($item);$i++)
                                  {
									echo "<option value='".$item[$i][0]."'>".$item[$i][1]."</option>";
                                  }
                                  ?>
                                </select>
                              </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                  <label>Cantidad</label>
                                  <input  name="cantidad" id="cantidad" class="form-control">
                                  <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="col-md-3"> 
                              <div class="form-group">
                                <label>Unidad</label>
                                <select name="unidad" id="unidad" class="form-control">
                                  <?php
                                  for ($i=0;$i<count($unidad);$i++)
                                  {
                                      echo "<option value='".$unidad[$i][0]."'>".$unidad[$i][1]."</option>";
                                  }
                                  ?>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                              <div class="col-md-6">  
                                  <div class="form-group">
                                    <label>Valor</label>
                                    <input name="valor" id="valor" class="form-control">
                                  <p class="help-block"></p>
                                  </div>
                              </div>
                              <div class="col-md-6">  
                                  <div class="form-group" >
                                    <label>Moneda</label>
                                    <select name="id_moneda" id="id_moneda" class="form-control">
                                      <?php
                                  for ($i=0;$i<count($moneda);$i++)
                                  {
                                      echo "<option value='".$moneda[$i][0]."'>".$moneda[$i][1]."</option>";
                                      
                                  }

                                  ?>
                                    </select>
                                  </div>
                              </div>  
                          </div> 
                            <input name="Enviar3" class="btn btn-info btn-md" type="button" id="Enviar3" value="Guardar" onClick="valida_envia3()"/>                
                      </div>
                      
                    </div>
                  </div>
                </div>
              </form>
              <form role="form" method="POST" action="ingresar.php" id="ingresar4" name="ingresar4">
                <div class="panel-group">
                  <div class="panel panel-success">
                    <div class="panel-heading">
                      <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse3">Agregar Vehículo</a>
                      </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse">
                      <div class="panel-body">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="form-group">
                                <label>Tipo</label>
                                <select name="tipo_vehiculo" id="tipo_vehiculo" class="form-control">
                                  <?php
                                  for ($i=0;$i<count($tipo_vehiculo);$i++)
                                  {
                                      echo "<option value='".$tipo_vehiculo[$i][0]."'>".$tipo_vehiculo[$i][1]."</option>";
                                  }
                                  ?>
                                </select>
                                <p class="help-block"></p>
                              </div>
                            </div>
                            <div class="col-md-6"> 
                              <div class="form-group">
                                <label>Marca</label>
                                <select name="marca" id="marca" class="form-control">
                                  <?php
                                  
                                  for ($i=0;$i<count($marca);$i++)
                                  {
                                      echo "<option value='".$marca[$i][0]."'>".$marca[$i][1]."</option>";
                                      
                                  }

                                  $conexion->close();
                                  ?>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                              <div class="col-md-6">  
                                  <div class="form-group">
                                    <label>Placa</label>
                                    <input name="placa" id="placa" class="form-control" placeholder="AAA-000" >
                                  </div>
                              </div>
                              <div class="col-md-6">  
                                  <div class="form-group" >
                                    <label>Características</label>
                                    <input name="caracteristicas" id="caracteristicas" class="form-control">
                                  </div>
                              </div>
                          </div> 
                         <input name="Enviar4" class="btn btn-info btn-md" type="button" id="Enviar4" value="Guardar" onClick="valida_envia4()"/>                     
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              </div>
          </div>
        
        <br>
    </div>   
  </div>
  <script src="../bower_components/jquery/dist/jquery.min.js"></script>
  <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
  <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
