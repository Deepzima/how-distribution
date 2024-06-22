local http = require "resty.http"
local cjson = require "cjson"

local function authorize(user)
    ngx.log(ngx.ERR, "Starting authorization for user: ", user)

    local httpc = http.new()
    local res, err = httpc:request_uri("http://opa:8181/v1/data/v2/allow", {
        method = "POST",
        body = cjson.encode({
            input = {
                user = user,
                method = ngx.req.get_method(),
                path = ngx.var.uri,
            }
        }),
        headers = {
            ["Content-Type"] = "application/json",
        },
    })

    if not res then
        ngx.log(ngx.ERR, "Failed to request OPA: ", err)
        ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
        ngx.say("Internal Server Error")
        return ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
    end

    ngx.log(ngx.ERR, "OPA response status: ", res.status)
    ngx.log(ngx.ERR, "OPA response body: ", res.body)
    
    local body = cjson.decode(res.body)
    if not body.result then
        ngx.status = ngx.HTTP_FORBIDDEN
        ngx.say("Access Denied")
        return ngx.exit(ngx.HTTP_FORBIDDEN)
    end

    ngx.log(ngx.INFO, "Access granted")
end

return authorize