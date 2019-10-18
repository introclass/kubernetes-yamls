#! /bin/sh
#
# 01-create-user.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com wechat: lijiaocn>
#
# Distributed under terms of the GPL license.
#

htpasswd -c auth foo

kubectl -n demo-echo create secret generic basic-auth --from-file=auth

kubectl -n demo-echo get secret basic-auth -o yaml
