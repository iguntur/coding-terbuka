<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', '127.0.0.1:33011' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '#@pe,|ic.N^:D>qTo+] }:71t)}Qo)]Sp-A6Oj#7`|xFyYBw9]FVzH}X?0i4Sul ' );
define( 'SECURE_AUTH_KEY',   '*Zhc/Ixtz5twJ|}j#R7,/fL#K]Z6!d=78hExK5K]CqP:n>[NT=le2]KHd5|@h_^k' );
define( 'LOGGED_IN_KEY',     ';(C}-^(&F5}_lVmvL`65UtqYy16[FNG5-w9P/C&v%quq`hnBFK.q[Ula_L+hE`WN' );
define( 'NONCE_KEY',         '4AUZ5V fL4QAHFvlgi^f6=fxUdBjQz|C~^g~a[sE[,V&q`95@J>MKdmiEv0z>xvD' );
define( 'AUTH_SALT',         'oeqy mDF;=Ge{=^}mq,l[&x)n_[%)Tn;97t6(au0X^`q(=R/o|?LEL!4wA70iqwM' );
define( 'SECURE_AUTH_SALT',  '`.FEb$O,TxK?:uW6h-J$J*h7a,VF0%r:To#SN_6qmW^7cgfa$K>$cBS!}>2XZ%V$' );
define( 'LOGGED_IN_SALT',    'L~,s<0z|:pMhfRk{:ufXfgE#SD{tKxDH.LN6]Cv6}d5vOw<*D0Y$ Rs:V$&}03Ob' );
define( 'NONCE_SALT',        'oe&W=Q=juj57~b/T{oC#OpUZ&e3{46h8[I+~30*s;Rh<_lSvZbaEWaGs]+E 01dQ' );
define( 'WP_CACHE_KEY_SALT', 'Oi!T soyfXXB_~C15%Ypy!/5*qx%&A:J9:G[|j8{DzhjQRLdna^^iP(y:!+K~;sf' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
