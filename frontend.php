<?
header('Content-Type: text/html; charset=ISO-8859-1');
function all_head()
{
?>

<head>

	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Sistema de Tutorías</title>

	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="css/sb-admin.css" rel="stylesheet">

	<!-- Morris Charts CSS -->
	<link href="css/plugins/morris.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<?
}
?>

<?
function navegacion($id_usua,$tipo_usuario)
{
	include("conexion.php");
?>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<a class="navbar-brand" href="">Sistema de Tutorías</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
		<li class="dropdown">
			<?
				$query="call nombre_usuario('".$id_usua."')";
				$result=$conexion->query($query);
				$nombre=array();
				while($row = mysqli_fetch_row($result))
				{
					$nombre=$row;
				}
				mysqli_free_result($result);
				$conexion->next_result();
			?>
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <? print $nombre[0] ?><b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li>
					<a href="#"><i class="fa fa-fw fa-power-off"></i> Cerrar sesión</a>
				</li>
			</ul>
		</li>
	</ul>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class="active">
				<a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Inicio</a>
			</li>
			<li class="active">
				<a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Crear Tutorías</a>
			</li>
			<li>
				<a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-bar-chart-o"></i> Ver Tutorías<i class="fa fa-fw fa-caret-down"></i></a>
				<ul id="demo" class="collapse">
					<li>
						<a href="plani_reu.php">Ver por Docente</a>
					</li>
					<li>
						<a href="crear_reu.php">Ver por Alumno</a>
					</li>
				</ul>
			</li>
			<li>
				<a href=""><i class="fa fa-fw fa-users"></i> Salir </a>
			</li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>
<?
}
?>

<?
function mes($mes)
{
	if($mes==1)
	{
		echo "Enero";
	}
	elseif ($mes==2)
	{
		echo "Febrero";
	}
	elseif ($mes==3)
	{
		echo "Marzo";
	}
	elseif ($mes==4)
	{
		echo "Abril";
	}
	elseif ($mes==5)
	{
		echo "Mayo";
	}
	elseif ($mes==6)
	{
		echo "Junio";
	}
	elseif ($mes==7)
	{
		echo "Julio";
	}
	elseif ($mes==8)
	{
		echo "Agosto";
	}
	elseif ($mes==9)
	{
		echo "Setiembre";
	}
	elseif ($mes==10)
	{
		echo "Octubre";
	}
	elseif ($mes==11)
	{
		echo "Noviembre";
	}
	else
	{
		echo "Diciembre";
	}
}
?>


<?
function item($id_item,$tipo_item,$respuesta)
{
?>
	<input type="hidden" name= <? echo "item[] "; ?> value=<? echo $id_item; ?> >
<?	
	if($tipo_item=='X')
	{
		$masculino="";
		$femenino="";
		if($respuesta=="Masculino")
		{
			$masculino="checked";
		}
		elseif ($respuesta=="Femenino")
		{
			$femenino="checked";
		}
?>
		<div class="radio">
    	<label><input type="radio" value="Masculino" name= <? echo "respuesta[".$id_item."] ".$masculino; ?> >Masculino</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Femenino" name= <? echo "respuesta[".$id_item."] ".$femenino; ?> >Femenino</label>
    </div>
<?
	}
	if($tipo_item=='C')
	{
		$soltero="";
		$casado="";
		if($respuesta=="Soltero")
		{
			$soltero="checked";
		}
		elseif ($respuesta=="Casado")
		{
			$casado="checked";
		}
?>
		<div class="radio">
    	<label><input type="radio" value="Soltero" name= <? echo "respuesta[".$id_item."] ".$soltero; ?> >Soltero</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Casado" name= <? echo "respuesta[".$id_item."] ".$casado; ?> >Casado</label>
    </div>
<?
	}
	if($tipo_item=='M')
	{
		$nunca="";
		$muchasveces="";
		$pocasveces="";
		$siempre="";
		if($respuesta=="Nunca")
		{
			$nunca="checked";
		}
		elseif ($respuesta=="Muchas Veces")
		{
			$muchasveces="checked";
		}
		elseif ($respuesta=="Pocas Veces")
		{
			$pocasveces="checked";
		}
		elseif ($respuesta=="Siempre")
		{
			$siempre="checked";
		}
?>
		<div class="radio">
    	<label><input type="radio" value='Nunca' name= <? echo "respuesta[".$id_item."] ".$nunca; ?> >Nunca</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value='Muchas Veces' name= <? echo "respuesta[".$id_item."] ".$pocasveces; ?> >Pocas Veces</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value='Pocas Veces' name= <? echo "respuesta[".$id_item."] ".$muchasveces; ?> >Muchas Veces</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value='Siempre' name= <? echo "respuesta[".$id_item."] ".$siempre; ?> >Siempre</label>
    </div>
<?
	}
	if($tipo_item=='B')
	{
		$si="";
		$no="";
		if($respuesta=="Si")
		{
			$si="checked";
		}
		elseif ($respuesta=="No")
		{
			$no="checked";
		}
?>
		<div class="radio">
    	<label><input type="radio" value='Si' name= <? echo "respuesta[".$id_item."] ".$si; ?> >Si</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value='No' name= <? echo "respuesta[".$id_item."] ".$no; ?> >No</label>
    </div>
<?
	}
	if($tipo_item=='F')
	{
		$nunca="";
		$raravez="";
		$frecuentemente="";
		$casisiempre="";
		$siempre="";
		if($respuesta=="Nunca")
		{
			$nunca="checked";
		}
		elseif ($respuesta=="Rara Vez")
		{
			$raravez="checked";
		}
		elseif ($respuesta=="Frecuentemente")
		{
			$frecuentemente="checked";
		}
		elseif ($respuesta=="Casi Siempre")
		{
			$casisiempre="checked";
		}
		elseif ($respuesta=="Siempre")
		{
			$siempre="checked";
		}
?>
		<div class="radio">
    	<label><input type="radio" value="Nunca" name= <? echo "respuesta[".$id_item."] ".$nunca; ?> >Nunca</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Rara Vez" name= <? echo "respuesta[".$id_item."] ".$raravez; ?> >Rara Vez</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Frecuementemente" name= <? echo "respuesta[".$id_item."] ".$frecuentemente; ?> >Frecuentemente</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Casi Siempre" name= <? echo "respuesta[".$id_item."] ".$casisiempre; ?> >Casi Siempre</label>
    </div>
    <div class="radio">
    	<label><input type="radio" value="Siempre" name= <? echo "respuesta[".$id_item."] ".$siempre; ?> >Siempre</label>
    </div>
<?
	}
	if($tipo_item=='N')
	{
?>
		<br><input type="number" class="form-control" name= <? echo "respuesta[".$id_item."] " ?> value= <? echo $respuesta ?> >
<?
	}
	if($tipo_item=='S')
	{
?>
		<br><input type="text" class="form-control" name= <? echo "respuesta[".$id_item."] " ?> value= <? echo $respuesta ?> >
<?
	}
	if($tipo_item=='T')
	{
?>
		<br><textarea rows="2" name= <? echo "respuesta[".$id_item."] " ?> class="form-control" ><? echo $respuesta ?></textarea>
<?
	}
}
?>