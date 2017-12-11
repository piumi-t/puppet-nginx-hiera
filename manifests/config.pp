class nginx::config(
  $config_dir                    = $::nginx::config_dir,
  $config_ensure                 = $::nginx::config_ensure,
  $config_mode                   = $::nginx::config_mode,
  $config_owner                  = $::nginx::config_owner,
  $config_group                  = $::nginx::config_group,
  $config_confd                  = $::nginx::config_confd,
  $config_log_dir                = $::nginx::config_log_dir,
  $config_pid_file               = $::nginx::config_pid_file,
  $config_vdir                   = $::nginx::config_vdir,
  $config_process_user           = $::nginx::config_process_user,
  # $config_process_user_default = $::nginx::config_process_user_default,
  #$vhost_dir                     = $::nginx::vhost_dir,
  # $vhost_dir_default           = $::nginx::vhost_dir_default,
  $docroot                       = $::nginx::docroot,
) {
  $config_vdir_enable = $facts['os']['family'] ? {
      'Debian' => $config_vdir_enable_debian,
    default  => $config_vdir_enable_default,
    }

    $config_process_user = $facts['os']['family'] ? {
      'Debian' => $config_process_user_debian,
      default  => $config_process_user_default,
       }
                            
      $vhost_dir = $facts['os']['family'] ? {
        'Debian' => $vhost_dir_debian,
        default  => $vhost_dir_default,
        }

  file { $config_confd:
    ensure  => 'directory',
    recurse => true,
    mode    => $config_mode,
    owner   => $config_owner,
    group   => $config_group,
  }

  file { 'nginx_conf':
    ensure  => $config_ensure,
    path    => "${config_dir}/nginx.conf",
    mode    => $config_mode,
    owner   => $config_owner,
    group   => $config_group,
    content => template("${module_name}/conf.d/nginx.conf.erb"),
  }

  file { $config_log_dir:
    ensure  => 'directory',
    recurse => true,
  }

  file { $docroot:
    ensure   => 'directory',
    recurse  => true,
    mode     => $config_mode,
    owner    => $config_owner,
    group    => $config_group,
  }
}

