package v2

default allow = false


# Rule to allow GET operations on /v2/
allow {
    input.user == "user"
    input.method == "GET"
    input.path == "/v2/"
}

# Rule to allow GET operations on image manifests
allow {
    input.user == "user"
    input.method == "GET"
    regex.match("^/v2/.+/manifests/.*$", input.path)
}

# Rule to allow GET operations on image blobs
allow {
    input.user == "user"
    input.method == "GET"
    regex.match("^/v2/.+/blobs/.*$", input.path)
}

# Rule to allow POST operations for image blob uploads
allow {
    input.user == "user"
    input.method == "POST"
    regex.match("^/v2/.+/blobs/uploads.*$", input.path)
}

# Rule to allow PUT operations for finalize image blobs uploads 
allow {
    input.user == "user"
    input.method == "PUT"
    regex.match("^/v2/.+/blobs/uploads/.+$", input.path)
}

# Rule to allow PATCH operations blobs uploads
allow {
    input.user == "user"
    input.method == "PATCH"
    regex.match("^/v2/.+/blobs/uploads/.+$", input.path)
}

# Rule to allow HEAD operations to verifies blob consistency
allow {
    input.user == "user"
    input.method == "HEAD"
    regex.match("^/v2/.+/blobs/.+$", input.path)
}

# rule to allow DELETE operations on image manifests
allow {
    input.user == "user"
    input.method == "DELETE"
    regex.match("^/v2/.+/manifests/.*$", input.path)
}