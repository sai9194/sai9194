object fDetail: TfDetail
  Left = 0
  Top = 0
  Caption = #49345#49464#54868#47732
  ClientHeight = 660
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 1008
    Height = 660
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 656
    ClientRectLeft = 4
    ClientRectRight = 1004
    ClientRectTop = 26
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 50
        Width = 1000
        Height = 50
        Align = alTop
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Lilian'
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DataSourceDetail
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CopyCaptionsToClipboard = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1SerialNo: TcxGridDBColumn
            DataBinding.FieldName = 'Serial'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object cxGrid1DBTableView1WritingDateTime: TcxGridDBColumn
            Caption = #46356#48148#51060#49828#46321#47197#45216#51676
            DataBinding.FieldName = 'WritingDateTime'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object cxGrid1DBTableView1LoginID: TcxGridDBColumn
            Caption = #50672#44208#44228#51221'ID'
            DataBinding.FieldName = 'LoginID'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGrid1DBTableView1Name: TcxGridDBColumn
            Caption = #50672#44208#44228#51221#47749
            DataBinding.FieldName = 'Name'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGrid1DBTableView1ControllerName: TcxGridDBColumn
            Caption = #46356#48148#51060#49828#51060#47492
            DataBinding.FieldName = 'ControllerName'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGrid1DBTableView1ModifiedDateTime: TcxGridDBColumn
            Caption = #44228#51221#50672#44208#45216#51676
            DataBinding.FieldName = 'ModifiedDateTime'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object cxGrid1DBTableView1SerialNo2: TcxGridDBColumn
            DataBinding.FieldName = 'SerialNo'
            DataBinding.IsNullValueType = True
            Visible = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 50
        Align = alTop
        TabOrder = 1
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Lilian'
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DataSourceDetail
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CopyCaptionsToClipboard = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBTableView1Column6: TcxGridDBColumn
            Caption = #45936#51060#53552#49884#44036
            DataBinding.FieldName = 'CheckDate'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = 'yy-mm-dd hh:nn:ss'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBColumnTempName: TcxGridDBColumn
            Caption = #54788#51116#50728#46020
            DataBinding.FieldName = 'Temp'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = ',0.###'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBColumnSetName: TcxGridDBColumn
            Caption = #49444#51221#50728#46020
            DataBinding.FieldName = 'SetTemp'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = ',0.###'
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = '1'
            DataBinding.FieldName = 'DOut1'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            Caption = '2'
            DataBinding.FieldName = 'DOut2'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBTableView1Column3: TcxGridDBColumn
            Caption = '3'
            DataBinding.FieldName = 'DOut3'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBTableView1Column4: TcxGridDBColumn
            Caption = '4'
            DataBinding.FieldName = 'DOut4'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxGridDBTableView1Column5: TcxGridDBColumn
            Caption = '5'
            DataBinding.FieldName = 'DOut5'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxGrid3: TcxGrid
        Left = 0
        Top = 150
        Width = 1000
        Height = 480
        Align = alClient
        TabOrder = 2
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Lilian'
        object cxGrid3TableView1: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid3TableView1Column1: TcxGridColumn
            Caption = #49884#44036
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column2: TcxGridColumn
            Caption = #54788#51116#44050
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 50
          end
          object cxGrid3TableView1Column3: TcxGridColumn
            Caption = #49444#51221#44050
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 50
          end
          object cxGrid3TableView1Column4: TcxGridColumn
            Caption = #52636#47141
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column5: TcxGridColumn
            Caption = #44221#48372#51333#47448
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column6: TcxGridColumn
            Caption = #44221#48372#48156#49373#49884#44036
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column7: TcxGridColumn
            Caption = #44221#48372#54644#51228#49884#44036
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column8: TcxGridColumn
            Caption = #45572#51201#44032#46041#49884#44036
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Moving = False
            Options.Sorting = False
            Styles.OnGetContentStyle = cxGrid3TableView1Column1StylesGetContentStyle
            Width = 100
          end
          object cxGrid3TableView1Column9: TcxGridColumn
            DataBinding.ValueType = 'DateTime'
            Visible = False
          end
        end
        object cxGrid3Level1: TcxGridLevel
          GridView = cxGrid3TableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 100
        Width = 1000
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 569
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object cxBtnDateNext: TcxButton
            Left = 448
            Top = 1
            Width = 43
            Height = 45
            Caption = #9654
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Lilian'
            TabOrder = 0
            OnClick = cxBtnDateNextClick
          end
          object cxBtnDatePre: TcxButton
            Left = 3
            Top = 1
            Width = 43
            Height = 45
            Caption = #9664
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Lilian'
            TabOrder = 1
            OnClick = cxBtnDatePreClick
          end
          object cxBtnSearchList: TcxButton
            Left = 493
            Top = 1
            Width = 70
            Height = 45
            Caption = #44160#49353
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = 'Lilian'
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC200000EC20115284A8000000012744558745469
              746C650046696E643B5365617263683BAD078F620000016A49444154785EA591
              CD4A02611486BD8A46A789F1278568DFD65DB408341A1DB5C69F748CB983C84D
              942EEC565A0981E6FC383FB60964EA0A0A6951B619086C33703A332048F6CDC6
              17DE8FB3799F73CE774200B096FD67A16DD14CC71B660FFD1EAB1B9E7BD19A99
              0EAD6A159014CD56B26941EA7C0C471D1BB2373624C43144AB06B015BD1504F0
              3B27450B326D1BA65F3FB090571F5E4D802D8F80A98C0E8800EC64ED4A8F7EE0
              AF5E3FE6906A18C008EA3D11106F584EF1F60548CA759E8139D1666440DD740A
              5D32806BDB0850C880E89961ED4816BC7DCEFF5D2151D7812E05ACE09D8AAD99
              AEF761D3D9D22762BD7FF9049B25052225B51D7846B632BAC07341ACAA43F67A
              0219342B6818D6BC30448AAA4BF3324F02F862CACADE96A0F79953CDA105348E
              4D17D52E861180531414974208014056981F4A1886302F4398935D8A93791280
              0CE18612951F009597813AEE7F1300C1DAC83D34A97CDFD9E00677CB8075BC3E
              E0171A811CE8F7E0E9CD0000000049454E44AE426082}
            TabOrder = 2
            OnClick = cxBtnSearchListClick
          end
          object cxDEditSearchEnd: TcxDateEdit
            Left = 248
            Top = 24
            AutoSize = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.EditFormat = True
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DisplayFormat = 'yyyy-mm-dd'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Lilian'
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Lilian'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Lilian'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Lilian'
            TabOrder = 3
            Height = 25
            Width = 100
          end
          object cxDEditSearchStart: TcxDateEdit
            Left = 48
            Top = 24
            AutoSize = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.EditFormat = True
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DisplayFormat = 'yyyy-mm-dd'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.UseLeftAlignmentOnEditing = False
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Lilian'
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Lilian'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Lilian'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Lilian'
            TabOrder = 4
            Height = 25
            Width = 100
          end
          object cxLbl1: TcxLabel
            Left = 48
            Top = 0
            AutoSize = False
            Caption = #49884#44036#49444#51221
            Style.BorderStyle = ebsSingle
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Lilian'
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Lilian'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Lilian'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Lilian'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 25
            Width = 399
            AnchorX = 248
            AnchorY = 13
          end
          object cxTimeEditStart: TcxTimeEdit
            Left = 145
            Top = 24
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Lilian'
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Lilian'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Lilian'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Lilian'
            TabOrder = 6
            Height = 25
            Width = 100
          end
          object cxTimeEditEnd: TcxTimeEdit
            Left = 347
            Top = 24
            AutoSize = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Lilian'
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Lilian'
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Lilian'
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Lilian'
            TabOrder = 7
            Height = 25
            Width = 100
          end
        end
        object cxBtn_Excel: TcxButton
          AlignWithMargins = True
          Left = 821
          Top = 3
          Width = 85
          Height = 44
          Align = alRight
          Caption = #50641#49472
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Lilian'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001F744558745469746C65004578706F72743B58736C743B4578706F72
            74546F58736C743B13D67B9B000001F649444154785E8593BF6E134110C6BF39
            1CA0404282868E07A046E048C84854202544A60D20022555CE261D0552003BA9
            5324B1808ACAC6E10122A1C4162F410D8248E18F80F87237C3ECDC8E74920BD6
            77FE8DB5F37DB3EBD9251101E900507DE19C8E0DA2C84547CD133A5B1F77134A
            1A361B3E52AA58EC1B12284A10F2FC68EFE9E3EB37001CBB4102A146FAE8B2FB
            C383E99FC0EAC6F89AE244D5807261134EB222C05600A39B90E94F9F24143997
            4501B801152A54A2080217C7BFC4BC49A231212F2C97AA06EA5A9844A2811059
            2C65AAC766D6B87211AB5EF9D4F3077D65139610ABBB90A3997069CC45499091
            048324887FB636ADCC8F74CB4A1CB6B65D8C27F5391CA43D1CB47A1024F8DA7A
            6D865FD2574A69D6AC2E07476F550266C4AD08DAB3F338DF5D321158C26354B1
            691212C28BF10EBEA7DB46963C6EA54CEA8C76F04D5714F2048CF5D1109FDB6F
            B03E1EDAAA93E0B2529FC7D9B525AC5C9D03845C6CECECBF4377F45E97DCB3B9
            E5D9DBB8D0BD87E5FA82CDD71013513E251961CF2A1EA2AD892C82B550D18D41
            9100CD3C5BEC43A8E9158D16B209C0DE7F73F69E228E815FA633F7D3FEAFCD97
            0B9864EC77C1FB1E638E04F6C69F70E7D6A573AA3DF48394677FFF7C78D81E34
            5880241E9C101359972AA753904D7EEF03C8AA27317BBB71F7A672E6FF57DAAC
            8E95474AFC03299E64332F8635120000000049454E44AE426082}
          TabOrder = 1
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxBtn_ExcelClick
        end
        object cxButton1: TcxButton
          AlignWithMargins = True
          Left = 912
          Top = 3
          Width = 85
          Height = 44
          Align = alRight
          Caption = #44536#47000#54532
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Lilian'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C0000001C744558745469746C6500416E616C797369733B446174
            61416E616C797369733BE607A7840000021B49444154785E8D93BB6B545110C6
            7FF77AE3AE100B1523AE8F14A2219B223EB058F19110C5428BFC0B0A01C12258
            0829441B11B114C91FA08516360A82A8B006E32351C12A8A1AD68D89851A92B0
            89ECE39E1993E15CF722160E17669873BF39DF373327B87EF36D310CC31E5500
            05C06233B5583515FB43E7E291F30385BE6871A9D63374A600093E309FB65422
            F09172F9C6F323401889A8016A7587FA0A8A36EBF868E2D30F5EDE1DE6F4D025
            D6AC5E85E18030A12428F6255ECD1337628A2F4A4C7CFC4E6FE6BEE5D5648A55
            0F4514F5FA2CF5E70758A854B9F7F8034E8493473B6865C15FA0386340103997
            DC68E41163AC4CCDCC33F2AAC49EAE1CF95D6DA644C421122080B8448218F984
            9A691B7F37CDB3F12FF41DDC41E73258D5F288087869161B03D52447B5DAE0C9
            E8242A4AFFF13CD96C948CD00ACC34726CF0FD499A18D5EBB1E98963E1D6D50B
            749D38CBFEDD5B2008683494A96F734C9667294FCFB1F6570779116217B08233
            06A4EC40E6113BBBAF505ED6FFB9F493F2D779366D6CA57DDB7A0A7BB7B334FC
            90BF2D1211D4CB785FED64F4CE1BDA56405BD751D8D74E26DB025EE2A2EF8128
            88FA29A853C41AA8E4C212C7FABBC9645A0003A1D2DC4E6BB87910E79B28E277
            40616CF335C66EBF4EBF0300EF85DAEC29065591D45932055BCF7303873C1448
            C0CD00E5B0D111494DA152592C0E5E7CD0AB241B985A6540F4DF2F346ED49E02
            2E0032407A1A01FF673150FF0D25EC70C306422A2E0000000049454E44AE4260
            82}
          TabOrder = 2
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxButton1Click
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxButton2: TcxButton
        Left = 0
        Top = 0
        Width = 1000
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = #46028#50500#44032#44592
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Lilian'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000011744558745469746C650052657365743B556E646F3B138116FF0000
          00CB49444154785EA5D3310AC2301480E12C820E76A883B8084A2FE02A387800
          EFE05284827807AF21DE41C1C145410441477170AB8283ABD8518CBF60E00DB5
          A4EDF00DE1F5FD904294D63A17D51B2FA52266D078630495441ECA5889E500CA
          36E0622F967D28DB400D27E80411AE58208023036BE894EEE898401DE70C9108
          9EB94B154768BCD0878254400B5B1199CA0F5C1CC48F1C40C56888C0C50C0C07
          1B1119C645E435C4C09A2702619A40055DEC44606213D07F3CD1CC1AB8A10D65
          1B7820C41C3E4A669EFB397F009A8D113DBE0329980000000049454E44AE4260
          82}
        TabOrder = 0
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton2Click
      end
      object Chart1: TChart
        Tag = 1
        AlignWithMargins = True
        Left = 7
        Top = 37
        Width = 986
        Height = 586
        Margins.Left = 7
        Margins.Top = 7
        Margins.Right = 7
        Margins.Bottom = 7
        Foot.Color = clBlack
        Legend.Visible = False
        MarginBottom = 1
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 1
        Title.Font.Color = clWhite
        Title.Font.Height = -23
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'TChart')
        LeftAxis.AxisValuesFormat = '0.0'
        View3D = False
        View3DOptions.Orthogonal = False
        View3DWalls = False
        Align = alClient
        Color = clWhite
        TabOrder = 1
        OnMouseMove = Chart1MouseMove
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          10
          15
          10)
        ColorPaletteIndex = 13
        object SeriesG1: TFastLineSeries
          HoverElement = []
          Marks.Visible = True
          SeriesColor = clLime
          OnGetMarkText = SeriesG1GetMarkText
          LinePen.Color = clLime
          LinePen.Width = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {0202000000000000000000F03F000000200000000000000000FFFFFF1F}
          Detail = {0000000000}
        end
        object SeriesG2: TFastLineSeries
          HoverElement = []
          SeriesColor = clRed
          LinePen.Color = clRed
          LinePen.Width = 3
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            0402000000000000000000E03FFF0800000031333A30303A3031000000000000
            E03FFF0800000031333A30313A3031}
          Detail = {0000000000}
        end
      end
    end
  end
  object UniQueryDetail: TUniQuery
    Connection = fDongHwa.UniConnection1
    SQL.Strings = (
      'select * from TempCheck'
      'where 1= 0')
    Left = 592
    Top = 104
  end
  object DataSourceDetail: TDataSource
    DataSet = UniQueryDetail
    Left = 696
    Top = 104
  end
  object UniQuerySearch: TUniQuery
    Connection = fDongHwa.UniConnection1
    SQL.Strings = (
      'select * from TempCheck'
      'where 1= 0')
    Left = 592
    Top = 200
  end
  object UniQuerySearch2: TUniQuery
    Connection = fDongHwa.UniConnection1
    SQL.Strings = (
      'select * from TempCheck'
      'where 1= 0')
    Left = 592
    Top = 264
  end
  object DataSourceSearch: TDataSource
    DataSet = UniQuerySearch
    Left = 688
    Top = 200
  end
  object UniQueryGraphGetMark: TUniQuery
    Connection = fDongHwa.UniConnection1
    SQL.Strings = (
      'select * from TempCheck'
      'where 1= 0')
    Left = 584
    Top = 320
  end
end
