FROM mcr.microsoft.com/dotnet/sdk:8.0 as build-env

WORKDIR /app
COPY . . 

RUN dotnet publish -c Release --property:PublishDir=/out

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app
COPY --from=build-env /out .

ENTRYPOINT dotnet test.dll
