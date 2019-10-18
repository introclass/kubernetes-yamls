#! /bin/sh
#
# github-oauth-proxy.sh
# Copyright (C) 2019 lijiaocn <lijiaocn@foxmail.com wechat:lijiaocn>
#
# Distributed under terms of the GPL license.
#

# OAUTH2_PROXY_COOKIE_SECRET 的生成方法：
# docker run -ti --rm python:3-alpine python -c 'import secrets,base64; print(base64.b64encode(base64.b64encode(secrets.token_bytes(16))));' 

docker rm -f  github_oauth2_proxy 
docker run -idt  \
--name=github_oauth2_proxy \
-e OAUTH2_PROXY_CLIENT_ID=7815f43623266fe99da8 \
-e OAUTH2_PROXY_CLIENT_SECRET=9a55d911ab2f93f9bbfbd44a7274d3255cd8b7b4 \
-e OAUTH2_PROXY_COOKIE_SECRET=dWJQL0pvN3NFY21UVVp3dGhUZHlpQT09 \
-p 4180:4180 \
lijiaocn/oauth2_proxy:v4.0.0  \
--provider=github \
--email-domain=* \
--upstream=file:///dev/null \
--http-address=0.0.0.0:4180

#-redirect-url="http://auth-oauth2-ext.echo.example:30933/oauth2/callback"

#  -redirect-url string
#    |  the OAuth Redirect URL. ie: "https://internalapp.yourcompany.com/oauth2/callback"
