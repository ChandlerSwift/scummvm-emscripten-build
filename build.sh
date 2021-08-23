#!/bin/bash

export PATH=/usr/share/emscripten/system/bin:$PATH
export CXX=em++
export LDFLAGS="-O2 -s TOTAL_MEMORY=268435456 --preload-file /root/baseball/@/baseball/"

emconfigure # get past the first-run configuration; this is a no-op later on

# may need to add:
    # --disable-all-engines \
    # --enable-engine-static=scumm \
emconfigure ./configure \
    --backend=sdl \
    --disable-bink \
    --disable-mt32emu \
    --disable-16bit \
    --disable-scalers \
    --disable-hq-scalers \
    --disable-alsa \
    --disable-vorbis \
    --disable-tremor \
    --disable-mad \
    --disable-flac \
    --disable-zlib \
    --disable-opengl \
    --disable-png \
    --disable-theoradec \
    --disable-faad \
    --disable-fluidsynth \
    --disable-nasm \
    --disable-readline \
    --disable-libunity \
    --disable-sndio \
    --disable-timidity \
    --with-sdl-prefix=/usr/share/emscripten/system

emmake make -j8 # or your favorite number of threads
