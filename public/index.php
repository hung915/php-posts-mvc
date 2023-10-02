<?php

/**
 * Front controller of the app
 */


/**
 * Composer Autoload
 */
require dirname(__DIR__) . '/vendor/autoload.php';


/**
 * Error and Exception handling
 */
error_reporting(E_ALL);
set_error_handler('Core\Error::errorHandler');
set_exception_handler('Core\Error::exceptionHandler');


/**
 * Routing
 */
$router = new Core\Router();

$router->add('', ['controller' => 'Home', 'action' => 'index']);
$router->add('setup', ['controller' => 'Setup', 'action' => 'new']);
$router->add('register', ['controller' => 'Register', 'action' => 'new']);
$router->add('login', ['controller' => 'Login', 'action' => 'index']);
$router->add('logout', ['controller' => 'Logout', 'action' => 'index']);
$router->add('posts', ['controller' => 'Posts', 'action' => 'view']);
$router->add('posts/', ['controller' => 'Posts', 'action' => 'list']);
$router->add('posts/{id:\d+}', ['controller' => 'Posts', 'action' => 'get']);
$router->add('posts/{id:\d+}/', ['controller' => 'Posts', 'action' => 'detail']);

$router->add('admin', ['namespace' => 'Admin', 'controller' => 'Home', 'action' => 'index']);
$router->add('admin/logout', ['namespace' => 'Admin', 'controller' => 'Logout', 'action' => 'index']);
$router->add('admin/posts', ['namespace' => 'Admin', 'controller' => 'Posts', 'action' => 'view']);
$router->add('admin/posts/', ['namespace' => 'Admin', 'controller' => 'Posts', 'action' => 'list-add']);
$router->add('admin/posts/{id:\d+}', ['namespace' => 'Admin', 'controller' => 'Posts', 'action' => 'get']);
$router->add('admin/posts/{id:\d+}/', ['namespace' => 'Admin', 'controller' => 'Posts', 'action' => 'show-update-destroy']);
$router->add('admin/{controller}/{action}', ['namespace' => 'Admin']);
$router->add('admin/{controller}/{id:\d+}/{action}', ['namespace' => 'Admin']);
$router->add('{controller}/{id:\d+}/{action}');
$router->add('{controller}/{action}');


$router->dispatch($_SERVER['QUERY_STRING']);