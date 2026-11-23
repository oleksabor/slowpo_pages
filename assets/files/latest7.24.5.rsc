# 2026-11-23 22:52:39 by RouterOS 7.24.5
# software id = K132-9TMK
#
# model = A42G-HbeP
/interface bridge
add name=bridge1
/interface list
add name=WAN
add name=LAN
/interface wifi configuration
add country=Ukraine disabled=no dtim-period=3 installation=indoor mode=ap \
    name=cfg1 security.authentication-types=wpa2-psk,wpa3-psk ssid=tykPikR
/interface wifi
add configuration=cfg1 configuration.mode=ap .ssid=tykPikR disabled=no \
    mac-address=D2:EA:11:E3:67:1D mld-name=mld-d0ea11e3671d name=mld1 \
    security.authentication-types=wpa2-psk,wpa3-psk
set [ find default-name=wifi1 ] channel.band=2ghz-be .skip-dfs-channels=\
    10min-cac .width=20/40mhz configuration=cfg1 configuration.mode=ap .ssid=\
    tykPikR disabled=no mld-interface=mld1 security.authentication-types=\
    wpa2-psk,wpa3-psk
set [ find default-name=wifi2 ] channel.band=5ghz-be .skip-dfs-channels=\
    10min-cac .width=20/40/80mhz configuration=cfg1 configuration.mode=ap \
    .ssid=tykPikR disabled=no mld-interface=mld1 \
    security.authentication-types=wpa2-psk,wpa3-psk
/ip pool
add name=dhcp_pool1 ranges=192.168.99.20-192.168.99.254
/ip dhcp-server
add address-pool=dhcp_pool1 interface=bridge1 lease-time=1d30m name=dhcp1
/interface bridge port
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether4
add bridge=bridge1 interface=mld1
/ip neighbor discovery-settings
set add-dns-entries=yes discover-interface-list=LAN
/ipv6 settings
set disable-ipv6=yes
/interface list member
add interface=ether1 list=WAN
add interface=bridge1 list=LAN
/ip address
add address=192.168.99.1/24 interface=bridge1 network=192.168.99.0
/ip dhcp-client
add interface=ether1 name=client1
/ip dhcp-server network
add address=192.168.99.0/24 gateway=192.168.99.1
/ip dns static
add address=192.168.99.1 name=router.lan type=A
/ip firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1 \
    in-interface=lo src-address=127.0.0.1
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    in-interface-list=!LAN
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    in-interface-list=WAN
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN
/system clock
set time-zone-name=Europe/Kyiv
