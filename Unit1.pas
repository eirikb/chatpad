unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Buttons, ScktComp, Spin, ShellApi, Psock,
  NMHttp;


type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Fil1: TMenuItem;
    Rediger1: TMenuItem;
    Format1: TMenuItem;
    Hejlp1: TMenuItem;
    Panel2: TPanel;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Settings1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    ClientSocket1: TClientSocket;
    Memo2: TMemo;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    Memo3: TMemo;
    Memo4: TMemo;
    ListBox1: TListBox;
    Userlist1: TMenuItem;
    PopupMenu1: TPopupMenu;
    lol1: TMenuItem;
    whois1: TMenuItem;
    ListBox2: TListBox;
    About1: TMenuItem;
    Label8: TLabel;
    Stats1: TMenuItem;
    Version1: TMenuItem;
    Ping1: TMenuItem;
    Finger1: TMenuItem;
    Refreshlist1: TMenuItem;
    NMHTTP1: TNMHTTP;
    Skrift1: TMenuItem;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Farge1: TMenuItem;
    Timer1: TTimer;
    procedure bossmode;
    procedure chatmode;
    procedure privmode;
    procedure sourcemode;
    procedure Button1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Connect1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Userlist1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Disconnect1Click(Sender: TObject);
    procedure lol1Click(Sender: TObject);
    procedure whois1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Stats1Click(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure Ping1Click(Sender: TObject);
    procedure Finger1Click(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Refreshlist1Click(Sender: TObject);
    procedure Skrift1Click(Sender: TObject);
    procedure Farge1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  nick: string;
  server: string;
  kanal: string;
  port: string;
  user: string;
  ident: string;
  idata: string;
  idata2: string;
  imnick: string;
  immsg: string;
  s: string;
  s2: string;
  p: string;
  reword: integer;   // up and down to se last word thingy
  pnick: string;
  pnick2: string;
  i1: integer;
  i2: integer;
  im1: integer;
  im2: integer;
  userlistview: integer;
  timer: string;
  timer2: string;
  run: Pchar;

implementation

uses Unit2, Unit3;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  panel2.visible := false;
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
  if ClientSocket1.Active = true then
  begin
    button2.Enabled := false;
    button3.Enabled := true;
  end
  else if ClientSocket1.Active = false then
  begin
    button2.Enabled := true;
    button3.Enabled := false;
  end;
  edit2.text := nick;
  edit3.text := server;
  edit4.text := kanal;
  edit5.text := port;
  edit6.text := user;
  edit7.text := ident;
  panel2.visible := true;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  server := 'irc.homelien.no';
  kanal := '#norge';
  port := '5190';
  user := 'ChatPad';
  ident := 'CoMpAcT';
  p := '1';
  userlistview := 0;
  Userlist1.click;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  nick := edit2.text;
  server := edit3.text;
  kanal := edit4.text;
  port := edit5.text;
  user := edit6.text;
  ident := edit7.text;
  panel2.visible := false;
  if ClientSocket1.Active = true then
  begin
    if nick <> edit2.text then
    begin
      if edit2.text <> '' then
      begin
        clientsocket1.socket.SendText('NICK '+edit2.text+#13);
        nick := edit2.text;
      end;
    end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  panel2.visible := false;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_escape then
  begin
    bossmode;
  end;

  if key = vk_f1 then
  begin
    chatmode;
  end;

  if key = vk_f2 then
  begin
    privmode;
  end;

  if key = vk_f3 then
  begin
    sourcemode;
  end;
end;


procedure TForm1.bossmode;
begin
  memo1.visible := true;
  memo2.visible := false;
  memo3.visible := false;
  panel1.visible := false;
  memo4.visible := false;
  form1.Caption := 'uten navn - Notisblokk';
  memo1.lines.add('');
  memo1.lines.Delete(memo1.lines.count-1);
  ListBox1.Visible := false;
end;

procedure TForm1.chatmode;
begin
  panel1.visible := true;
  memo2.visible := true;
  memo1.visible := false;
  memo3.visible := false;
  memo4.visible := false;
  form1.Caption := 'uten navn - Notisblokk';
  p := '1';
  memo2.lines.add('');
  memo2.lines.Delete(memo2.lines.count-1);
  edit1.SetFocus;
  if userlistview = 1 then
  begin
    ListBox1.Visible := true;
  end;
end;

procedure TForm1.privmode;
begin
  panel1.visible := true;
  memo3.visible := true;
  memo1.visible := false;
  memo2.visible := false;
  memo4.visible := false;
  form1.Caption := 'uten navn - Priv';
  p := '2';
  memo3.lines.add('');
  memo3.lines.Delete(memo3.lines.count-1);
  edit1.SetFocus;
  if userlistview = 1 then
  begin
    ListBox1.Visible := true;
  end;
end;

procedure TForm1.sourcemode;
begin
  panel1.visible := true;
  memo3.visible := false;
  memo1.visible := false;
  memo2.visible := false;
  memo4.visible := true;
  form1.Caption := 'uten navn - Source';
  p := '3';
  memo4.lines.add('');
  memo4.lines.Delete(memo4.lines.count-1);
  edit1.SetFocus;
  if userlistview = 1 then
  begin
    ListBox1.Visible := true;
  end;
end;


procedure TForm1.Connect1Click(Sender: TObject);
begin
  If nick = '' then
  begin
    InputQuery('Login', 'Nickname', nick);
    if nick <> '' then
    begin
      ClientSocket1.Host := server;
      ClientSocket1.Port := StrToInt(port);
      try
      ClientSocket1.Active := true;
      except
      on Exception do exit;
      end;
      Connect1.Visible := False;
      Disconnect1.Visible := true;
      memo2.Lines.add('Connecting to host...');
      chatmode;
    end;
  end
  else if nick <> '' then
  begin
    ClientSocket1.Host := server;
    ClientSocket1.Port := StrToInt(port);
    ClientSocket1.Active := true;
    Connect1.Visible := False;
    Disconnect1.Visible := true;
    memo2.Lines.add('Connecting to host...');
    chatmode;
  end;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  edit3.Enabled := false;
  edit4.Enabled := false;
  edit5.Enabled := false;
  edit6.Enabled := false;
  edit7.Enabled := false;
  Memo2.clear;
  Memo2.lines.add('Loading...');
  clientsocket1.Socket.SendText('NICK ' + nick + #13);
  clientsocket1.Socket.SendText('USER '+user+' "' + clientsocket1.Socket.LocalAddress + '" "' + clientsocket1.Socket.RemoteHost + '" :'+ident+'!' + #13);
  clientsocket1.Socket.SendText('JOIN '+ kanal + #13);
end;


procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  idata := ClientSocket1.Socket.ReceiveText;

  memo4.lines.add(idata);

  while pos(#13,idata) <> 0 do
  begin
    idata2 := idata;
    i1 := pos(#13,idata);
    delete(idata2,i1,length(idata));
    delete(idata,1,i1+1);

    if pos(' KICK ',idata2) <> 0 then
    begin
     i1 := pos('KICK',idata2);
     i1 := i1+length('KICK '+kanal);
     delete(idata2,1,i1);
     i1 := pos(' :',idata2);
     delete(idata2,i1,length(idata2));
     while i1 < ListBox1.Items.Count do
      begin
        if pos(idata2,listbox1.items[i1]) <> 0 then
        begin
          ListBox1.Items.Delete(i1);
        end;
        i1 := i1+1;
      end;
      label8.Caption := 'K '+idata2;
     end;

    if pos(' NICK ',idata2) <> 0 then
    begin
      s := idata2;
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      i1 := pos('!',idata2);
      delete(idata2,i1,length(idata2));
      delete(s,1,5);
      i1 := pos(':',s);
      delete(s,1,i1);
      i1 := 0;
      while i1 < ListBox1.Items.Count do
      begin
        if pos(idata2,listbox1.items[i1]) <> 0 then
        begin
          ListBox1.Items[i1] := s;
        end;
        i1 := i1+1;
      end;
    end;

    if pos(server+' 433',idata2) <> 0 then
    begin
      memo2.lines.add('');
      memo2.lines.add('  Nicket er allerede ibruk');
      InputQuery('Nytt nick', 'Nickname', nick);
      if nick <> '' then
      begin
        clientsocket1.socket.SendText('NICK '+nick+#13);
      end;
    end;

    if pos(' JOIN :'+kanal,idata2) <> 0 then
    begin
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      i1 := pos('!',idata2);
      delete(idata2,i1,length(idata2));
      ListBox1.Items.add(idata2);
      label8.Caption := '> '+idata2;
    end;

    if pos(' QUIT :',idata2) <> 0 then
    begin
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      i1 := pos('!',idata2);
      delete(idata2,i1,length(idata2));
      i1 := 0;
      while i1 < ListBox1.Items.Count do
      begin
        if pos(idata2,listbox1.items[i1]) <> 0 then
        begin
          ListBox1.Items.Delete(i1);
        end;
        i1 := i1+1;
      end;
      label8.Caption := '< '+idata2;
    end;

    if pos(' PART '+kanal,idata2) <> 0 then
    begin
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      i1 := pos('!',idata2);
      delete(idata2,i1,length(idata2));
      i1 := 0;
      while i1 < ListBox1.Items.Count do
      begin
        if pos(idata2,listbox1.items[i1]) <> 0 then
        begin
          ListBox1.Items.Delete(i1);
        end;
        i1 := i1+1;
      end;
      label8.Caption := '< '+idata2;
    end;

    if pos(server+' 353 ',idata2) <> 0 then
    begin
      delete(idata2,1,5);
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      while pos(' ',idata2) <> 0 do
      begin
        i1 := pos(' ',idata2);
        s := idata2;
        delete(s,i1,length(s));
        delete(idata2,1,i1);
        ListBox1.Items.add(s);
      end;
    end;

    if pos(' PRIVMSG '+kanal,idata2) <> 0 then
    begin
      if form1.Active = false then
      begin
        Timer1.Enabled := true;
        Application.Title := 'ny';
      end;
      i1 := pos(':',idata2);
      i2 := pos('!',idata2);
      imnick := idata2;
      delete(imnick,1,i1);
      delete(imnick,i2-1,length(imnick));

      immsg := idata2;
      i1 := pos(' PRIVMSG '+kanal+' :',immsg);
      i2 := pos(#13,immsg);
      delete(immsg,1,i1+length(' PRIVMSG '+kanal+' :')-1);
      form3.poster.caption := IntToStr(StrToInt(form3.poster.caption)+1);
      if pos(imnick, ListBox1.items.text) = 0 then
      begin
        ListBox1.Items.add(imnick);
      end;
      if pos(nick,immsg) <> 0 then
      begin
        timer2 := TimeToStr(now);
        delete(timer2,6,length(timer2));
        if timer <> timer2 then
        begin
          timer := timer2;
          memo2.lines.add(' ['+timer2+']'+'***<'+imnick+'> '+immsg);
        end
        else if timer = timer2 then
        begin
          memo2.lines.add('***<'+imnick+'> '+immsg);
        end;
        form3.tildeg.caption := IntToStr(StrToInt(form3.tildeg.caption)+1);
      end
      else if pos(nick,immsg) = 0 then
      begin
        timer2 := TimeToStr(now);
        delete(timer2,6,length(timer2));
        if timer <> timer2 then
        begin
          timer := timer2;
          memo2.lines.add(' ['+timer2+']'+'<'+imnick+'> '+immsg);
        end
        else if timer = timer2 then
        begin
          memo2.lines.add(' <'+imnick+'> '+immsg);
        end;
      end;
      if pos(imnick,form3.Listbox1.items.text) = 0 then
      begin
        form3.Listbox1.Items.add('001 '+imnick);
      end
      else if pos(imnick,form3.Listbox1.items.text) <> 0 then
      begin
        i1 := 0;
        while i1 < form3.Listbox1.items.count do
        begin
          if pos(imnick,form3.Listbox1.items[i1]) <> 0 then
          begin
            s := form3.Listbox1.items[i1];
            form3.Listbox1.items.Delete(i1);
            s2 := s;
            i1 := pos(' ',s);
            delete(s,i1,length(s));
            delete(s2,1,i1);
            i1 := StrToInt(s);
            i1 := i1+1;
            s := IntToStr(i1);
            if i1 < 100 then
            begin
              s := '0'+s;
              if i1 < 10 then
              begin
                s := '0'+s;
              end;
            end;
            form3.Listbox1.items.add(s+' '+s2);
            exit;
          end;
          i1 := i1+1;
        end;
      end;
    end;

    if pos(' PRIVMSG '+nick,idata2) <> 0 then
    begin
      i1 := pos(':',idata2);
      i2 := pos('!',idata2);
      pnick := idata2;
      delete(pnick,1,i1);
      delete(pnick,i2-1,length(pnick));
      if pnick <> pnick2 then
      begin
        privmode;
        memo3.lines.add('');
        memo3.lines.add('  Ny chat med: '+pnick);
        memo3.lines.add('');
        pnick2 := pnick;
        if memo3.visible = false then
        begin
          form1.Caption := 'Nypriv - Notisblokk';
        end;
      end;

      immsg := idata2;
      i1 := pos(' PRIVMSG '+nick,immsg);
      i2 := pos(#13,immsg);
      delete(immsg,1,i1+length(' PRIVMSG '+idata)-1);
      timer2 := TimeToStr(now);
      delete(timer,6,length(timer2));
      if timer = timer2 then
      begin
        timer := timer2;
        memo3.lines.add(' <'+pnick+'> '+immsg);
      end
      else if timer <> timer2 then
      begin
        memo3.lines.add(' ['+timer2+']'+'<'+pnick+'> '+immsg);
      end;
    end;

    if pos(server+' 332 ',idata2) <> 0 then
    begin
      delete(idata2,1,5);
      i1 := pos(':',idata2);
      delete(idata2,1,i1);
      form3.memo1.lines.add('['+TimeToStr(now)+'] Join kanal');
      form3.label1.Caption := 'Tid i kanal: 0';
      Memo2.clear;
      Memo2.lines.add('        Velkommen til ChatPad Simple  av  CoMpAcT');
      Memo2.lines.add('        Ditt nick: '+nick);
      Memo2.lines.add('        Kanal: '+kanal+'     Server: '+server);
      Memo2.lines.add('');
      Memo2.lines.add('Topic: '+idata2);
      Memo2.lines.add('');
    end;

    if pos('PING',idata2) <> 0 then
    begin
      clientsocket1.Socket.SendText('PONG :' + copy(idata,pos(':',idata) + 1,length(idata) - pos(':',idata)) + #13);
    end;

    if pos('VERSION',idata2) <> 0 then
    begin
      ClientSocket1.socket.SendText('NOTICE '+pnick+' :VERSION ChatPad Simple!'+#13);
    end;

    if pos('TIME',idata2) <> 0 then
    begin
      ClientSocket1.socket.SendText('NOTICE '+pnick+' :TIME Errr... Whatever!'+#13);
    end;

    if pos('FINGER',idata2) <> 0 then
    begin
      ClientSocket1.socket.SendText('NOTICE '+pnick+' :FINGER Æ E MORDI!'+#13);
    end;
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    begin
      ListBox2.items.add(edit1.text);
      reword := ListBox2.items.Count;
      if pos('/', Edit1.text) <> 1 then
      begin
        if ClientSocket1.Active = true then
        begin
          if p = '1' then
          begin
            form3.postavdeg.caption := IntToStr(StrToInt(form3.postavdeg.caption)+1);
            clientsocket1.socket.SendText('PRIVMSG ' +kanal+ '  :' + Edit1.text +#13);
            timer2 := TimeToStr(now);
            delete(timer2,6,length(timer2));
            if timer <> timer2 then
            begin
              timer := timer2;
              Memo2.lines.add(' ['+timer2+']'+'<<' +nick +'>> ' + Edit1.text);
            end
            else if timer = timer2 then
            begin
              Memo2.lines.add(' <<' +nick +'>> ' + Edit1.text);
            end;
          end
          else if p = '2' then
          begin
            clientsocket1.socket.SendText('PRIVMSG ' +pnick+ '  :' + Edit1.text +#13);
            timer2 := TimeToStr(now);
            delete(timer2,6,length(timer2));
            if timer <> timer2 then
            begin
              timer := timer2;
              Memo3.lines.add(' ['+timer2+']'+'<<' +nick +'>> ' + Edit1.text);
            end
            else if timer = timer2 then
            begin
              Memo3.lines.add(' <<' +nick +'>> ' + Edit1.text);
            end;
          end
          else if p = '3' then
          begin
            clientsocket1.socket.SendText(Edit1.text+#13);
            timer2 := TimeToStr(now);
            delete(timer2,6,length(timer2));
            if timer <> timer2 then
            begin
              timer := timer2;
              Memo4.lines.add(' ['+timer2+']'+'<<' +nick +'>> OUT:' + Edit1.text);
            end
            else if timer = timer2 then
            begin
              Memo4.lines.add(' <<' +nick +'>> OUT:' + Edit1.text);
            end;
          end;
        end;
      end;

      if pos('/', Edit1.text) = 1 then
      begin
        if Edit1.text = '/help' then
        begin
          memo2.lines.add('');
          memo2.lines.add('          *****************************************************');
          memo2.lines.add('          *                Hjelp for ChatPad v3.0             *');
          memo2.lines.add('          *****************************************************');
          memo2.lines.add('          *                                                   *');
          memo2.lines.add('          * ESC = Bossmode                                    *');
          memo2.lines.add('          * F1 = Chat                                         *');
          memo2.lines.add('          * F2 = Privat chat                                  *');
          memo2.lines.add('          * F3 = Source                                       *');
          memo2.lines.add('          *                                                   *');
          memo2.lines.add('          * Kommandoer:                                       *');
          memo2.lines.add('          * /join          :Join en kanal ex: "/join #norge"  *');
          memo2.lines.add('          * /nick          :Bytter nick ex: "/nick mordi"     *');
          memo2.lines.add('          * /users         :Lister opp alle fra kanalen(drit) *');
          memo2.lines.add('          * /quit          :Quitter ChatPad                   *');
          memo2.lines.add('          * /msg           :Skriv msg ex: "/msg mordi hallo"  *');
          memo2.lines.add('          * /whois         :Whois ex: "/whois mordi"          *');
          memo2.lines.add('          * /action        :Sender action ex: "/action hallo" *');
          memo2.lines.add('          * /ip            :Viser din IP                      *');
          memo2.lines.add('          * /irc           :Ren IRC kommando ex: "/irc help"  *');
          memo2.lines.add('          * /time          :Setter tid forran chattmeldinger  *');
          memo2.lines.add('          * /web           :Gå til webadresse ex: /web vg.no  *');
          memo2.lines.add('          * /run           :Kjør kommando ex: /run charmap    *');
          memo2.lines.add('          *****************************************************');
          memo2.lines.add('');
          chatmode;
        end;

        if pos('/nick', Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          Delete(s,1,6);
          if s <> '' then
          begin
            clientsocket1.socket.SendText('NICK '+s+#13);
            nick := s;
          end;
        end;

        if pos('/join', Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          Delete(s,1,6);
          s := LowerCase(s);
          memo2.lines.add('Bytter kanal til: '+s);
          clientsocket1.socket.SendText('PART '+kanal+#13);
          clientsocket1.socket.SendText('JOIN '+s+#13);
          ListBox1.Clear;
          kanal := s;
        end;

        if Edit1.text = '/quit' then
        begin
          ClientSocket1.Socket.SendText('QUIT ChatPad. www.chatpad.moo.no'+#13);
        end;

        if Edit1.text = '/irc' then
        begin
          s := Edit1.text;
          delete(s,1,5);
          ClientSocket1.Socket.SendText(s+#13);
        end;

        if pos('/run',Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          Delete(s,1,5);
          if s <> '' then
          begin
            run := PChar(s);
            ShellExecute(Handle, 'open', run , '', nil, SW_SHOW);
          end;
        end;

        if pos('/web',Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          Delete(s,1,5);
          if pos('www.',s) = 0 then
          begin
            s := 'www.'+s;
          end;
          if pos('http://',s) = 0 then
          begin
            s := 'http://'+s;
          end;
          if s <> '' then
          begin
            run := PChar(s);
            ShellExecute(Handle, 'open', run , '', nil, SW_SHOW);
          end;
        end;

        if pos('/action',Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          Delete(s,1,8);
          ClientSocket1.Socket.SendText('PRIVMSG '+kanal+' :ACTION '+s+''+#13);
          Memo2.lines.add('ACTION: '+s);
        end;

        if pos('/whois',Edit1.text) <> 0 then
        begin
          s := Edit1.text;
          delete(s,1,7);
          ClientSocket1.Socket.SendText('WHOIS '+s+#13);
          ClientSocket1.Socket.SendText('USERHOST '+s+#13);
          sourcemode;
        end;

        if Edit1.text = '/ip' then
        begin
          chatmode;
          memo2.lines.add('');
          memo2.lines.add('Prøver å hente IP...');
          try
            NMHTTP1.Get('http://www.whatismyip.com');
            Except
            on Exception do
              begin
              memo2.lines.add('Internett-IP:  Kunne ikke finne internett-IP');
              memo2.lines.add('Loakal IP:  '+NMHTTP1.LocalIP);
              memo2.lines.add('');
              exit;
            end;
          end;
          s := (NMHTTP1.Body);
          if pos('displaycopy(',s) = 0 then
          begin
            memo2.lines.add('Internett-IP:  Kunne ikke finne internett-IP');
            memo2.lines.add('Loakal IP:  '+NMHTTP1.LocalIP);
            memo2.lines.add('');
            exit;
          end
          else if pos('displaycopy(',s) <> 0 then
          begin
            i1 := pos('displaycopy(',s);
            delete(s,1,i1+12);
            i1 := pos('''',s);
            delete(s,i1,length(s));
            memo2.lines.add('Internett-IP:  '+s);
            memo2.lines.add('Loakal IP:  '+NMHTTP1.LocalIP);
            memo2.lines.add('');
            exit;
          end;
        end;
        if Edit1.text = '/users' then
        begin
          Userlist1.Caption := 'Hide userlist';
          ListBox1.Clear;
          ClientSocket1.Socket.SendText('NAMES '+kanal+#13);
          Edit1.Width := Panel1.Width-ListBox1.Width;
          userlistview := 1;
        end;

        if pos('/msg', Edit1.text) <> 0 then
        begin
          s := edit1.text;
          Delete(s,1,3);
          if s <> '' then
          begin
            i1 := pos(' ',s);
            pnick := s;
            delete(pnick,i1,length(pnick));
            delete(s,1,i1);
            ClientSocket1.Socket.SendText('PRIVMSG ' +pnick+ '  :' + s +#13);
            timer2 := TimeToStr(now);
            delete(timer,6,length(timer2));
            if timer <> timer2 then
            begin
              timer := timer2;
              Memo3.lines.add(' ['+timer2+']'+'<<' +nick +'>> ' + s);
            end
            else if timer = timer2 then
            begin
              Memo3.lines.add(' <<' +nick +'>> ' + s);
            end;
            privmode;
          end;
        end;
      end;
    end;
    edit1.clear;
  end;
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  edit3.Enabled := true;
  edit4.Enabled := true;
  edit5.Enabled := true;
  edit6.Enabled := true;
  edit7.Enabled := true;
  chatmode;
  memo2.lines.add('  Disconnected');
  Disconnect1.Visible := false;
  Connect1.Visible := true;
  button2.Enabled := true;
  button3.Enabled := false;
end;

procedure TForm1.Userlist1Click(Sender: TObject);
begin
  if userlistview = 0 then
  begin
    if memo1.Visible = false then
    begin
      ListBox1.Visible := true;
    end;
    Userlist1.Caption := 'Hide userlist';
    ListBox1.Clear;
    ClientSocket1.Socket.SendText('NAMES '+kanal+#13);
    Edit1.Width := Panel1.Width-ListBox1.Width;
    userlistview := 1;
  end
  else if userlistview = 1 then
  begin
    ListBox1.Visible := false;
    Userlist1.Caption := 'Show userlist';
    Edit1.Width := Panel1.Width-10;
    userlistview := 0;
  end;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  ListBox1.clear;
end;

procedure TForm1.Disconnect1Click(Sender: TObject);
begin
  ClientSocket1.Active := false;
  Connect1.Visible := true;
  Disconnect1.Visible := false;
end;

procedure TForm1.lol1Click(Sender: TObject);
begin
  pnick := ListBox1.Items[ListBox1.itemindex];
  Memo3.lines.add('Privat chat med: '+pnick);
  privmode;
end;

procedure TForm1.whois1Click(Sender: TObject);
begin
  ClientSocket1.Socket.SendText('WHOIS '+ListBox1.items[ListBox1.itemindex]+#13);
  ClientSocket1.Socket.SendText('USERHOST '+ListBox1.items[ListBox1.itemindex]+#13);
  sourcemode;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_space then
  begin
    if ListBox1.Visible = true then
    begin
      if Length(edit1.text) < 10 then
      begin
        i1 := 0;
        while i1 < ListBox1.Items.Count do
        begin
          s2 := ListBox1.Items[i1];
          s2 := LowerCase(s2);
          if pos(edit1.text,s2) <> 0 then
          begin
            if pos('@',s2) <> 1 then
            begin
              if pos('+',s2) <> 1 then
              begin
                edit1.text := ListBox1.Items[i1]+':';
                edit1.SelStart := length(edit1.text);
                exit;
              end;
            end;
            if pos('@',s2) = 1 then
            begin
              s2 := ListBox1.Items[i1]+':';
              delete(s2,1,1);
              edit1.Text := s2;
              edit1.SelStart := length(edit1.text);
              exit;
            end;
            if pos('+',s2) = 1 then
            begin
              s2 := ListBox1.Items[i1]+':';
              delete(s2,1,1);
              edit1.Text := s2;
              edit1.SelStart := length(edit1.text);
              exit;
            end;
          end;
          i1 := i1+1;
        end;
      end;
    end;
  end;
  if key = vk_escape then
  begin
    bossmode;
  end;

  if key = vk_f1 then
  begin
    chatmode;
  end;

  if key = vk_f2 then
  begin
    privmode;
  end;

  if key = vk_f3 then
  begin
    sourcemode;
  end;

  if key = vk_up then
  begin
    if reword > 0 then
    begin
      reword := reword-1;
      edit1.text := ListBox2.items[reword];
    end;
  end;

  if key = vk_down then
  begin
    if reword < ListBox2.items.count-1 then
    begin
      reword := reword+1;
      Edit1.Text := ListBox2.items[reword];
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  nick := edit2.text;
  server := edit3.text;
  kanal := edit4.text;
  port := edit5.text;
  user := edit6.text;
  ident := edit7.text;
  Connect1.Click;
  panel2.visible := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Disconnect1.Click;
  panel2.visible := false;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  form2.Visible := true;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if ClientSocket1.Active = true then
    begin
      if edit2.text <> '' then
      begin
        clientsocket1.socket.SendText('NICK '+edit2.text+#13);
        nick := edit2.text;
      end;
    end;
    panel2.visible := false;
  end;
end;

procedure TForm1.Stats1Click(Sender: TObject);
begin
  form3.Visible := true;
end;

procedure TForm1.Version1Click(Sender: TObject);
begin
  pnick := ListBox1.Items[ListBox1.itemindex];
  ClientSocket1.Socket.SendText('PRIVMSG '+pnick+' VERSION'+#13);
  sourcemode;
end;

procedure TForm1.Ping1Click(Sender: TObject);
begin
  pnick := ListBox1.Items[ListBox1.itemindex];
  ClientSocket1.Socket.SendText('PRIVMSG '+pnick+' TIME'+#13);
  sourcemode;
end;

procedure TForm1.Finger1Click(Sender: TObject);
begin
  pnick := ListBox1.Items[ListBox1.itemindex];
  ClientSocket1.Socket.SendText('PRIVMSG '+pnick+' FINGER'+#13);
  sourcemode;
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  chatmode;
  memo2.lines.add('');
  memo2.lines.add('Error:  '+IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  memo1.lines.add('');
  memo1.lines.Delete(memo1.lines.count-1);
  memo2.lines.add('');
  memo2.lines.Delete(memo1.lines.count-1);
  memo3.lines.add('');
  memo3.lines.Delete(memo1.lines.count-1);
  memo4.lines.add('');
  memo4.lines.Delete(memo1.lines.count-1);
end;

procedure TForm1.Refreshlist1Click(Sender: TObject);
begin
  Userlist1.Caption := 'Hide userlist';
  ListBox1.Clear;
  ClientSocket1.Socket.SendText('NAMES '+kanal+#13);
  Edit1.Width := Panel1.Width-ListBox1.Width;
  userlistview := 1;
end;

procedure TForm1.Skrift1Click(Sender: TObject);
begin
  FontDialog1.Execute;
  memo1.Font := FontDialog1.Font;
  memo2.Font := FontDialog1.Font;
  memo3.Font := FontDialog1.Font;
  memo4.Font := FontDialog1.Font;
  ListBox1.Font := FontDialog1.Font;
  Panel1.Font := FontDialog1.Font;
  Edit1.Font := FontDialog1.Font;
end;

procedure TForm1.Farge1Click(Sender: TObject);
begin
  ColorDialog1.Execute;
  memo1.Color := ColorDialog1.Color;
  memo2.Color := ColorDialog1.Color;
  memo3.Color := ColorDialog1.Color;
  memo4.Color := ColorDialog1.Color;
  ListBox1.Color := ColorDialog1.Color;
  Panel1.Color := ColorDialog1.Color;
  Edit1.Color := ColorDialog1.Color;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Form1.active = true then
  begin
    Application.Title := 'simple';
    Timer1.Enabled := false;
  end;
end;

procedure TForm1.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssLeft in Shift then
  begin
    Panel2.left := Mouse.Cursorpos.X-Form1.Left-(Panel2.Width div 2);
    Panel2.top := Mouse.Cursorpos.Y-Form1.Top-(Panel2.Height div 2);
  end;
end;

end.
