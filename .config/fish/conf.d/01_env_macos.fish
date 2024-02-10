if [ (uname) = "Darwin" ]
	# Homebrew (`brew shellenv fish`)
	set -gx HOMEBREW_PREFIX "/opt/homebrew";
	set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
	set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
	! set -q PATH; and set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
	! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
	! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

	# Perl
	set PERL5LIB "/Users/tibl/perl5/lib/perl5"
	set PERL_LOCAL_LIB_ROOT "/Users/tibl/perl5"
	set PERL_MB_OPT "--install_base \"/Users/tibl/perl5\""
	set PERL_MM_OPT "INSTALL_BASE=/Users/tibl/perl5"
	set PATH /Users/tibl/perl5/bin $PATH

	# iTerm2
	test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true
end
