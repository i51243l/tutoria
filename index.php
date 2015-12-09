<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sistema de Tutoría </title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    

</head>

<body>

 <nav class="navbar navbar-color navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">

                <a class="navbar-brand" href="#page-top"> Sistema de Tutoría</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#top">Sistema</a>
                    </li>
                     <li class="page-scroll">
                        <a href="#usuarios">Usuarios</a>
                    </li><li class="page-scroll">
                        <a href="#footer">Contactos</a>
                    </li>
                    

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

  <header id="top" class="header">

        <div class="text-vertical-center">
            <h1>Sistema de Tutoría</h>
             <div align="center">
                 <img  class="img-responsive" src="img/logoesis.png" alt="">
             </div>
           
            <h3>Escuela Académica Profesional de Ing. Informática y Sistemas</h3>
            <br>
          
        </div>
    </header>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="usuarios" class="services bg-primary">
        <div class="container">
            <div class="rSow text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Usuarios</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-4 col-md-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-user fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Director</strong>
                                </h4>
                                <p>Director de la ESIS.</p>
                                <a href="sistema/login.php" class="btn btn-light">Ingresar</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-md-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-users fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Docente - Tutor</strong>
                                </h4>
                                <p>Docentes que brindan tutoría a estudiantes.</p>
                                <a href="sistema/login.php" class="btn btn-light">Ingresar</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-dd-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>Estudiante</strong>
                                </h4>
                                <p>Estudiantes que reciben tutoría.</p>
                                <a href="sistema/login.php" class="btn btn-light">Ingresar</a>
                            </div>
                        </div>
                        
                    </div>
                    <!-- /.row (nested) -->

                    
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>


    <!-- Footer -->
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">

                    <div class="footer-col col-md-4">
                        <h3>Ubicación</h3>
                        <p>Av. Miraflores s/n - Sede los Granados <br>TACNA, PERÚ</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Contáctanos:</h3>
                        <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (052) 58-3000</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">esis@unjbg.edu.pe</a>
                        </li>
                    </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Siguenos en:</h3>
                       <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    </div>
                    <br>
                    
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Sistema Tutoría ESIS 2015</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>

</body>

</html>
