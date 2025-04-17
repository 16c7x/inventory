# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class inventory {
  $file_path = '/usr/local/bin/get_puppet_inventory.sh'
  $output_dir = '/var/tmp'

  file { $file_path:
    ensure  => file,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => epp('inventory/get_puppet_inventory.epp', { 'output_dir' => $output_dir }),
  }
}
