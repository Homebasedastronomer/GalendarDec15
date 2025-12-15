<?php
// logout.php - Logout script
require_once 'config.php';

if (session_status() !== PHP_SESSION_ACTIVE) {
	session_start();
}

logActivity('logout', 'User logged out');

// Regenerate session ID to invalidate the previous identifier
session_regenerate_id(true);

// Destroy all session data and cookies
$_SESSION = [];

if (ini_get('session.use_cookies')) {
	$params = session_get_cookie_params();
	setcookie(session_name(), '', time() - 42000, $params['path'], $params['domain'], $params['secure'], $params['httponly']);
}

session_destroy();
session_write_close();

preventSensitiveCaching();

// Redirect to login page
header("Location: login.php");
exit();
?>