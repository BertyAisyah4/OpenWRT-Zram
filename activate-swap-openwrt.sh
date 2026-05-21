#!/bin/sh
# Activate zram swap on OpenWrt/ReyreWRT
# Creator: MEOWMEOW

set -eu

echo "==> Applying zram swap config"
uci set system.@system[0].zram_size_mb='200'
uci set system.@system[0].zram_comp_algo='lz4'
uci set system.@system[0].zram_priority='100'
uci set system.@system[0].swapiness='80'
uci commit system

echo "==> Applying runtime vm.swappiness"
sysctl -w vm.swappiness=80

echo "==> Restarting zram swap"
/etc/init.d/zram restart

echo
echo "==> Result: UCI zram/swap config"
uci show system | grep -E 'zram|swap' || true

echo
echo "==> Result: active swap devices"
cat /proc/swaps

echo
echo "==> Result: vm.swappiness"
cat /proc/sys/vm/swappiness

echo
echo "==> Result: zram compression algorithm"
cat /sys/block/zram0/comp_algorithm
