FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -yy gcc g++ cmake git vim

COPY . ~/workspace/projects/suptertask
WORKDIR ~/workspace/projects/suptertask

RUN cmake -H. -B_build -DCMAKE_INSTALL_PREFIX=_install -DBUILD_TESTS=ON
RUN cmake --build _build --target install
RUN cmake --build _build --target test -- ARGS=--verbose
RUN cmake -H. -B_build -DCPACK_GENERATOR="TGZ"
RUN cmake --build _build --target package

ENTRYPOINT ./_build/demo 9
