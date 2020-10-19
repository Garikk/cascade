#!/bin/sh
# i - interface - elm
# s - tty device - /dev/ttyUDB0
# b - tty device boudrate
# f - ELM protocol selector, 0 - autoselect
sudo ./cascade -i elm -s /dev/ttyUSB0  -b 38400 -f 0
