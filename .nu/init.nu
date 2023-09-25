source ~/.local/share/atuin/init.nu
source ~/.local/share/zoxide/init.nu

use module/kubernetes.nu *
use module/sockets.nu *

source alias/dotfiles.nu
use alias/zoxide.nu *
use alias/kube.nu *
use alias/git.nu *

use ./theme/nord.nu
$env.config = ($env.config | merge {color_config: (nord)})
