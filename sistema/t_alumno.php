<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tutoría Alumno</title>

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
        

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Administrador <small>Ver Tutoría </small>
                        </h1>
                        
                    </div>
                </div>
                <!-- container-->
                <div class="  container">
                    <div class="row">
                        <br>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8" >
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h2 class="panel-title text-center"> Tutoría Académica </h2>
                                </div>
                                <div class="panel-body">                                                
                                    <form id="multiselectForm" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label">Docente</label>
                                            <div class="col-xs-8">
                                                <select class="form-control" name="docente">
                                                        <option>Docente 1</option>
                                                        <option>Docente 2</option>
                                                        <option>Docente 3</option>
                                                        <option>Docente 4</option>
                                                </select>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="col-xs-4 control-label">Año de estudios</label>
                                            <div class="col-xs-4">
                                                <select class="form-control" name="año">
                                                    <option value=""> 1er año</option>
                                                    <option value=""> 2do año</option>
                                                    <option value=""> 3er año</option>
                                                    <option value=""> 4to año</option>
                                                </select>
                                            </div>
                                        </div>

                            
                                    </form>
                                <table class="responsive table table-striped table-bordered table-hover">
                                    <tr class="info">
                                      <th>N°</th>
                                      <th> Alumno </th>
                                      <th> Matricula</th>
                                      <th> Ver tutoría </th>
                                      <th>Editar tutoría </th>
                                      <th>Eliminar tutoría</th>
                                      
                                    </tr>
                                    <tr>
                                    <td>1</td>
                                    <td> alumno 1 </td>
                                    <td> III</td>
                                    <td><a href="#"> <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                    
                                    </td>
                                    </tr>
                                    <tr>
                                    <td>2 </td>
                                    <td> alumno 2 </td>
                                    <td> III</td>
                                    <td><a href="#">  <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                   
                                    </tr>
                                    <tr>
                                    <td>3 </td>
                                    <td> alumno 3 </td>
                                    <td> III</td>
                                    <td><a href="#">  <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                    
                                    </tr>
                                    <tr>
                                     <td>4 </td>
                                    <td> alumno 4 </td>
                                    <td> III</td>
                                    <td><a href="#">  <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                    </tr>
                                    <tr>
                                     <td>5 </td>
                                    <td> alumno 5 </td>
                                    <td> III</td>
                                    <td><a href="#">  <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                    
                                    </tr>
                                    <tr>
                                     <td>6 </td>
                                    <td> alumno 6 </td>
                                    <td> III</td>
                                    <td><a href="#">  <i class="fa fa-plus-square"></i> Ver</a></td>
                                    <td> <a href="#">  <i class="fa fa-pencil-square-o"></i> Editar</a></td>
                                    <td><a href="#">  <i class="fa fa-times"></i> Eliminar</a></td>
                                   
                                    </tr>
                                </table>
                                </div>
                            </div>
                        <br>
                        </div>
                        <div class="col-sm-2"></div>

                        <br>
                    </div>
                            
                    <br> <br>
                    <div class="row text-center">
                        <div class="col-lg-4 col-md-6 ">
                                        
                        </div>
                        <!--<div class="col-lg-4 col-md-6 ">
                            <button type="submit" class="btn btn-primary btn-block btn-md text-center">Validar</button>
                        </div>   -->
                        <div class="col-lg-4 col-md-6 ">
                                        
                        </div>     
                    </div>
                    <br> <br>    
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