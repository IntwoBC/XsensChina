table 50000 "Chinese Localization Setup"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------


    fields
    {
        field(1; "Primay Key"; Code[10])
        {
        }
        field(10; "Fixed Line"; Boolean)
        {
            Caption = 'Fixed Line';
            Description = 'Chinese Localication Setup ----------';
        }
        field(11; "Line Count -A4"; Integer)
        {
            Caption = 'Line Count -A4';
        }
        field(12; Manager; Code[20])
        {
            Caption = 'Manager';
            TableRelation = User;
        }
        field(13; "Cash Flow Dimension Code"; Option)
        {
            Caption = 'Cash Flow Dimension Code';
            OptionCaption = 'Analysis Dimension 1,Analysis Dimension 2,Analysis Dimension 3,Analysis Dimension 4';
            OptionMembers = "Analysis Dimension 1","Analysis Dimension 2","Analysis Dimension 3","Analysis Dimension 4";
        }
        field(14; "Account Schedule Name-CF"; Code[10])
        {
            Caption = 'Account Schedule Name CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Acc. Schedule Name";
        }
        field(15; "Column Layout Name-CF"; Code[10])
        {
            Caption = 'Column Layout Name CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Column Layout Name";
        }
        field(16; "Account Schedule Name-IS"; Code[10])
        {
            Caption = 'Account Schedule Name IS';
            Description = 'Chinese Income Statement';
            TableRelation = "Acc. Schedule Name";
        }
        field(17; "Column Layout Name-IS"; Code[10])
        {
            Caption = 'Column Layout Name IS';
            Description = 'Chinese Income Statement';
            TableRelation = "Column Layout Name";
        }
        field(18; "Account Schedule Name-BS"; Code[10])
        {
            Caption = 'Account Schedule Name BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Acc. Schedule Name";
        }
        field(19; "Column Layout Name-BS"; Code[10])
        {
            Caption = 'Coulumn Layout Name BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Column Layout Name";
        }
        field(20; "Left Starting Line-BS"; Integer)
        {
            Caption = 'Left Starting Line-BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-BS"));
        }
        field(21; "Left Ending Line-BS"; Integer)
        {
            Caption = 'Left Ending Line-BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-BS"));
        }
        field(22; "Right Starting Line-BS"; Integer)
        {
            Caption = 'Right Starting Line-BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-BS"));
        }
        field(23; "Right Ending Line-BS"; Integer)
        {
            Caption = 'Right Ending Line-BS';
            Description = 'Chinese Balance Sheet';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-BS"));
        }
        field(30; "Left Starting Line-CF"; Integer)
        {
            Caption = 'Left Starting Line-CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-CF"));
        }
        field(31; "Left Ending Line-CF"; Integer)
        {
            Caption = 'Left Ending Line-CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-CF"));
        }
        field(32; "Right Starting Line-CF"; Integer)
        {
            Caption = 'Right Starting Line-CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-CF"));
        }
        field(33; "Right Ending Line-CF"; Integer)
        {
            Caption = 'Right Ending Line-CF';
            Description = 'Chinese Cash Flow Statement';
            TableRelation = "Acc. Schedule Line"."Line No." WHERE("Schedule Name" = FIELD("Account Schedule Name-CF"));
        }
        field(41; "Dimension Print Code 1"; Code[20])
        {
            Caption = 'Dimension Print Code 1';
            Description = 'Voucher';
            TableRelation = Dimension;
        }
        field(42; "Dimension Print Code 2"; Code[20])
        {
            Caption = 'Dimension Print Code 2';
            Description = 'Voucher';
            TableRelation = Dimension;
        }
        field(43; "Dimension Print Code 3"; Code[20])
        {
            Caption = 'Dimension Print Code 3';
            Description = 'Voucher';
            TableRelation = Dimension;
        }
        field(44; "Dimension Print Code 4"; Code[20])
        {
            Caption = 'Dimension Print Code 4';
            Description = 'Voucher';
            TableRelation = Dimension;
        }
        field(100; "VAT Imported Nos."; Code[10])
        {
            Caption = 'VAT Imported Nos.';
            Description = 'Golden Tax Setup -----------';
            TableRelation = "No. Series";
        }
        field(101; "Invoice Handle Nos."; Code[10])
        {
            Caption = 'Invoice Handle Nos.';
            TableRelation = "No. Series";
        }
        field(102; "Max Amount of Export"; Decimal)
        {
            BlankZero = true;
            Caption = 'Max Amount of Export';
            DecimalPlaces = 0 : 5;
        }
        field(103; "Invoice User"; Text[20])
        {
            Caption = 'Invoice User';
        }
        field(104; "Check User"; Text[20])
        {
            Caption = 'Check User';
        }
        field(105; Receipt; Text[20])
        {
            Caption = 'Receipt';
        }
        field(106; "Bank Account"; Text[50])
        {
            Caption = 'Bank Account';
        }
        field(107; "Address&Telephone"; Text[50])
        {
            Caption = 'Address&&Telephone';
        }
        field(200; "Keep SO when Post Completely"; Boolean)
        {
        }
        field(201; "Keep PO when Post Completely"; Boolean)
        {
        }
        field(50000; "PO Delay Reminder Title"; Code[10])
        {
            Caption = 'PO Delay Reminder Title';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." where("Table Name" = filter("Standard Text"));
        }
        field(50001; "PO Delay Reminder Footer"; Code[10])
        {
            Caption = 'PO Delay Reminder Footer';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." WHERE("Table Name" = FILTER("Standard Text"));
        }
        field(50002; "SO Delay Reminder Title"; Code[10])
        {
            Caption = 'SO Delay Reminder Title';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." WHERE("Table Name" = FILTER("Standard Text"));
        }
        field(50003; "SO Delay Reminder Footer"; Code[10])
        {
            Caption = 'SO Delay Reminder Footer';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." WHERE("Table Name" = FILTER("Standard Text"));
        }
        field(50004; "MO Delay Reminder Title"; Code[10])
        {
            Caption = 'MO Delay Reminder Title';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." WHERE("Table Name" = FILTER("Standard Text"));
        }
        field(50005; "MO Delay Reminder Footer"; Code[10])
        {
            Caption = 'MO Delay Reminder Footer';
            DataClassification = ToBeClassified;
            Description = 'CH21.7';
            TableRelation = "Extended Text Header"."No." WHERE("Table Name" = FILTER("Standard Text"));
        }
    }

    keys
    {
        key(Key1; "Primay Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    //[Scope('Internal')]
    procedure MakeDateFilter(var DateFilterText: Text[1024]): Integer
    var
        TextManagement: Codeunit "Filter Tokens";
        Position: Integer;
    begin
        //Position := TextManagement.MakeDateFilter(DateFilterText);
        //OnAfterMakeDateFilter(Position,DateFilterText);
        EXIT(Position);
    end;
}

