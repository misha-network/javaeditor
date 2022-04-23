unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, lclintf;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    CreatorsText: TLabel;
    HomepageLink: TStaticText;
    JavaEditorLogo: TImage;
    JavaEditorText: TLabel;
    CreatorsList: TListBox;
    GitHubLink: TStaticText;
    procedure GitHubLinkClick(Sender: TObject);
    procedure GitHubLinkMouseEnter(Sender: TObject);
    procedure GitHubLinkMouseLeave(Sender: TObject);
    procedure HomepageLinkClick(Sender: TObject);
    procedure HomepageLinkMouseEnter(Sender: TObject);
    procedure HomepageLinkMouseLeave(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.GitHubLinkClick(Sender: TObject);
begin
  OpenURL('https://github.com/misha-network/javaeditor')
end;

procedure TAboutForm.GitHubLinkMouseEnter(Sender: TObject);
begin
  GitHubLink.Cursor := crHandPoint;
  GitHubLink.Font.Color := clBlue;
end;

procedure TAboutForm.GitHubLinkMouseLeave(Sender: TObject);
begin
  GitHubLink.Font.Color := clNavy;
end;

procedure TAboutForm.HomepageLinkClick(Sender: TObject);
begin
  OpenURL('https://misha-network.github.io/javaeditor/')
end;

procedure TAboutForm.HomepageLinkMouseEnter(Sender: TObject);
begin
  HomepageLink.Cursor := crHandPoint;
  HomepageLink.Font.Color := clBlue;
end;

procedure TAboutForm.HomepageLinkMouseLeave(Sender: TObject);
begin
  HomepageLink.Font.Color := clNavy;
end;

end.

