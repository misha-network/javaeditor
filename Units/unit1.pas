unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, SynHighlighterJava, SynEdit, SynCompletion, Unit2;

type

  { TMainForm }

  TMainForm = class(TForm)
    ColorDialog: TColorDialog;
    FontDialog: TFontDialog;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FontItem: TMenuItem;
    ColorItem: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    EditMenu: TMenuItem;
    SettingsMenu: TMenuItem;
    AboutItem: TMenuItem;
    NewItem: TMenuItem;
    OpenItem: TMenuItem;
    SaveItem: TMenuItem;
    SaveAsItem: TMenuItem;
    ExitItem: TMenuItem;
    N1: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Edit: TSynEdit;
    SynJava: TSynJavaSyn;
    procedure ColorChange(Sender: TObject);
    procedure FontChange(Sender: TObject);
    procedure CaptionChange(Sender: TObject);
    procedure SaveFile(Sender: TObject);
    procedure SaveAsFile;
    procedure OpenFile(Sender: TObject);
    procedure NewFile(Sender: TObject);
    procedure ExitProg(Sender: TObject);
    procedure Cut(Sender: TObject);
    procedure Copy(Sender: TObject);
    procedure Paste(Sender: TObject);
    procedure OpenAbout(Sender: TObject);
  private

  public


  end;

var
  MainForm: TMainForm;
  FileWork: String;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ColorChange(Sender: TObject);
begin
  if ColorDialog.Execute then
  begin
    Edit.Color := ColorDialog.Color;
  end
end;

procedure TMainForm.FontChange(Sender: TObject);
begin
  if FontDialog.Execute then
  begin
    Edit.Font := FontDialog.Font;
  end;
end;

procedure TMainForm.CaptionChange(Sender: TObject);
begin
  If FileWork='' then
  begin
    Caption := 'JavaEditor - *'
  end
  else
  begin
    Caption := 'JavaEditor - *' + FileWork;
  end
end;

procedure TMainForm.SaveFile(Sender: TObject);
begin
  If FileWork='' then
  begin
       SaveAsFile;
  end
  else
  begin
       Edit.Lines.SaveToFile(FileWork);
       Caption := 'JavaEditor - ' + FileWork;
  end;
end;

procedure TMainForm.SaveAsFile;
begin
  if SaveDialog.Execute then
  begin
    Edit.Lines.SaveToFile(SaveDialog.FileName);
    FileWork := SaveDialog.FileName;
    Caption := 'JavaEditor - ' + FileWork;
  end;
end;

procedure TMainForm.OpenFile(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    Edit.Lines.LoadFromFile(OpenDialog.FileName);
    FileWork := OpenDialog.FileName;
    Caption := 'JavaEditor - ' + FileWork;
  end;
end;

procedure TMainForm.NewFile(Sender: TObject);
begin
  Caption := 'JavaEditor';
  FileWork := '';
  Edit.Lines.Clear;
end;

procedure TMainForm.ExitProg(Sender: TObject);
begin
  Close;
  AboutForm.Close;
end;

procedure TMainForm.Cut(Sender: TObject);
begin
  Edit.CutToClipboard;
end;

procedure TMainForm.Copy(Sender: TObject);
begin
  Edit.CopyToClipboard;
end;

procedure TMainForm.Paste(Sender: TObject);
begin
  Edit.PasteFromClipboard;
end;

procedure TMainForm.OpenAbout(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

end.

