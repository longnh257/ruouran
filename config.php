<?php
// HTTP
define('HTTP_SERVER', 'http://' . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/');

// HTTPS
define('HTTPS_SERVER', 'https://' . $_SERVER['HTTP_HOST'] .rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/');

// DIR
define('DIR_APPLICATION', realpath(dirname(__FILE__)) .'/catalog/');
define('DIR_SYSTEM', realpath(dirname(__FILE__)) .'/system/');
define('DIR_DATABASE', realpath(dirname(__FILE__)) .'/system/database/');
define('DIR_LANGUAGE', realpath(dirname(__FILE__)) .'/catalog/language/');
define('DIR_TEMPLATE', realpath(dirname(__FILE__)) .'/catalog/view/theme/');
define('DIR_CONFIG', realpath(dirname(__FILE__)) .'/system/config/');
define('DIR_IMAGE', realpath(dirname(__FILE__)) .'/image/');
define('DIR_CACHE', realpath(dirname(__FILE__)) .'/system/cache/');
define('DIR_DOWNLOAD', realpath(dirname(__FILE__)) .'/download/');
define('DIR_LOGS', realpath(dirname(__FILE__)) .'/system/logs/');
define('DIR_MODIFICATION', realpath(dirname(__FILE__)) .'/system/modification/');

// DB
if (file_exists('database/cfg.php')) {
    require_once('database/cfg.php');
}
?>