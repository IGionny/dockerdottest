#Stage 1 - BUILD
FROM microsoft/dotnet:2.1.400-sdk-stretch as builder
WORKDIR /sln

# Copy all files
COPY ./DockerDotTest.sln ./
COPY ./tests ./tests
COPY ./tools ./tools

#Build in release mode
RUN dotnet build -c Release

#RUN mkdir /sln && mkdir /sln/tests && mkdir /sln/tools && mkdir /dockerdottest

RUN mkdir /dockerdottest

ENV ASPNETCORE_ENVIRONMENT Production

RUN chmod +x /sln/tools/run_tests.sh

VOLUME ["/dockerdottest/"]

ENTRYPOINT ["/sln/tools/run_tests.sh"]

#docker run --name test -v /data/tests:/dockerdottest/ b5160c481651
#docker run --name test -it --entrypoint=/bin/bash -v /data/tests:/dockerdottest/ b5160c481651
#docker run -it <image> /bin/bash
