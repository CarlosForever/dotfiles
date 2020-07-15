if [ $(grep -r "RUNNING" /proc/asound | wc -l) -eq 0 ]; then
    echo no
fi
