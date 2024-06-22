## Explanation

Package: Defines the package name. All rules inside this file belong to the v2 package.

Default Rule: `default allow = false`

Set a default rule that denies access. If none of the allow rules match, access will be denied.
Allow Rule: allow

The allow rule defines the conditions under which access is permitted.

Conditions of the allow rule: 

* `input.user == "user"` Check that the user is user.
* `input.method == "GET"` Check that the HTTP method of the request is GET.

* `input.path == "/v2/"` Check that the request path is /v2/.



### Sample Requests

```(shell)
curl -X POST http://localhost:8181/v1/data/v2/allow \
  -H "Content-Type: application/json" \
  -d '{
  "input": {
    "user": "user",
    "method": "GET",
    "path": "/v2/"
  }
}
}

{"result":true}
```