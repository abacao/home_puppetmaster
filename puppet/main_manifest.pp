 base
node r_base {
  include site:hosts
}

# puppetmaster
node puppet inherits r_base {
}

# Gateway
node r_gw inherits r_base {
}

# puppet nodes
node /prod-webserver0[1|2]/ inherits r_gw {
}
