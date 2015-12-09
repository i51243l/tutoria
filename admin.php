<!DOCTYPE html>
<html lang="en">

<?
    all_head();
?>

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
                <a class="navbar-brand" href="index.html">Sistema de Tutoría - Administrador</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Administrador <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
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
                        <a href="admin.php"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="crear_t.php"><i class="fa fa-fw fa-coffee"></i> Crear Tutoría </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-users"></i> Ver tutoría </a>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-fw fa-power-off"></i> Cerrar sesión </a>
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
                            Administrador <small>Sistema de tutoría</small>
                        </h1>
                        
                    </div>
                </div>
                <!-- /.row -->
                <br><br>
                <div class="row">
                    <div class="col-lg-1 col-md-6">
                        
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-university fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">6/10</div>
                                        <div>Docentes</div>
                                    </div>
                                </div>
                            </div>
                            
                                <div class="panel-footer">
                                   Docente Consejero - Tutor: Desarrolla la acción de consejería - tutoría académica... 
                                </div>
                           
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6">
                        
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-fw fa-graduation-cap fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">200/300</div>
                                        <div>Alumnos</div>
                                    </div>
                                </div>
                            </div>
                            
                                <div class="panel-footer">
                                    La Consejería y Tutoría Académica es una estrategia pedagógica que la UNJBG...
                                </div>
                            
                        </div>
                    </div> 
                    <div class="col-lg-1 col-md-6">
                        
                    </div>
                </div>
                
                <!-- /.row -->
                <br><br>
                <div class="row">                    
                    <div class="col-lg-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Últimas reuniones</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Fecha</th>
                                                <th>Docente</th>
                                                <th>Motivo</th>
                                                <th>Ver más</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Mauricio</td>
                                                <td>Bajas notas</td>
                                                <td>
                                                <a href="#">Ver reunión <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Mauricio</td>
                                                <td>Bajas notas</td>
                                                <td>
                                                <a href="#">Ver reunión <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Mauricio</td>
                                                <td>Bajas notas</td>
                                                <td>
                                                <a href="#">Ver reunión <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-right">
                                    <a href="#">Ver todas las reuniones <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-file-word-o fa-fw"></i> Últimos formatos</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Fecha</th>
                                                <th>Formato</th>
                                                <th>Alumno / Docente</th>
                                                <th> Ver más</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Formato 2</td>
                                                <td>Ricardo</td>
                                                <td>
                                                <a href="#">Ver formato <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Formato 2</td>
                                                <td>Ricardo</td>
                                                <td>
                                                <a href="#">Ver formato <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>12/12/12</td>
                                                <td>Formato 2</td>
                                                <td>Ricardo</td>
                                                <td>
                                                <a href="#">Ver formato <i class="fa fa-plus-square"></i></a>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-right">
                                    <a href="#">Ver todos los formatos <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <!-- /.row -->
            <br><br>
            </div>
            <!-- /.container-fluid -->
            <br>
            <footer class='text-center'>
                <div class='footer-below'>
                    <div class='container'>
                        <div class='row'>
                            <div class='col-lg-12'>
                                Copyright &copy; Your Website 2015
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
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
