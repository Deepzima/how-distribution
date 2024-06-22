local cjson = require "cjson"
local http = require "resty.http"

local function authenticate()
    local headers = ngx.req.get_headers()
    local auth_header = headers["Authorization"]

    if not auth_header then
        ngx.status = ngx.HTTP_UNAUTHORIZED
        ngx.header["WWW-Authenticate"] = 'Basic realm="Registry"'
        ngx.say("Missing Authorization header")
        return ngx.exit(ngx.HTTP_UNAUTHORIZED)
    end

    local encoded_credentials = string.sub(auth_header, 7)  -- Remove "Basic " prefix
    local decoded_credentials = ngx.decode_base64(encoded_credentials)
    local user, pass = decoded_credentials:match("([^:]+):([^:]+)")

    ngx.log(ngx.ERR, "Authenticated user: ", user or "nil")

    if user == "user" and pass == "password" then
        ngx.log(ngx.ERR, "User authenticated successfully", user)
        return user
    else
        ngx.status = ngx.HTTP_UNAUTHORIZED
        ngx.header["WWW-Authenticate"] = 'Basic realm="Registry"'
        ngx.say("Invalid credentials")
        return ngx.exit(ngx.HTTP_UNAUTHORIZED)
    end
end

return authenticate