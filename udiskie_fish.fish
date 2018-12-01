

function run_udiskie
    if ps -a | grep -o udiskie > /dev/null
        echo "si esta udiskie"
    else
        fish -c "udiskie -at &"
    end
end

run_udiskie