package v2

default allow = false

allow {
    input.user == "user"
    input.method == "GET"
    input.path == "/v2/"
}
