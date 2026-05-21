# Activate Swap OpenWrt

Creator: MEOWMEOW

Simple zram swap activation for OpenWrt/ReyreWRT.

Target config:

- zram size: `200 MiB`
- compression: `lz4`
- swap priority: `100`
- vm.swappiness: `80`

## Install / Apply

Run:

```sh
chmod +x activate-swap-openwrt.sh
./activate-swap-openwrt.sh
```

## Script

```sh
uci set system.@system[0].zram_size_mb='200'
uci set system.@system[0].zram_comp_algo='lz4'
uci set system.@system[0].zram_priority='100'
uci set system.@system[0].swapiness='80'
uci commit system

sysctl -w vm.swappiness=80

/etc/init.d/zram restart
```

## Verify Output

```sh
uci show system | grep -E 'zram|swap'
cat /proc/swaps
cat /proc/sys/vm/swappiness
cat /sys/block/zram0/comp_algorithm
```

Expected markers:

```txt
system.@system[0].swapiness='80'
system.@system[0].zram_size_mb='200'
system.@system[0].zram_comp_algo='lz4'
system.@system[0].zram_priority='100'
/dev/zram0 ... 204796 ... 100
80
... [lz4] ...
```
