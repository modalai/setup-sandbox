# raven

## Custom Camera Config

IMX412 on J6 Lower using M0076
MIPI Boson on J7 Lower using M0153

com.qti.sensormodule.imx412_fpv_0.bin
com.qti.sensormodule.boson_2.bin



## Static IP on USB-to-Ethernet Adapter

Custom systemd service to add `192.168.144.15`.

Add to a script:

```
ip addr flush dev eth0
ip link set dev eth0 up
ip addr add 192.168.144.15/255.255.255.0 dev eth0
```

## RSTP Stream to Herelink



