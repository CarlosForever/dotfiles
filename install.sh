if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

DEPS=(
    "git"
    "stow"
    "zsh"
    "htop"
    "notify-osd"
    "gnu-netcat"
    "xautolock"
    "unclutter"
    "xbindkeys"
    "libnotify"
)

for package in "${DEPS[@]}"; do
    pacman -S $package --noconfirm
done

function setup_consoles {
    echo -e "[Service]\nExecStart=\nExecStart=-/usr/bin/htop\nStandardInput=tty\nStandardOutput=tt" > /etc/systemd/system/getty@tty9.service.d/override.conf
    echo -e "[Service]\nExecStart=\nExecStart=-/usr/bin/agetty --autologin $(logname) --noclear %I" '$TERM' > /etc/systemd/system/getty@tty10.service.d/override.conf
    echo -e "[Service]\nExecStart=\nExecStart=-/usr/bin/agetty --autologin root --noclear %I" '$TERM' > /etc/systemd/system/getty@tty11.service.d/override.conf
    mkdir -p /etc/systemd/journald.conf.d
    echo -e "[Journal]\nForwardToConsole=yes\nTTYPath=/dev/tty12\nMaxLevelConsole=info" > /etc/systemd/journald.conf.d/fw-tty12.conf
    systemctl enable getty@tty9.service
    systemctl enable getty@tty10.service
    systemctl enable getty@tty11.service
    systemctl restart systemd-journald.service


}

function install_dotfiles {
    cd /home/$(logname)
    git clone https://github.com/CarlosForever/dotfiles.git
    cd dotfiles
    rm -f README
    rm -f _config.yml
    rm -rf /home/$(logname)/.*
    chown -R $(logname) /home/$(logname)/dotfiles
    stow *

}
function main {
    setup_consoles
    install_dotfiles
}

main
