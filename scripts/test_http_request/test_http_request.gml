function test_http_request() {
    var test_url = "https://httpbin.org/get"; // site de test pentru cereri HTTP
    var headers = ds_map_create();
    var req_id = http_request(test_url, "GET", headers, "");
    ds_map_destroy(headers);
    show_debug_message("Request ID: " + string(req_id));
}