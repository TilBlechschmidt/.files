$env.PERL5LIB = "/Users/tibl/perl5/lib/perl5" # ${PERL5LIB:+:${PERL5LIB}}
$env.PERL_LOCAL_LIB_ROOT = "/Users/tibl/perl5" # ${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}
$env.PERL_MB_OPT = "--install_base \"/Users/tibl/perl5\""
$env.PERL_MM_OPT = "INSTALL_BASE=/Users/tibl/perl5"

$env.PATH = ($env.PATH | split row (char esep) | prepend '/Users/tibl/perl5/bin')
