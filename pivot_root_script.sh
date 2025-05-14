#!/bin/sh
# -------------------------------------------------------------------
# WARNING: This script is intended to run in a minimal boot environment
# such as an initramfs shell, container, or rescue shell.
# Do NOT run this on a fully running Linux system — it may cause system failure.
# Ensure /dev/sda1 is the correct root device before running.
# -------------------------------------------------------------------

# Mount essential filesystems
mount -t proc none /proc
#!/bin/sh
# Mount essential filesystems
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs none /dev
# Mount new root filesystem (replace with actual device)
mount /dev/sda1 /mnt
# Prepare old_root directory
mkdir -p /mnt/old_root
# Move into new root
cd /mnt
# Do the pivot
pivot_root . old_root
# Unmount unnecessary mounts from old root
umount /old_root/proc
umount /old_root/sys
umount /old_root/dev
# Start the real init system
exec chroot . /sbin/init
