package = "lua-resty-opa-auth"
version = "1.0-1"
source = {
  url = "git://github.com/deepzima/lua-resty-auth"
}

description = {
  summary = "A Lua authentication and authorization module for OpenResty",
  detailed = "This module provides authentication and authorization functionalities using OpenResty and OPA.",
  homepage = "https://github.com/deepzima/lua-resty-auth",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1",
  "lua-resty-http >= 0.13",
  "lua-cjson >= 2.1"
}

build = {
  type = "builtin",
  modules = {
    ["opa_auth"] = "opa_auth/init.lua",
    ["opa_auth.authenticate"] = "opa_auth/authenticate.lua",
    ["opa_auth.authorize"] = "opa_auth/authorize.lua",
  }
}
