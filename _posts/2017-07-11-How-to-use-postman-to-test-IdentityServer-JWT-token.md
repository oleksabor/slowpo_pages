---
layout: post
title: How to use postman to test IdentityServer (JWT token)
date: 2017-07-11 13:17 
tags: [jwt,IdentityServer]
category: dev
lang: en
---
Today I've got a taks to test web `.net core` application that uses the `IdentityServer` as an authorization Web core extention.

I've downloaded `IdentityServer 4` samples
```
git clone https://github.com/IdentityServer/IdentityServer4.Samples.git
```
Then I've used `Postman` (v5.2.0) to create `GET` request to the url from the `quick start 1_ClientCredentials`

http://localhost:5001/identity

In the postman params authorization tab I've selected `OAuth 2.0` entry and have requested for a new token.
Token name can have any value


Auth URL I've set to the `http://localhost:5000/connect/authorize` (the IdentityServer sample resource service)

Access token URL I've set to the `http://localhost:5000/connect/token`

Client ID: `client` (because of IdentityServer sample hardcoded client id)

Client secret: `secret`

Scope: `api1`

Grant type: `Client credentials`

When a token is requested it is shown in the list on the left window part. 
Press the `Use token button` and then you are ready to send a `Get` request to the `http://localhost:5001/identity`

