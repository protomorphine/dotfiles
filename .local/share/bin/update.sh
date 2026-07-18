#!/usr/bin/env bash

aurHelper="yay"

aur=$(${aurHelper} -Qua | wc -l)
ofc=$( (while pgrep -x checkupdates > /dev/null ; do sleep 1; done) ; checkupdates | wc -l)

upd=$(( ofc + aur ))

updatesAvailable ()
{
    if [[ $upd == 0 ]]; then
        exit 1
    fi

    exit 0
}

getCounter ()
{
    printf $upd
    exit 0
}

update ()
{
    fastfetch

    printf "[Official] %-10s\n[AUR]      %-10s\n" "$ofc" "$aur"

    ${aurHelper} -Syu
    read -n 1 -p 'Press any key to continue...'
}

case "$1" in
    "-a") updatesAvailable ;;
    "-c") getCounter ;;
    *) update ;;
esac

