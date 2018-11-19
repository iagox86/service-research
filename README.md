Welcome to my Windows Service research project! I'm hoping to find other
services that are vulnerable to WebExec-like bugs.

The first step is to find other services that can be remotely started, such as
the mozilla update service. There are a pair of PowerShell scripts in this repo
for that purpose.

`find-remotely-startable-services.ps` is a tool that will list out services that
can be started remotely. Its output should look like this:

```
Z:\projects\service-research>powershell -exec bypass .\find-remotely-startable-services.ps1

sd          : D:(A;;CCLCSWRPWPLORC;;;BU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCS
              WRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;
              ;SU)
Name        : MozillaMaintenance
DisplayName : Mozilla Maintenance Service
PathName    : "C:\Program Files (x86)\Mozilla Maintenance Service\maintenancese
              rvice.exe"
Description : The Mozilla Maintenance Service ensures that you have the latest
              and most secure version of Mozilla Firefox on your computer. Keep
              ing Firefox up to date is very important for your online security
              , and Mozilla strongly recommends that you keep this service enab
              led.

```

`dump-remotely-startable-services.ps` is similar, except it dumps the service
information to a CSV file called `services.csv`:

```
Z:\projects\service-research>powershell -exec bypass .\dump-remotely-startable-services.ps1

Z:\projects\service-research>type services.csv
#TYPE Selected.System.Management.ManagementObject
"sd","Name","DisplayName","PathName","Description"
"D:(A;;CCLCSWRPWPLORC;;;BU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDR
CWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)","MozillaMaintenance","M
ozilla Maintenance Service","""C:\Program Files (x86)\Mozilla Maintenance Servic
e\maintenanceservice.exe""","The Mozilla Maintenance Service ensures that you ha
ve the latest and most secure version of Mozilla Firefox on your computer. Keepi
ng Firefox up to date is very important for your online security, and Mozilla st
rongly recommends that you keep this service enabled."
```

In either case, if you find any interesting services, please share them with me!
I'm happy to do any amount of triage or research on what's going on! You can
share via email - ron-services@skullsecurity.org - or upload to a Google Form
I created: https://goo.gl/forms/o5ZePqpwBgp5C8C52

Thanks!
