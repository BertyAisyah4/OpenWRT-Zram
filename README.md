# OpenWRT Zram Swap

<pre>
 /\_/\
( o.o )  OpenWRT Zram Swap
 > ^ <   Creator: MEOWMEOW
</pre>

**Enable Zram On ReyreWRT**

Simple zram swap activation for OpenWrt/ReyreWRT.

Target config:

- zram size: `200 MiB`
- compression: `lz4`
- swap priority: `100`
- vm.swappiness: `80`

## Install / Apply

Run:

```sh
wget -O /tmp/activate-swap-openwrt.sh https://raw.githubusercontent.com/BertyAisyah4/OpenWRT-Zram/main/activate-swap-openwrt.sh && chmod +x /tmp/activate-swap-openwrt.sh && sh /tmp/activate-swap-openwrt.sh
```

## Notes
Edit Script Jika Merasa Swap Kurang.

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
