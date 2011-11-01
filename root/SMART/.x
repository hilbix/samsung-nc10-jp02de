#!/bin/bash

now="`date +%Y%m%d-%H%M%S`"

smart()
{
smartctl -d ata --all /dev/$1 > "$now.$1"
}

smart sda
