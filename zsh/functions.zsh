makeqemu() {
    qemu-img create -f qcow2 $1 "$2"G
}
formatiso() {
    sudo mkfs -t $1 -Q -L usbdisk $2
}
bakeiso() {
    sudo dd if=$1 of=$2 bs=16M
}
yt-aria() {
    yt-dlp --external-downloader aria2c $1
}
