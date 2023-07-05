FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY src/ ./
RUN dotnet restore "Otus.Teaching.PromoCodeFactory.sln"
RUN dotnet build "Otus.Teaching.PromoCodeFactory.sln" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Otus.Teaching.PromoCodeFactory.WebHost/Otus.Teaching.PromoCodeFactory.WebHost.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish ./
CMD dotnet Otus.Teaching.PromoCodeFactory.WebHost.dll