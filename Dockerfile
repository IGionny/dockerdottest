#Stage 1 - BUILD
FROM microsoft/dotnet:2.1.400-sdk-stretch as builder
WORKDIR /sln

# Copy all files
COPY ./DockerDotTest.sln ./
COPY ./tests ./tests

#Build in release mode
RUN dotnet build -c Release

#RUN mkdir /sln && mkdir /sln/tests && mkdir /sln/tools && mkdir /dockerdottest

RUN mkdir /dockerdottest

ENV ASPNETCORE_ENVIRONMENT Production

COPY ./tools ./tools

RUN chmod +x /sln/tools/run_tests.sh

VOLUME ["/dockerdottest/"]

ENTRYPOINT ["/sln/tools/run_tests.sh"]

#docker run --name test -v /data/tests:/dockerdottest/ 93707521dd1a
#docker run --name test -it --entrypoint=/bin/bash -v /data/tests:/dockerdottest/ 55f745a3a41e
#docker run -it <image> /bin/bash
