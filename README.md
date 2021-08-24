# scummvm-emscripten-build

Tested working with
 * `debian:11`
 * emscripten `Package: emscripten, Version: 2.0.12~dfsg-2` (check with `apt show emscripten`)

To build:

```sh
git clone https://github.com/ChandlerSwift/scummvm-emscripten-build
cd scummvm-emscripten-build
docker build -t test .
```

To play:
```sh
docker run -d -p 8000:8000 test
```
Open http://localhost:8000/scummvm.html
