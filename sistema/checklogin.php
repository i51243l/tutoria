<?
session_start();
header('Content-Type: text/html; charset=ISO-8859-1');
include("conexion.php");

if(!isset($_POST['user']))
{
  header("Location: login.php");
  exit;
}

   $query="call clave_usuario('".$_POST['user']."')";
   //echo $query;
   $result=$conexion->query($query);
   $clave=array();
   while($row = mysqli_fetch_row($result))
   {
     $clave[]=$row;
   }
   mysqli_free_result($result);
   $conexion->next_result(); 

   if(count($clave)==1 and password_verify($_POST['pass'],$clave[0][0]))
   {
     $_SESSION['loggedin'] = true;
     $_SESSION['id_usua'] = $clave[0][1];
     $_SESSION['tipo_usuario'] = $clave[0][2];
     $_SESSION['id_peri'] = $_POST['peri'];
     $_SESSION['start'] = time();
     $_SESSION['expire'] = $_SESSION['start'] + (10 * 60) ;
     if($clave[0][2]=='docente')
     {
        $query="call id_tutor('".$_SESSION['id_usua']."','".$_SESSION['id_peri']."')";
       $result=$conexion->query($query);
       while($row = mysqli_fetch_row($result))
       {
         $usuario=$row;
       }
       mysqli_free_result($result);
       $conexion->close();
       $_SESSION['id_tuto'] = $usuario[0];
       echo $_SESSION['id_tuto'];
     }
     elseif ($clave[0][2]=='estudiante')
     {
       $query="call id_estudiante('".$_SESSION['id_usua']."','".$_SESSION['id_peri']."')";
        //echo $query;
       $result=$conexion->query($query);
       while($row = mysqli_fetch_row($result))
       {
         $usuario=$row;
       }
       mysqli_free_result($result);
       $conexion->close();
       $_SESSION['id_estu'] = $usuario[0];
       echo $_SESSION['id_estu'];
     }
     header('Location: inicio.php');

   }
   else
   {
     header('Location: login.php?error=si');    
   }

?>