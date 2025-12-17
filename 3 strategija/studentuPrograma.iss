; Pakeiskite šiuos parametrus pagal savo duomenis:
; - YourName → Jūsų vardas ir pavardė (pvz., Jonas-Jonaitis)
; - YourApp → Jūsų programos pavadinimas
; - path\to\your\program.exe → kelias į jūsų sukompiliuotą .exe failą

#define MyAppName "Studentu Skaiciuokle"
#define MyAppVersion "1.5"
#define MyAppPublisher "Vardenis Pavardenis"
#define MyAppExeName "programa.exe"
; PAKEISKITE: Vardenis-Pavardenis į savo vardą-pavardę

[Setup]
; SVARBU: Pakeiskite AppId į unikalų GUID
; Galite sugeneruoti naują: Tools → Generate GUID (Inno Setup)
AppId={{12345678-1234-1234-1234-123456789ABC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={commonpf}\VU\Vardenis-Pavardenis
; PAKEISKITE: Vardenis-Pavardenis į savo vardą-pavardę

DefaultGroupName=VU\Vardenis-Pavardenis
; PAKEISKITE: Vardenis-Pavardenis į savo vardą-pavardę

AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
; Reikalauti administravimo teisių
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "lithuanian"; MessagesFile: "compiler:Languages\Lithuanian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
; PAKEISKITE: Source kelią į savo sukompiliuotos programos vietą
Source: "Release\programa.exe"; DestDir: "{app}"; Flags: ignoreversion
; Jei turite papildomų failų (pvz., kursiokai.txt), pridėkite juos:
; Source: "Release\kursiokai.txt"; DestDir: "{app}"; Flags: ignoreversion
; Source: "Release\*.dll"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Start Menu nuoroda
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: ""; WorkingDir: "{app}"; IconFilename: "{app}\{#MyAppExeName}"; Comment: "Paleisti {#MyAppName}"; Flags: runasadmin

; Desktop nuoroda
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; Flags: runasadmin; Comment: "Paleisti {#MyAppName}"

; Pašalinimo nuoroda
Name: "{group}\Šalinti {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent runasadmin

[UninstallDelete]
Type: filesandordirs; Name: "{app}"