class nginx::install(
  $package_ensure = $::nginx::package_ensure,
  $package_name   = $::nginx::package_name,
) {
  package { 'nginx_package':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
