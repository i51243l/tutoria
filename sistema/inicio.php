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
        ?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administrador <small>Sistema de Tutor�a</small>
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
