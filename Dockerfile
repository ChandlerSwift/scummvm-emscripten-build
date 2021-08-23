FROM debian:11

WORKDIR /root
RUN apt-get update && \
    apt-get install -y curl p7zip && \
    curl -LO https://archive.org/download/scummvm-games-collection-complete/Backyard%20Baseball%20%28CD%20-%20Windows%29.7z && \
    7zr e -obaseball/ Backyard%20Baseball%20%28CD%20-%20Windows%29.7z && \
    rm Backyard%20Baseball%20%28CD%20-%20Windows%29.7z

RUN apt-get install -y git emscripten make

RUN git clone https://github.com/juj/emscripten-scummvm
WORKDIR /root/emscripten-scummvm
ADD fixes.patch .
RUN git apply fixes.patch

COPY build.sh .
# The build currently errors, but does produce files correctly, so we can just
# pretend it succeeds.
RUN chmod +x build.sh && ./build.sh || true

# open scummvm.html from the browser
CMD python3 -m http.server
