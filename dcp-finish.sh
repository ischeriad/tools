#!/bin/bash

find . \( -name '.DS_Store' -o -name '._*' \) -type f -delete
rm -rf .fseventsd/ lost+found/ .TemporaryItems/ .Trashes/
for i in *VF*; do cd $i; pwd; dcp-hashcheck ; cd ..; done
cd *OV*
dcp-hashcheck -v
cd ..
