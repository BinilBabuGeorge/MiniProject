[Setup]
AppName=File Format Converter
AppVersion=1.0
AppPublisher=Binil Babu
DefaultDirName={commonpf}\FileFormatConverter
DefaultGroupName=File Format Converter
OutputBaseFilename=FileConverterInstaller
Compression=lzma
SolidCompression=yes

[Files]
; CORRECT PATH - EXE is in dist folder
Source: "dist\background_launcher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "converter.py"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\File Format Converter"; Filename: "{app}\background_launcher.exe"
Name: "{commondesktop}\File Format Converter"; Filename: "{app}\background_launcher.exe"

[Registry]
; === PDF CONVERSIONS ===
Root: HKCR; Subkey: "SystemFileAssociations\.pdf\shell\ConvertPDFtoText"; ValueType: string; ValueName: ""; ValueData: "Convert PDF to Text"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.pdf\shell\ConvertPDFtoText\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" pdf2text"; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.pdf\shell\ConvertPDFtoDOCX"; ValueType: string; ValueName: ""; ValueData: "Convert PDF to DOCX"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.pdf\shell\ConvertPDFtoDOCX\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" pdf2docx"; Flags: uninsdeletekey

; === TEXT CONVERSIONS ===
Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoPDF"; ValueType: string; ValueName: ""; ValueData: "Convert Text to PDF"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" text2pdf"; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoDOCX"; ValueType: string; ValueName: ""; ValueData: "Convert Text to DOCX"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoDOCX\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" text2docx"; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoPPTX"; ValueType: string; ValueName: ""; ValueData: "Convert Text to PowerPoint"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.txt\shell\ConvertTexttoPPTX\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" text2pptx"; Flags: uninsdeletekey

; === IMAGE CONVERSIONS ===
Root: HKCR; Subkey: "SystemFileAssociations\.jpg\shell\ConvertImagetoPDF"; ValueType: string; ValueName: ""; ValueData: "Convert Image to PDF"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.jpg\shell\ConvertImagetoPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" image2pdf"; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.png\shell\ConvertImagetoPDF"; ValueType: string; ValueName: ""; ValueData: "Convert Image to PDF"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.png\shell\ConvertImagetoPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" image2pdf"; Flags: uninsdeletekey

; === DOCX CONVERSIONS ===
Root: HKCR; Subkey: "SystemFileAssociations\.docx\shell\ConvertDOCXtoPDF"; ValueType: string; ValueName: ""; ValueData: "Convert DOCX to PDF"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.docx\shell\ConvertDOCXtoPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" docx2pdf"; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.docx\shell\ConvertDOCXtoText"; ValueType: string; ValueName: ""; ValueData: "Convert DOCX to Text"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.docx\shell\ConvertDOCXtoText\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" docx2text"; Flags: uninsdeletekey

; === PPTX CONVERSIONS ===
Root: HKCR; Subkey: "SystemFileAssociations\.pptx\shell\ConvertPPTXtoText"; ValueType: string; ValueName: ""; ValueData: "Convert PowerPoint to Text"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.pptx\shell\ConvertPPTXtoText\command"; ValueType: string; ValueName: ""; ValueData: """{app}\background_launcher.exe"" ""%1"" pptx2text"; Flags: uninsdeletekey

[Run]
Filename: "{app}\background_launcher.exe"; Description: "Launch File Converter"; Flags: nowait postinstall skipifsilent

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    MsgBox('File Format Converter installed successfully!' + #13#10 + #13#10 +
           'You can now right-click on files to convert them.' + #13#10 + #13#10 +
           'Supported file types: PDF, Text, Images, DOCX, PPTX', 
           mbInformation, MB_OK);
  end;
end;