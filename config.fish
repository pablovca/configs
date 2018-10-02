set -g -x QT_QPA_PLATFORMTHEME "qt5ct"
set -g -x QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
set -g -x PATH $PATH /home/pablo/bin/
set -g -x PATH $PATH /home/pablo/bin/Telegram
set -g -x PATH $PATH /home/pablo/bin/Popcorn-Time-0.3.10-Linux-64
set -g -x PATH $PATH /home/pablo/.citra/nightly
set -g -x LD_LIBRARY_PATH $LD_LIBRAY_PATH /home/pablo/.citra/nightly
set -g -x TERMINAL kitty
set -g -x WINEPREFIX ~/.wine

function run_udiskie
    set udiskie (pgrep udiskie)
    echo $udiskie
    if [ ! $udiskie ]
        echo "no esta corriendo"
        command nohup udiskie -t > /dev/null 2>&1 &
    end
end

run_udiskie

    #if test ! "udiskie" = $u
     #   echo "si esta udiskie"
	#set pid (ps -C udiskie -o pid | grep "[[:digit:]]")
        #echo $pid
	#echo "corriendo udiskie"
        #command nohup udiskie -at > /dev/null 2>&1 &
	#set pid (ps -C udiskie -o pid | grep "[[:digit:]]")
	#set pid eval $pid_command\
	#echo $pid
        #nohup $pid
        #return 0
    #else
    #    echo "no esta udiskie"
    #end    