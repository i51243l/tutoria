<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Asignar tutoria</title>

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
                            Administrador <small>Asignar Tutoría</small>
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

                                        <div class="form-group">
                                            <label class="col-xs-4 control-label">Alumno</label>
                                            <div class="col-md-8">
                                                <select class="form-control" name="alumnos" multiple>
                                                    <option>alumno 1</option>
                                                    <option value="">alumno 2</option>
                                                    <option value="">alumno 3</option>
                                                    <option value="">alumno 4</option>
                                                    <option value="">alumno 5</option>
                                                    <option>alumno 6</option>
                                                    <option>alumno 7</option>
                                                    <option>alumno 8</option>
                                                    <option>alumno 9</option>
                                                    <option>alumno 10</option>
                                                    <option>alumno 11</option>
                                                    <option>alumno 12</option>
                                                    <option>alumno 13</option>
                                                    <option>alumno 14</option>
                                                    <option>alumno 15</option>
                                                </select>
                                            </div>
                                        </div>                             
                                    </form>

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
                        <div class="col-lg-4 col-md-6 ">
                            <button type="submit" class="btn btn-primary btn-block btn-md text-center">Validar</button>
                        </div>   
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