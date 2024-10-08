object frmMain: TfrmMain
  Left = 0
  Top = 0
  Margins.Left = 10
  Margins.Top = 10
  Margins.Right = 10
  Margins.Bottom = 10
  Action = actMain
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Welcome to Callback Import Wizard'
  ClientHeight = 489
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBottom: TPanel
    Left = 0
    Top = 448
    Width = 703
    Height = 41
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      699
      37)
    object btnBack: TButton
      Left = 530
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '<< Back'
      TabOrder = 0
      OnClick = btnBackClick
    end
    object btnNext: TButton
      Left = 611
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Next >>'
      TabOrder = 1
      OnClick = btnNextClick
    end
    object btnClose: TButton
      Left = 10
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 448
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object imgImport: TImage
      Left = 0
      Top = 26
      Width = 105
      Height = 105
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002000000
        02000803000000C3A624C8000002D9504C544500000000000000FFFF00000000
        00003F3F3F3333332A2A2A2424241F1F1F1F7FBF1C1C1C1919191717172A2A2A
        2A7FBF2727272789B02424242222221F1F1F1E1E1E2D87B41C1C1C2828282626
        262424242222222121212C85BC1F1F1F1E1E1E1D1D1D277FBA2525252424242D
        7FB62323232222222020201F1F1F1E1E1E2683B9252525242424232323222222
        212121287FBB2020201F1F1F1F1F1F2B82BA2424242323232222222121212121
        212020201F1F1F2424242323232323232882B922222221212121212120202029
        81B91F1F1F2323232323232222222A7FBB2121212881B8287FB9202020212121
        2981B72323232121212020202323232222222121212121212121212020202323
        23222222222222222222212121212121212121212121287FB82A80B8297FB928
        80B9212121202020222222222222287FB8212121212121297FBA2121212980B8
        2222222222222880B9222222287FB82880B8212121297FB92121212121212121
        212880B82222222880B8222222202020212121297FB9212121212121287FB828
        80B92121212980B9212121212121212121222222202020287FB9212121212121
        2980B7222222297FB92222222222222222222880B9212121222222222222287F
        B92020202980B92020202980B82121212222222880B922222222222220202021
        21212121212121212222222980B92020202880B9297FB8222222222222202020
        2020202222222780B72222222020202980B9297FB9277FB72880B9277FB82222
        222222222222222980B9202020297FB8202020212121222222222222297FB922
        2222202020277FB7202020287FB92222222222222020202020202880B9212121
        297FB82222222980B7222222297FB9222222222222277FB72020202020202121
        21222222222222222222222222202020202020222222277FB72222222780B929
        7FB82020202020202780B9202020277FB72020202780B72222222222222980B9
        222222297FB72222222980B93C0DCC85000000F174524E530001010203040506
        070808090A0B0C0C0D0D0E0F1011111213141516171718191A1A1B1C1C1D1E1F
        202121222324252626272829292A2B2C2D2E2F3031323333343536373738393A
        3B3C444546474D4F50545657585A5B5C5D5E5F60616263646B6C6D6E71737476
        7778797A7A7B7B7C7D7D7E7E7F808081828383848586878888898A8A8B8F8F90
        91929396969799999A9A9B9C9D9DA1A2A4A4A5A5A6A7A8A9A9AAABADAEAFB0B1
        B3B4B7B8BABBBCBDC1C1C2C3C5C6C8C9CECFD0D1D1D2D2D3D5D6D8D8D9DADADB
        DCDFE0E1E2E3E4E4E5E5E6E6E7E8E8EAEBECEDEEEFF0F1F3F4F4F5F5F6F8F9F9
        FAFAFBFBFCFDFDFEFE154E0C7A0000121C4944415478DAEDDD7B7054E519C7F1
        B31B6C26B5E0A5883A08C82828FC239D4AA98E8A1A696D953AE2A884E1E26DAC
        95CED4206247915807E954878AA25598E20D938823DE3AFED1696D00A95547A5
        4E5BBCC294822820228E8C9760B6C926BCE72439BB7BCEF3BC7B9E73DEE7F705
        B3C921EFEE39EFF3E162209B9C875497933E01241B00280F00940700CA0300E5
        0180F200407900A03C00501E00280F00940700CA0300E50180F200407900A03C
        00501E00280F00940700CA0300E50180F200407900A03C00501E00280F009407
        00CA0300E50180F200407900A03C00501E00280F00940700CA0300E50180F200
        407900A03C00501E00280F00940700CA0300E50180F200407900A03C00501E00
        280F00940700CA0300E50180F200407900A03C00501E00280F00940700CA0300
        E50180F200407900A03C9B007203A4AF46491DDFD8BB2F3B006AEAC74C3866D8
        E142FBA1AF3DDBB6BEFCD60B5618D80070C2B40B4708EF88C6B6AC6E7D977F2F
        7C00C3E74CAB95DE0BA57DD1F2FB6DDCFB60039871EB60E97D50DCAEA666E63D
        3001D4DDD520BD07CA6B69FC92B59E07E0D047274A6F80FADA2EFB94B39C05A0
        6E15E62F5FDB54CEAF012C000FE0D7FF34D47C2D633107C0F4FBA42F1D15BBA6
        95BE960160781BFEFC9F8E764EDC4E5ECB00B0E472E90B473D2DBF81BC940E60
        F47A7CFC272DED3B6D3375291D40D31CE9CB46A63B6EA7AE2403A8D9808FFFA7
        A7F7C617882BC900263D297DD128D0E475C4856400B317495F330A346F197121
        1940F3F9D2D78C023D3B93B8900C60ED38E96B4681DE388BB8900C60133E0A94
        A6768E222E2403D88D7F0098A6DAA93F1FC900F64A5F32EAD521C47500E04800
        A03C00501E00280F00940700CA0300E50180F200407900A03C00501E00280F00
        940700CA0300E50180F200407900A0BCD402684F7E2F9CEAA088EF975A00D413
        43DD557B9F0120E50180F200407900A03C00501E00280F00940700CA0300E501
        80F200407900A03C00501E00280F00940700CA0300E50180F200407900A03C00
        501E00280F00940700CA0300E50180F200407900A03C00501E00280F00940700
        CA0300E50180F200407900A03C00501E00282FF300069B47F01F2A675EE47B1D
        CB15BFE7BB8FE7CCB17C7045AEF82D5F7C59BCE97ED1F3EEB9BE6B7BEEAFEF6B
        B95EA7910B7BB4BE5B5369A70AC5EFC5FFBC0EFF40F7B1C2811785CE1F3BF0A2
        F35B47D78BAEB78BDF0B1D85AEBADEE8E828BE5228EC8AB8CFA9058092090094
        0700CA0300E50180F200407900A03C00501E00280F00940700CA0300E50180F2
        00407900A03C00501E00280F00940700CA0300E5250EE0E3A85FD51825D15743
        880BC900DE3F42FA9A51A01DA3890BC900D67C4FFA9A51A0572711179201ACFC
        99F435A340CFCC222E2403B8F6B7D2D78C02DDB09CB8900CE0ECA7A5AF19053A
        6F3D71211940EEF5E3A42F1A99DE9E405D4906E0DD3257FAAA9169D1EFA82BE9
        008E7BF160E9CB463D7D7EEA16EA523A00EFCEABA5AF1BF574FFAFC94B190086
        AEA17EF409D9EDA3891F91D73200789752FFD703D9EDCA27E96B3900BCA533A5
        2F1D75B6620E63310B406D6BBDF4C523EFAF0D5F3356B30078031F3E47FAF2D5
        F797CB3EE72CE701F0BEB518BF0BC8F6D03CCECF7F3600CFBB78E151D27BA0B8
        0F6F5ECDBC073600EFA8C6E9DF91DE07A57DFEE8921DDCFBE003F0BC63A74E39
        417A2F14F6F6538F933FFEE767034067A78DFDE131C306D586FC48D47F39D66E
        6B5F3212675FBEFAEC7F1FFC63E3DFAD9C872500A5C3338A8697967D0100A1D2
        B22F0020545AF60500844ACBBE00805069D91700102A2DFB020042A5655F0040
        A8B4EC0B000895967DB109203720E4E0C711170FAEF285A62DCEBE747C63EF3C
        EC00A8A91F33E1986187DB3B2D54B63DDBB6BEFCD60B5618D80070C2B40B4708
        EF88C6B6AC6E7D977F2F7C00C3E74CAB65DF09A2F445CBEFB771EF830D60C6AD
        DA7EF74E53BB9A9A99F7C00450775783F41E28AFA5F14BD67A1E80431F9D28BD
        01EA6BBBEC53CE721680BA5598BF7C6D5339BF06B0003C805FFFD350F3B58CC5
        1C00D3EF93BE7454EC9A56FA5A0680E16DF8F37F3ADA39713B792D03C092CBA5
        2F1CF5B4FC06F2523A80D1EBF1F19FB4B4EFB4CDD4A574004D9CCF494576BBE3
        76EA4A32809A0DF8F87F7A7A6F7C81B8920C6012E3490990F526AF232E240398
        BD48FA9A51A079CB880BC9009ACF97BE6614E859EAA7E99301AC1D277DCD28D0
        1B67111792016CC24781D2D4CE51C4856400BB075057A22AD44EFDF9882F19E3
        48F89A41CA0300E50180F200407900A03C00501E00280F00940700CA0300E501
        80F200407900A03C00501E00280F00940700CA0300E5A516407BE743E43BBFA1
        F0F6EDD937E0A8DE5F867B7FF165CFA7FA44FDCA22A905604EACCB41AEEB5BCE
        2BDE76BDD5F34ADEEB7EBDEBBB79BDFB45F060A953CFF73B52BAE2B676F8FBDB
        F35A87173C5438F04621C2FB74047FA8F7AA8ED0FBE9FD495CC52F0953D3FDEE
        619FDE55ED67144D0E00220500CA0300E50180F200407900A03C00501E00280F
        00940700CA0300E50180F200407900A03C00501E00280F00940700CA7BFF8868
        EF07008E76E61FA30900804C76FC25A78F68FFEF0B4F6F2DFD2E1105004016BB
        E2B641C5DBBD4D0F967EA76802002083CD9B6F5EBD677EE9778B240000B2D7F9
        2D8137B80200207BFDEDE4E05B4C010090B926FEA9F7DB3C010090B92EBFBBCF
        01960000C85C7317F43DC2110000996B5EFF7133040040E60A01C0100000992B
        0C005D000064AE500064010090B9C20150050040E62A01802800003257290034
        010090B94A0220090080CC551A0045000064AE320008020020739503105F406A
        010C3EF008A56EF39E7942B8E27FF9E0C19E77CC059F49EEC033C799A792CB07
        9F5E2EE7DFCB817BEC3E9A0FDEFAEF681EA1CF815E4F6D58699782CFEFD6F394
        7105CF7CEF7CB1F583FE8BCA02882D20B50050570BEFEC7FAC3C80B8020020D5
        1100C4140000A98E02209E000048752400B1040040AAA30188230000521D1140
        0C010090EAA800A20B008054470610590000A43A3A80A8020020D53100441400
        00A98E03209A000048752C0091040040AAE30188220000521D134004010090EA
        B8002A0B008054C70650510000F0DBF2D63B9BF7EEFFA62A77FD9FFEC7E201A8
        24000078ED5FF7EC6BFF4EF6216302A820E078E2590040573B56AE7A37F1078D
        0BA0BC8035C4B30000CFFBE4EE073F1378D8D800CA0AA04606B07B80FD9391E9
        F9F99B451E373E806A082003D834D8FAB988B4F7A6C7841E9900A00A02C800D6
        8EB37D2A22BD73DD4B520F4D01605F0019C063932D9F8948AF5DB145ECB14900
        AC0B200398BDC8EE8988F4CACC8FE41E9C06C0B6003280FAA7EC6E87441B2FDA
        2EF8E8440096059001E4368CB4BB1FC9B7EBA237251F9E0AC0AE0032006FC1F5
        56B743A059CF883E3C198055017400A35EACB3BA1F89B7628EECE3D301D81440
        07E02DBECAE67624DED6333E913D0106008B02180086AE1962733F92EE172DFC
        FB60C501604F000380377599C5ED48BA7F9E5D95BFF78D110B8035011C00DEBD
        33EC6D47D2FDFC71E933E001B0258005A0B6B5DEDE7E24DBF6715F499F021380
        25012C00DEC047B22AE0DE9BA5CF800DC08E001E00AF7671467F17B8E4CFD267
        C0076045001340E74E2E3CD2CE7E24DA8E31E17F041C593FE110F696446CD858
        F65D5810C0BFDAA31BA71F6C654392ECF9696147BF3DFFCA8C7D708B2FC006F7
        631BA68C96DE8998CD5F1A72F090E633A4CF2B766C01967EBD3B7DCC2943870D
        AA0DF9918322DE43BBC55DA9DC55617F0DB0E2E244CFC14E5C0155FF0D2F3BCF
        28FA9355D267408A2900004CCB1AA4CF80164F0000985E1F257D06C4580200C0
        F44966FFA13B47000098243E39C4520C010060CA3000860000306519005D0000
        98320D802C00004CD90640156013404D3EE4E0C7111727FBA986611F77CC3800
        A2003B006A268D1D3F7CE861D25B10BDB05F6FB20E8026C0068013A74D19267D
        F13173120049001FC088B997D6B2EF24E9DC044011C00630ABE9BBD2974DC851
        0004014C00754BB3F857A8EE02882F8007E0D095D9FB2714C59C05105B000B40
        DD13199DBFC300E20A6001587EA9F4D5527318404C011C0033973216CBE63280
        7802180086B765F789C29C06104B0003C03DB3A42F949EDB00E208A00338715D
        F63EFE63721C400C017400BFB94EFA2A19B90E20BA0032809A37B3F6F1FF60CE
        03882C800CE0C74F485F2227F70144154006F0ABDBA4AF9093020011059001B4
        9C277D819C34008826800C60DD49D2D7C74905804802C8003667F16F814D3A00
        44114006B0274F5D99869400882040E9978CD102A0B20000303909A0A2000030
        B909A092000030390AA082000030B90AA0BC000030390BA0AC000030B90BA09C
        000030390CA08C000030B90CA0B4000030390DA0A4000030B90DA09400003039
        0EA084000030B90E205C0000989C07102A00004CEE0308130000260500420400
        80490380FE0200C0A402403F010060D201A0AF80AA0368EF7A8CBC97B27F41A8
        18401F01550710D8EA4E08B9CE17B95CF71B9D37F9E24D2EE023F863E6AD9E43
        91CEB5605EF43ED4BB0F43566A01D05B409200529E1A00BD040080490F80A000
        0030290210100000264D007C0100605205C06B5CD17D0B00265D003E3BF3FDE2
        2D00987401F0EE5858BC01009332002F9D5BBC01009332007B46146F00C0A40C
        C0DEEE27F90200933200AF9E53BC010093320077DF52BC0100932E00FBEA3716
        6F01C0A40BC08DF777DF0280491580158D3DAF0080491380871A3B7A5E030093
        2200FEFC01C04F0F80C0FC01C04F0D80E0FC01C04F0B805EF307003F25007ACF
        1F00FC7400E8337F00F05301A0EFFC01C04F03807EF307003F0500FACF1F00FC
        DC0710327F00F0731E40D8FC01C0CF7500A1F307003FC70184CF1F00FCDC0650
        62FE00E0E7348052F307003F9701949C3F00F8390CA0F4FC01C0CF5D0065E60F
        007ECE0228377F00F0731540D9F903809FA300CACF1F00FCDC045061FED50730
        587A07426B0F39E624804AF3C73385FAB908A0E2FC01C0CF410095E70F007EEE
        0188307F00F0730E4094F903809F6B0022CD1F00FC1C03106DFE00E0E7168088
        F307003FA700449D3F00F8B90420F2FC01C0CF2100D1E70F007EEE0088317F00
        F07306409CF903809F2B0062CD1F00FC1C01106FFE00E0E7068098F307003F27
        00C49D3F00F8B90020F6FC01C0CF0100F1E70F007ED90740983F00F8651E0065
        FE7400BB07485F2F27170190E64F07B0299DFFDC37620E02A0CD9F0E60ED38E9
        2BE6E41E00E2FCE9001E9B2C7DC99C9C03409D3F1DC0EC45D2D7CCC93500E4F9
        D301D43F257DD19C1C03409F3F1D406EC348E9CB661406E0D3BCF4595163CC9F
        0EC05B70BDF475333AE2EBFEC7FE3542FAAC8871E6CF0030EAC53AE92BA777E2
        87FD8F3D3C45FAAC68B1E6CF00E02DBE4AFAD2E9FDE895FEC7CE6B953E2B52BC
        F973000C5D3344FAE2C9CD782EE4E0E33F953E2D42CCF97300785397495F3DB9
        1B1F083938A4E507D2E7153BEEFC5900BC7B67485F3FB5E742CFFCB0850D19FB
        1B0EF6FC79006A5BEBA57780D8F6B185D0E3E3EAC70F646D498C8E3E8E7D17FC
        F9F30078031FC9AA800BD6489F81376F3EF71E2CCC9F09C0AB5D9CD1DF059634
        499F011F808DF9730178DE250B8FB4B42189B6E5FBEDFC3BE1C5056065FE7C00
        DED18DD30FB6B3238976C56AE9336002B0337F0B003CEFD88629A36D9C4BA2BD
        7C6E817F27AC78002CCDDF0A80CE4E1F73CAD061836AEDDC59325D2DFDD7992C
        00B6E66F0B008A1F0780B5F903805C0C00F6E60F0072D101589C3F00C8450660
        73FE0020171580D5F903805C440076E70F0072D100589E3F00C84502607BFE00
        20170580F5F903805C0400F6E70F0072C5075085F903805CB1015463FE002057
        5C0055993F00C815134075E60F0072C50350A5F903805CB100546BFE0020571C
        00559B3F00C8150340F5E60F0072450750C5F903805C91015473FE0020575400
        559D3F00C815114075E70F0072450350E5F903805C9100547BFE002057140055
        9F3F00C8150140F5E70F0072550690C0FC0140AE8A0092983F00C855094022F3
        0700B92A004866FE002057790009CD1F00E42A0B20A9F903805CE50024367F00
        90AB0C80E4E60F0072950690E0FC0140AE9200929C3F00C8550A40A2F30700B9
        4A004876FE002057388084E70F00728502487AFE0020571880C4E70F00728500
        487EFE0020D7DC057D8F08CC1F00E4BAF2AE3E0724E60F00729DD3E7D9AA45E6
        0F0072E5D79E147C5366FE0020D8052B036F08CD1F00245BF44BF3AAD4FC0140
        B4C69BBABFC6C6BEDBFF20347F0090EDE4A9A78EDCFFCEFA27368A9D0100280F
        00940700CA0300E50180F200407900A03C00501E00280F00940700CA0300E501
        80F200407900A03C0050DEFF012E446D4C68C0F9200000000049454E44AE4260
        82}
      Stretch = True
    end
  end
  object pcMain: TPageControl
    Left = 113
    Top = 0
    Width = 590
    Height = 448
    ActivePage = tsDatabase
    Align = alClient
    TabOrder = 2
    OnChanging = pcMainChanging
    object tsDatabase: TTabSheet
      Caption = 'tsDatabase'
      object lblDatabaseSettings: TLabel
        Left = 0
        Top = 0
        Width = 582
        Height = 40
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Callback Database Connection'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object pnlDatabase: TPanel
        Left = 0
        Top = 40
        Width = 582
        Height = 261
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        object pUserName: TPanel
          Left = 138
          Top = 16
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 0
          object lbUsername: TLabel
            Left = 15
            Top = 10
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Username'
            Layout = tlCenter
          end
          object edtUsername: TEdit
            Left = 103
            Top = 6
            Width = 164
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 0
          end
        end
        object pPassword: TPanel
          Left = 138
          Top = 50
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 1
          object lbPassword: TLabel
            Left = 15
            Top = 10
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Password'
            Layout = tlCenter
          end
          object edtPassword: TEdit
            Left = 103
            Top = 6
            Width = 164
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            PasswordChar = '*'
            TabOrder = 0
          end
        end
        object pServer: TPanel
          Left = 138
          Top = 84
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 2
          object lbServer: TLabel
            Left = 15
            Top = 11
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Server'
            Layout = tlCenter
          end
          object edtServer: TEdit
            Left = 103
            Top = 6
            Width = 164
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 0
          end
        end
        object pPort: TPanel
          Left = 138
          Top = 118
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 3
          object lbPort: TLabel
            Left = 15
            Top = 10
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Port'
            Layout = tlCenter
          end
          object edtPort: TEdit
            Left = 103
            Top = 6
            Width = 164
            Height = 23
            TabOrder = 0
          end
        end
        object pDatabase: TPanel
          Left = 138
          Top = 153
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 4
          object lbDatabase: TLabel
            Left = 15
            Top = 10
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Database'
            Layout = tlCenter
          end
          object edtDatabase: TEdit
            Left = 103
            Top = 5
            Width = 164
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 0
          end
        end
        object pVendorLib: TPanel
          Left = 138
          Top = 187
          Width = 272
          Height = 34
          BevelOuter = bvNone
          TabOrder = 5
          object lblVendorLib: TLabel
            Left = 15
            Top = 10
            Width = 73
            Height = 13
            AutoSize = False
            Caption = 'Vendor Lib'
            Layout = tlCenter
          end
          object edtVendorLib: TEdit
            Left = 103
            Top = 5
            Width = 164
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 0
          end
        end
        object btnTestConnection: TButton
          Left = 296
          Top = 221
          Width = 109
          Height = 25
          Caption = 'Test Connection'
          TabOrder = 6
          OnClick = btnTestConnectionClick
        end
      end
    end
    object tsWebService: TTabSheet
      Caption = 'tsWebService'
      ImageIndex = 1
      object lblWebServiceSettings: TLabel
        Left = 0
        Top = 0
        Width = 582
        Height = 40
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'WebService settings'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object pnlService: TPanel
        Left = 0
        Top = 40
        Width = 582
        Height = 368
        Align = alTop
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        object lblCurrentProcessStatus: TLabel
          Left = 161
          Top = 147
          Width = 133
          Height = 15
          Caption = 'lblCurrentProcessStatus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object pServiceAddress: TPanel
          Left = 0
          Top = 0
          Width = 582
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblServiceAddress: TLabel
            Left = 34
            Top = 9
            Width = 82
            Height = 15
            Caption = 'Service Address'
            Layout = tlCenter
          end
          object edtServiceAddress: TEdit
            Left = 128
            Top = 6
            Width = 441
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 0
          end
        end
        object gbDefaultValues: TGroupBox
          Left = 34
          Top = 46
          Width = 535
          Height = 91
          Caption = 'Default Values'
          TabOrder = 1
          object lblBussinessID: TLabel
            Left = 40
            Top = 26
            Width = 61
            Height = 15
            Caption = 'BussinessID'
            Layout = tlCenter
          end
          object lblCategoryID: TLabel
            Left = 175
            Top = 26
            Width = 62
            Height = 15
            Caption = 'Category ID'
            Layout = tlCenter
          end
          object lblLanguage: TLabel
            Left = 311
            Top = 26
            Width = 52
            Height = 15
            Caption = 'Language'
            Layout = tlCenter
          end
          object Password: TLabel
            Left = 53
            Top = 56
            Width = 50
            Height = 15
            Caption = 'Password'
            Layout = tlCenter
          end
          object cbLanguage: TComboBox
            Left = 371
            Top = 23
            Width = 91
            Height = 23
            TabOrder = 2
            Text = 'IL'
            Items.Strings = (
              'IL'
              'UA')
          end
          object edtDefaultPassword: TEdit
            Left = 113
            Top = 53
            Width = 179
            Height = 23
            AutoSelect = False
            MaxLength = 32767
            TabOrder = 3
          end
          object edtCategoryID: TSpinEdit
            Left = 251
            Top = 23
            Width = 41
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object edtBussinessID: TSpinEdit
            Left = 113
            Top = 23
            Width = 41
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
        end
        object BtnStartImport: TButton
          Left = 34
          Top = 143
          Width = 119
          Height = 25
          Caption = 'Start Import'
          TabOrder = 2
          OnClick = BtnStartImportClick
        end
        object ProgressBar: TProgressBar
          Left = 32
          Top = 176
          Width = 537
          Height = 17
          TabOrder = 3
        end
      end
    end
    object tsResultLog: TTabSheet
      Caption = 'tsResultLog'
      ImageIndex = 2
      object lblResultLogHeader: TLabel
        Left = 0
        Top = 0
        Width = 582
        Height = 40
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Import Result Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object gridResultLog: TDBGrid
        Left = 0
        Top = 40
        Width = 582
        Height = 378
        Align = alClient
        DataSource = dsExportResultLog
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object ActionList: TActionList
    Left = 40
    Top = 152
    object actNext: TAction
      Caption = 'actNext'
    end
    object actMain: TAction
      Caption = 'Welcome to Callback Export Wizard'
      OnUpdate = actMainUpdate
    end
  end
  object cdsExportResultLog: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CallbackID'
        DataType = ftInteger
      end
      item
        Name = 'Mobile'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ResultCode'
        DataType = ftInteger
      end
      item
        Name = 'EntityID'
        DataType = ftInteger
      end
      item
        Name = 'MessageResult'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspxportResultLog'
    StoreDefs = True
    Left = 541
    Top = 90
  end
  object dsExportResultLog: TDataSource
    DataSet = cdsExportResultLog
    Left = 565
    Top = 146
  end
  object dspxportResultLog: TDataSetProvider
    Left = 573
    Top = 210
  end
end
