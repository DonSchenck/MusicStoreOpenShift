FROM rhel7

RUN yum install -y libicu libuuid libcurl openssl libunwind tar sqlite-devel && mkdir /dotnet && curl https://dotnetcli.blob.core.windows.net/dotnet/beta/Binaries/Latest/dotnet-dev-rhel-x64.latest.tar.gz | tar -xvz -C /dotnet

ADD . /app

WORKDIR /app

RUN /dotnet/dotnet restore

EXPOSE 5000

CMD /dotnet/dotnet run --framework netcoreapp1.0

