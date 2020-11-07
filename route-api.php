<?php
require_once("Router.php");
require_once("./api/ComentariosApiController.php");
require_once("./api/CategoriasApiController.php");
require_once("./api/ProductosApiController.php");
require_once("./api/UsuariosApiController.php");

define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

// recurso solicitado
$resource = $_GET["resource"];

// método utilizado
$method = $_SERVER["REQUEST_METHOD"];

// instancia el router
$router = new Router();

// arma la tabla de ruteo
$router->addRoute("comentarios", "GET", "ProductosApiController", "getComentarios");
$router->addRoute("comentario/nuevo", "POST", "ProductosApiController", "nuevoComentario");
$router->addRoute("comentario/borrar/:ID", "DELETE", "ProductosApiController", "borrarComentario");
$router->addRoute("productos/","GET","ProductosApiController","getProductos");
$router->addRoute("categorias/","GET","CategoriasApiController","getCategorias");
$router->addRoute("usuarios/","GET","UsuariosApiController","getUsers");
$router->addRoute("usuarios/:ID","GET","UsuariosApiController","getUserById");
$router->addRoute("usuarios/:ID","PUT","UsuariosApiController","editUserById");


// rutea
$router->route($resource, $method);
