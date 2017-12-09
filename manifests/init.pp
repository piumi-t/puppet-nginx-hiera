class nginx(
  $package_ensure,
  $package_name,
  $config_dir,
  $config_ensure,
  $config_mode,
  $config_owner,
  $config_group,
  $config_confd,
  $config_log_dir,
  $config_pid_file,
  $config_vdir_enable_debian,
  $config_vdir_enable_default,
  $config_process_user_debian,
  $config_process_user_default,
  $vhost_dir_debian,
  $vhost_dir_default,
  $service_name,
  $service_ensure,
  $service_pattern,
  $service_enable,
  $service_hasstatus,
  $service_hasrestart,
  $docroot,
){
 contain nginx::install
 contain nginx::config
 contain nginx::service

 Class['nginx::install']
 ->Class['nginx::config']
 ~>Class['nginx::service']
}
