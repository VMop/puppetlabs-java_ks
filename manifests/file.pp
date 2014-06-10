# java keystore file
define java_ks::file (
  $filepath,
  $storepass,
  $keypass,
  $keystore_alias = $name,
  $command        = '/usr/java/default/bin/keytool',
  $algorithm      = 'RSA',
  $keysize        = 2048,
  $cn             = $::hostname,
  $organization   = 'VMware',
  $country        = 'US',
  $validity       = 365,
) {

  exec { "java_ks ${name}":
    command => "${command} -genkey -alias ${keystore_alias} -keyalg ${algorithm} -keysize ${keysize} -validity ${validity} -dname \"CN=${cn},O=${organiztion},C=${country}\" -keystore ${filepath} -storepass ${storepass} -keypass ${keypass}",
    creates => $filepath,
  }
}
