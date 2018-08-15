#Stage 1 - BUILD
FROM microsoft/dotnet:2.1.400-sdk-stretch as builder
WORKDIR /sln

COPY ./DockerDotTest.sln ./
COPY ./tests ./tests
COPY ./src ./src

RUN dotnet restore

RUN dotnet build -c Release

#Stage 2 - EXECUTE TESTS
FROM microsoft/dotnet:2.1.2-aspnetcore-runtime

WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT Production
COPY --from=builder ./app/ .

