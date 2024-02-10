function fish_right_prompt
    set -l __last_command_exit_status $status
    set -l __last_command_duration $CMD_DURATION

    set -l normal (set_color normal)
    set -l digit (set_color -d magenta)
    set -l ds (set_color -d green) '/'
    set -l ts (set_color -d green) ':'

    set -l year $digit(date '+%y')
    set -l month $digit(date '+%m')
    set -l day $digit(date '+%d')

    set -l hour $digit(date '+%H')
    set -l minute $digit(date '+%M')
    set -l second $digit(date '+%S')

    set -l status_code ""
    if test $__last_command_exit_status != 0
        set status_code (set_color -o red) "$__last_command_exit_status "
    end

    set -l duration ""
    if [ $__last_command_duration -gt 30000 ]
        set duration (set_color -o green) (humantime $__last_command_duration) ' '
    end

    echo -n -s $duration $status_code $normal $year $ds $month $ds $day ' ' $hour $ts $minute $ts $second $normal
end

function humantime --argument-names ms --description "Turn milliseconds into a human-readable string"
    set --query ms[1] || return

    set --local secs (math --scale=1 $ms/1000 % 60)
    set --local mins (math --scale=0 $ms/60000 % 60)
    set --local hours (math --scale=0 $ms/3600000)

    test $hours -gt 0 && set --local --append out $hours"h"
    test $mins -gt 0 && set --local --append out $mins"m"
    test $secs -gt 0 && set --local --append out $secs"s"

    set --query out && echo $out || echo $ms"ms"
end
