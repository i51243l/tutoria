<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sistema de tutoria</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Sistema de Tutoría - Formularios</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>Formularios</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>Alumno</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Docente <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Configuración</a>
                        </li>
                        <li class="divider"></li>
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
                        <a href="index.html"><i class="fa fa-fw fa-dashboard"></i> Home</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-bar-chart-o"></i> Reuniones (Tutorías) <i class="fa fa-fw fa-caret-down"></i> </a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="plani_reu.php">Planificar Reunión</a>
                            </li>
                            <li>
                                <a href="crear_reu.php">Registrar reunión</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-table"></i> Horario <i class="fa fa-fw fa-caret-down"></i> </a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="#">Disponer horario</a>
                            </li>
                            <li>
                                <a href="#">Ver reservas</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw fa-users"></i> Alumnos </a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw fa-edit"></i> Informes </a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw fa-circle"></i> Recomendaciones </a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-arrows-v"></i> Otros <i class="fa fa-fw fa-caret-down"></i> </a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="otros.php">Formularios</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Formularios<small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Sistema de tutoría
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

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
                                    <h3>Formularios</h3>
                                    <hr class="small">       
                                </div>
                            </div>
                            <div class="  container">
                                <!--formulario simple-->
                                <div class="row">
                                    <br>
                                    <div class="col-sm-6" >
                                        <form action="" class="">
                                            <div class=" form-group">
                                                <label for="form1">Formulario1:</label>
                                                <div class="input-group"> 
                                                    <span class="input-group-addon"><span class=""></span></span>
                                                    <input class="form-control" id="form1" type="text" placeholder=""  >
                                                </div>
                                            </div>
                                        </form>
                                        <br>
                                    </div>
                                    
                                    <br>
                                </div>
                                
                                <!--textos largos-->
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Formulario 2</h3>
                                            </div>
                                            
                                                <textarea class="form-control" rows="3"></textarea>
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <!--escoger varias opciones-->
                                    <div class="col-sm-4">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Formulario 3 </h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="">Opción 1</label>
                                                    </div>
                                                    <div class="checkbox">
                                                      <label><input type="checkbox" value="">Opción 2</label>
                                                    </div>
                                                    <div class="checkbox disabled">
                                                      <label><input type="checkbox" value="" disabled>Opción 3</label>
                                                    </div>
                                                    <div class="checkbox disabled">
                                                      <label><input type="checkbox" value="" >Opción 4</label>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>  
                                    <!--escoger un sola opcion-->
                                    <div class="col-sm-4">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Formulario 4 </h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="radio">
                                                  <label><input type="radio" name="optradio">Opción 1</label>
                                                </div>
                                                <div class="radio">
                                                  <label><input type="radio" name="optradio" selected>Opción 2</label>
                                                </div>
                                                <div class="radio disabled">
                                                  <label><input type="radio" name="optradio" disabled>Opción 3</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

                                    <!--menu despleghable-->
                                    <div class="col-sm-4">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Formulario 5 </h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                  <label for="sel1">Seleccionar:</label>
                                                  <select class="form-control" id="sel1">
                                                    <option>opción 1</option>
                                                    <option>opción 2</option>
                                                    <option>opción 3</option>
                                                    <option>opción 4</option>
                                                  </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                 
                                </div>
                            
                                <div class="row text-center">
                                    <div class="col-lg-4 col-md-6 ">
                                        <div class="service-box text-center">
                                            <a href="" class="btn btn-primary btn-block btn-md text-center" role="button"> <h4>Guardar</h4></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 ">
                                
                                    </div>   
                                    <div class="col-lg-4 col-md-6 ">
                                        <div class="service-box text-center">
                                            <a href="" class="btn btn-primary btn-block btn-md text-center" role="button"> <h4>Imprimir</h4></a>
                                        </div>
                                    </div>     
                                </div>
                                <br>       
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                
                
                <!-- /.row -->

                
                <!-- /.row -->

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