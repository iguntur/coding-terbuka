{ pkgs, lib, config, inputs, ... }:
let
  httpPort = 8881;
  dbPort = 33011;
  wpRoot = "${config.devenv.root}/web";
in
{
  packages = [
    pkgs.wp-cli
  ];

  languages.php = {
    enable = true;
    version = "8.5";

    extensions = [
      "mysqli"
      "pdo_mysql"
      "gd"
      "zip"
      "intl"
      "exif"
      "imagick"
      "xdebug"
    ];

    ini = ''
      memory_limit = 256M
      upload_max_filesize = 64M
      post_max_size = 64M
      max_execution_time = 300

      ; dev only: tampilkan & catat semua error
      display_errors = On
      log_errors = On
      error_reporting = E_ALL

      ; xdebug.mode = debug
      ; xdebug.start_with_request = yes
      ; xdebug.client_port = 9003
    '';

    fpm.pools.web = {
      settings = {
        "pm" = "dynamic";
        "pm.max_children" = 10;
        "pm.start_servers" = 2;
        "pm.min_spare_servers" = 1;
        "pm.max_spare_servers" = 5;
        "catch_workers_output" = "yes";
      };
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    initialDatabases = [{ name = "wordpress"; }];
    ensureUsers = [{
      name = "wordpress";
      password = "wordpress";
      ensurePermissions = { "wordpress.*" = "ALL PRIVILEGES"; };
    }];
    settings.mysqld.port = dbPort;
  };

  services.caddy = {
    enable = true;
    virtualHosts."http://localhost:${toString httpPort}" = {
      extraConfig = ''
        root * ${wpRoot}
        php_fastcgi unix/${config.languages.php.fpm.pools.web.socket}
        file_server
      '';
    };
  };

  # Provisioning manual: jalankan `wp-setup` sekali
  scripts.wp-setup.exec = ''
    set -e
    mkdir -p "${wpRoot}"
    if [ ! -f "${wpRoot}/wp-load.php" ]; then
      wp core download --path="${wpRoot}"
    fi
    echo "WordPress files ready at ${wpRoot}"
  '';

  enterShell = ''
    echo ""
    echo "WordPress Development Environment"
    echo "=================================="
    echo "1. wp-setup      (download WordPress, sekali saja)"
    echo "2. devenv up     (start services)"
    echo "3. open http://localhost:${toString httpPort}"
    echo ""
    echo "Database (wp-config.php):"
    echo "  Host:     127.0.0.1:${toString dbPort}"
    echo "  Database: wordpress"
    echo "  User:     wordpress"
    echo "  Password: wordpress"
    echo ""
  '';
}

