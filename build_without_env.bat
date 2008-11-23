del build\*.* /Q
del external-bin\NServiceBus.dll
del external-bin\NServiceBus.pdb
del external-bin\NServiceBus.xml
cd src\ObjectBuilder
msbuild
cd ..\..\src\core
msbuild 
cd ..\..\src\utils
msbuild
cd ..\..\src\messageInterfaces
msbuild
cd ..\..\src\unicast
msbuild 
cd ..\..\src\impl\messageInterfaces
msbuild
cd ..\..\..\src\impl\unicast\NServiceBus.Unicast.Msmq
msbuild
cd ..\..\..\..\src\impl\unicast\NServiceBus.Unicast.Subscriptions.Msmq
msbuild
cd ..\..\..\..\src\impl\unicast\NServiceBus.Unicast.Subscriptions.DB
msbuild
cd ..\..\..\..\src\impl\SagaPersisters\DbBlobSagaPersister
msbuild
cd ..\..\..\..\src\impl\SagaPersisters\NHibernateSagaPersister
msbuild
cd ..\..\..\..\src\impl\Serializers
msbuild
cd ..\..\..\src\impl\ObjectBuilder.SpringFramework
msbuild
cd ..\..\..\src\multicast\NServiceBus.Multicast
msbuild
cd ..\..\..\src\grid
msbuild
cd ..\..
xcopy build build\merge /Q /Y
xcopy external-bin build\merge /Q /Y
external-bin\ilmerge /log:build\output.txt /target:library /xmldocs /out:NServiceBus.dll build\merge\NServiceBus.dll build\merge\Interop.MSMQ.dll build\merge\
del build\merge\*.* /Q
move NServiceBus.dll external-bin
move NServiceBus.pdb external-bin
move NServiceBus.xml external-bin
cd src\testing
msbuild
cd ..\..\src\distributor\NServiceBus.Unicast.Distributor
msbuild
cd ..\..\..\src\distributor\MsmqWorkerAvailabilityManager
msbuild
cd ..\..\..\src\distributor\NServiceBus.Unicast.Distributor.Runner
msbuild
cd ..\..\..\src\tools\management\Grid
msbuild
cd ..\..\..\..\src\tools\management\Errors\ReturnToSourceQueue
msbuild
cd ..\..\..\..\..\src\timeout
msbuild
cd ..\..\Samples\AsyncPages
msbuild
cd ..\..\Samples\WebServiceBridge
msbuild
cd ..\..\Samples\FullDuplex
msbuild
cd ..\..\Samples\PubSub
msbuild
cd ..\..\Samples\Manufacturing
msbuild
cd ..\..\