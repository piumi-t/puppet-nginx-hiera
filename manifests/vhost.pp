define nginx::vhost(
  $port               = 80,
  $priority           = '50',
  $server_aliases     = '',
  $enable             = true,
  $config_owner       = $::nginx::config_owner,
  $confgi_group       = $::nginx::config_group,
  $config_mode        = $::nginx::config_mode,
  $config_vdir_enable = $::nginx::config_vdir_enable,
  $config_log_dir     = $::nginx::config_log_dir,
  $vhost_dir          = $::nginx::vhost_dir,
) {
  $vhost_docroot = "${::nginx::docroot}/${name}"

  file { "${vhost_dir}/${priority}-${name}.conf":
    ensure  => file,
    content => template("${module_name}/vhost/vhost.conf.erb"),
    mode    => $config_mode,
    owner   => $config_owner,
    group   => $config_group,
    notify  => Service['nginx_service'],
  }

  file { $vhost_docroot:
    ensure => directory,
    mode   => '0755',
    owner  => $config_owner,
    group  => $config_group,
  }
}
