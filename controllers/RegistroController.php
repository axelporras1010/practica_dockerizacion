<?php

namespace Controllers;

use Model\Dia;
use Model\Hora;
use MVC\Router;
use Model\Evento;
use Model\Paquete;
use Model\Ponente;
use Model\Usuario;
use Model\Registro;
use Model\Categoria;
use Model\EventosRegistro;
use Model\Regalo;

class RegistroController
{
    public static function crear(Router $router)
    {
        if(!is_auth())
        {
            header('Location: /');
            return;    
        } 

        //Verificar si el usuario esta registrado
        $registro = Registro::where('usuario_id', $_SESSION['id']);

        if(isset($registro) && ($registro->paquete_id === "3" || $registro->paquete_id === "2"))
        {
            header('Location: /boleto?id=' . urlencode($registro->token));
            return;
        }

        if(isset($registro) && $registro->paquete_id === "1"){
            //Redireccionar a boleto virtual enc aso de haber finalizado su registro
            header('Location: /finalizar-registro/conferencias');
            return;
        }

        $router->render('registro/crear', [
            'titulo' => 'Finalizar Registro'
        ]);
    }

    public static function gratis()
    {
        if($_SERVER['REQUEST_METHOD'] === 'POST')
        {
            if(!is_auth())
            {
                header('Location: /login');
                return;
            } 

            $registro = Registro::where('usuario_id', $_SESSION['id']);
            if(!isset($registro) && $registro->paquete_id === "3")
            {
                header('Location: /boleto?id=' . urlencode($registro->token));
                return;
            }

            $token = substr(md5(uniqid(rand(), true)), 0, 8);

            //Crear registro
            $datos = [
                'paquete_id' => 3,
                'pago_id' => '',
                'token' => $token,
                'usuario_id' => $_SESSION['id']
            ];

            $registro = new Registro($datos);
            $registro->regalo_id = 10;
            $resultado = $registro->guardar();
            // debuguear($resultado);

            if($resultado)
            {
                header('Location: /boleto?id=' . urlencode($registro->token));
                return;
            }
            
        }
    }

    public static function boleto(Router $router)
    {
        //Validar la URL
        $id = $_GET['id'];

        if(!$id || !(strlen($id) === 8))
        {
            debuguear('Token no valido');
        }

        //Buscarlo en la BD
        $registro = Registro::where('token', $id);
        if(!$registro)
        {
            header('Location: /');
            return;
        }

        //Llenar las tablas de referencia
        $registro->usuario = Usuario::find($registro->usuario_id);
        $registro->paquete = Paquete::find($registro->paquete_id);
        
        $router->render('/registro/boleto', [
            'titulo' => 'Asistencia a DevWebcamp',
            'registro' => $registro
        ]);
    }

    public static function pagar()
    {
        if($_SERVER['REQUEST_METHOD'] === 'POST')
        {
            if(!is_auth())
            {
                header('Location: /login');
                return;
            } 

            //Validar que POST no venga vacio
            if(empty($_POST)) {
                echo json_encode(['error' => 'No data received']);
                http_response_code(400); // Código de error 400 para mala solicitud
                return;
            }

            // Crear registro

            $datos = $_POST;
            $datos['token'] = substr(md5(uniqid(rand(), true)), 0, 8);
            $datos['usuario_id'] = $_SESSION['id'];

            try {
                $registro = new Registro($datos);
                $resultado = $registro->guardar();
                echo json_encode($resultado);
            } catch (\Throwable $th) {
                echo json_encode([
                    'resultado' => 'error'
                ]);
            }
            
        }
    }

    public static function conferencias(Router $router)
    {
        if(!is_auth()) header('Location: /login');

        //Validar que el usuario tenga el plan presencial
        $usuario_id = $_SESSION['id'];
        $registro = Registro::where('usuario_id', $usuario_id);

        if(isset($registro) && $registro->paquete_id === "2")
        {
            header('Location: /boleto?id=' . urlencode($registro->token));
            return;
        }

        if($registro->paquete_id !== "1")
        {
            header('Location: /');
            return;
        }

        //Redireccionar a boleto virtual enc aso de haber finalizado su registro
        if(isset($registro->regalo_id) && $registro->paquete_id === "1")
        {
            header('Location: /boleto?id=' . urlencode($registro->token));
            return;
        }

        $eventos = Evento::ordenar('hora_id', 'ASC');
        $eventos_formateados = [];
        
        foreach($eventos as $evento):
            $evento->dia = Dia::find($evento->dia_id);
            $evento->categoria = Categoria::find($evento->categoria_id);
            $evento->ponente = Ponente::find($evento->ponente_id);
            $evento->hora = Hora::find($evento->hora_id);

            if($evento->dia_id === "1"  && $evento->categoria_id === "1") $eventos_formateados['conferencias_v'][] = $evento;
            if($evento->dia_id === "2"  && $evento->categoria_id === "1") $eventos_formateados['conferencias_s'][] = $evento;
            if($evento->dia_id === "1"  && $evento->categoria_id === "2") $eventos_formateados['workshops_v'][] = $evento;
            if($evento->dia_id === "2"  && $evento->categoria_id === "2") $eventos_formateados['workshops_s'][] = $evento;
        endforeach;

        $regalos = Regalo::all('ASC');

        //Registro mediante $_POST
        if($_SERVER['REQUEST_METHOD'] === 'POST'){

            //Revisar que el user este autenticado
            if(!is_auth())
            {
                header('Location: /');
                return;
            }

            $eventos = explode(',', $_POST['eventos']);
            if(empty($eventos)) 
            {
                echo json_encode(['resultado' => false]);
                return;
            }

            //Obtener el registro de usuario
            $registro = Registro::where('usuario_id', $_SESSION['id']);
            if(!isset($eventos) || $registro->paquete_id !== "1") 
            {
                echo json_encode(['resultado' => false]);
                return;
            }

            $eventos_array = [];
            //Validar la disponibilidad de los eventos seleccionados
            foreach($eventos as $evento_id)
            {
                $evento = Evento::find($evento_id);
                //Comporbar que el evento exista
                if(!isset($evento) || $evento->disponibles === "0")
                {
                    echo json_encode(['resultado' => false]);
                    return;
                }
                $eventos_array[] = $evento;
            }

            foreach($eventos_array as $evento)
            {
                $evento->disponibles -= 1;
                $evento->guardar();
                
                //Almacenar el registro
                $datos = [
                    'evento_id' => $evento->id,
                    'registro_id' => $registro->id
                ];

                $registro_usuario = new EventosRegistro($datos);
                $registro_usuario->guardar();
            }

            //Almacenar el regalo
            $registro->sincronizar(['regalo_id' => $_POST['regalo_id']]);
            $resultado = $registro->guardar();

            if($resultado)
            {
                echo json_encode([
                    'resultado' => $resultado,
                    'token' => $registro->token
                ]);
            }
            else
            {
                echo json_encode([
                    'resultado' => false
                ]);
            }

            return;
        }

        $router->render('/registro/conferencias', [
            'titulo' => 'Elige Workshops y Conferencias',
            'eventos' => $eventos_formateados,
            'regalos' => $regalos
        ]);
    }
}