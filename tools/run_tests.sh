#!/bin/bash
dotnet test /sln/DockerDotTest.sln -c release --no-build --no-restore --logger "trx" --results-directory /dockerdottest -v minimal
