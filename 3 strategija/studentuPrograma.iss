; Pakeiskite šiuos parametrus pagal savo duomenis:
; - YourName → Jūsų vardas ir pavardė (pvz., Jonas-Jonaitis)
; - YourApp → Jūsų programos pavadinimas
; - path\to\your\program.exe → kelias į jūsų sukompiliuotą .exe failą

#define MyAppName "Studentu Skaiciuokle"
#define MyAppVersion "1.5"
#define MyAppPublisher "Akvile Beinoriute"
#define MyAppExeName "3 strategija.exe"
; PAKEISKITE: Vardenis-Pavardenis į savo vardą-pavardę

[Setup]
; SVARBU: Pakeiskite AppId į unikalų GUID
; Galite sugeneruoti naują: Tools → Generate GUID (Inno Setup)
AppId={{80138E86-E62B-4CDA-A514-8F8491566A2A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={commonpf}\VU\Akvile.Beinoriute
; PAKEISKITE: Vardenis-Pavardenis į savo vardą-pavardę

DefaultGroupName=VU\Akvile-Beinoriute
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
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
; PAKEISKITE: Source kelią į savo sukompiliuotos programos vietą
; SVARBU: programa.exe jau turi įterptą manifest su requireAdministrator
Source: "x64\Release\3 strategija.exe"; DestDir: "{app}"; Flags: ignoreversion
; Jei turite papildomų failų (pvz., kursiokai.txt), pridėkite juos:
; Source: "Release\kursiokai.txt"; DestDir: "{app}"; Flags: ignoreversion
; Source: "Release\*.dll"; DestDir: "{app}"; Flags: ignoreversion
; NEBEREIKIA manifest failo atskirai - jis jau įterptas į .exe

[Icons]
; Start Menu nuoroda
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Comment: "Paleisti {#MyAppName}"

; Desktop nuoroda
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; Comment: "Paleisti {#MyAppName}"

; Pašalinimo nuoroda
Name: "{group}\Šalinti {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"