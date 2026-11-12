; VNKey installer. Per-user, no admin. GPL-3.0.
#ifndef Version
  #define Version "1.0.1"
#endif
#ifndef Arch
  #define Arch "x64"
#endif
#ifndef Src
  #define Src "..\build\App"
#endif

[Setup]
AppId={{7C4E9A21-5B18-4F63-9D20-1A6E8C3F4B70}
AppName=VNKey
AppVersion={#Version}
AppVerName=VNKey {#Version}
AppPublisher=NGUYEN TRAN HOANG
AppPublisherURL=https://github.com/TANAKAKENJIROU/VNKey
AppSupportURL=https://github.com/TANAKAKENJIROU/VNKey
AppUpdatesURL=https://github.com/TANAKAKENJIROU/VNKey/releases
VersionInfoVersion={#Version}
DefaultDirName={localappdata}\Programs\VNKey
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
LicenseFile=..\..\LICENSE
OutputDir=.\out
OutputBaseFilename=VNKey-Setup
SetupIconFile=..\App\Vikey.ico
UninstallDisplayIcon={app}\VNKey.exe
UninstallDisplayName=VNKey
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
CloseApplicationsFilter=VNKey.exe
RestartApplications=no
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Messages]
WelcomeLabel1=Cài đặt VNKey
WelcomeLabel2=VNKey {#Version} sẽ được cài cho tài khoản của bạn, không cần quyền quản trị.%n%nBấm Next để tiếp tục.
FinishedHeadingLabel=Đã cài xong VNKey
FinishedLabel=VNKey nằm ở khay hệ thống (góc dưới bên phải). Bấm Alt+Z để chuyển Anh/Việt.
ConfirmUninstall=Gỡ VNKey khỏi máy?

[Files]
Source: "{#Src}\VNKey.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\VNKey"; Filename: "{app}\VNKey.exe"

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueName: "VNKey"; Flags: uninsdeletevalue dontcreatekey

[Run]
Filename: "{app}\VNKey.exe"; Description: "Mở VNKey"; Flags: nowait postinstall skipifsilent
Filename: "{app}\VNKey.exe"; Flags: nowait; Check: ShouldRelaunch

[UninstallRun]
Filename: "{sys}\taskkill.exe"; Parameters: "/IM VNKey.exe /F"; Flags: runhidden; RunOnceId: "KillVNKey"

[Code]
function ShouldRelaunch: Boolean;
begin
  Result := ExpandConstant('{param:RELAUNCH|0}') = '1';
end;
