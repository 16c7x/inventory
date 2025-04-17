# @summary This configures the inventory script
#
# The inventory script access the puppet API to 
# return a list of servers
#
# @param output_dir
#   The directory where we are going to store the output files
#
class inventory (
  String $output_dir = '/var/log/puppetlabs/inventory',
) {
  $script_path = '/usr/local/bin/get_puppet_inventory.sh'

  file { $script_path:
    ensure  => file,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => epp('inventory/get_puppet_inventory.sh.epp', { 'output_dir' => $output_dir }),
  }

  file { $output_dir:
    ensure => directory,
  }

  exec { 'run_puppet_inventory_script':
    command     => $script_path,
    path        => ['/bin', '/usr/bin', '/usr/local/bin'],
    refreshonly => false,
    logoutput   => true,
    require     => File[$script_path, $output_dir],
  }
}
