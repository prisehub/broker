#!/bin/bash

# check the paths for Odoo and enterprise
# Enterprise last is not included in this repo to be compatible
# with Odoo.sh


ODOO_VERSION=12.0
ODOO_ROOT=~/developer/odoo/$ODOO_VERSION/odoo
ENTERPRISE=~/developer/odoo/$ODOO_VERSION/enterprise
THEME=~/developer/odoo/$ODOO_VERSION/design-themes
ODOO_BIN=odoo-bin

ADDONS_PATH=$ODOO_ROOT/addons,$ENTERPRISE,$THEME

for d in $(ls -1d OCA/* prisehub/*); do
    echo "directory" $d
    ADDONS_PATH=$ADDONS_PATH,$(pwd)/$d
done



python $ODOO_ROOT/$ODOO_BIN --addons-path=$ADDONS_PATH $@
