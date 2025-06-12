function verify_correct_password(_salt, _pass, _hash) {
    var test_string = _salt + _pass;
    var test_hash = sha256_string(test_string);
    return (test_hash == _hash);
}