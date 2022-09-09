
mount_opt() {
    local cefsroot=$1

    unlink /opt/compiler-explorer
    ln -sfT "/cefs/${cefsroot}" /opt/compiler-explorer

    mkdir -p /opt/intel
    mountpoint /opt/intel || mount --bind /efs/intel /opt/intel

    mkdir -p /opt/arm
    mountpoint /opt/arm || mount --bind /efs/arm /opt/arm

    [ -f /opt/.health ] || touch /opt/.health
    mountpoint /opt/.health || mount --bind /efs/.health /opt/.health

    echo "Done mounting"
}
