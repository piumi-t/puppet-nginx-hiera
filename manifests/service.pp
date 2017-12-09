class nginx::service(
  $service_name       = $::nginx::service_name,
  $service_ensure     = $::nginx::service_ensure,
  $service_pattern    = $::nginx::service_pattern,
  $service_enable     = $::nginx::service_enable,
  $service_hasstatus  = $::nginx::service_hasstatus,
  $service_hasrestart = $::nginx::service_hasrestart,
) {
  service { 'nginx_service':
    ensure     => $ensure,
    name       => $service_name,
    enable     => $enable,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    pattern    => $pattern,
  }
}

