tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
        field(50004; "Application area"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; ExternalID; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Name 3"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; Tmp_Balance; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50022; Tmp_OverDue; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50023; Tmp_BalanceRMB; Decimal)
        {
            Caption = 'Balance RMB';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50024; Tmp_BalanceUSD; Decimal)
        {
            Caption = 'Balance USD';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50025; Tmp_BalanceEUR; Decimal)
        {
            Caption = 'Balance EUR';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50026; Tmp_BalanceLCY; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50027; BalanceRMB; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Customer No." = FIELD("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code" = FILTER('')));
            //"Cust. Ledg. Entry Is Open" = CONST(true),
            //"Cust. Ledg. Entry Doc. Date" = FIELD("Date Filter")));
            Caption = 'Balance RMB';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50028; BalanceUSD; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Customer No." = FIELD("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code" = FILTER('USD')));
            //"Cust. Ledg. Entry Is Open" = CONST(true),
            //"Cust. Ledg. Entry Doc. Date" = FIELD("Date Filter")));
            Caption = 'Balance USD';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50029; BalanceEUR; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Customer No." = FIELD("No."),
                                                                         "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code" = FILTER('EUR')));
            //"Cust. Ledg. Entry Is Open"=CONST(true),
            //"Cust. Ledg. Entry Doc. Date"=FIELD("Date Filter")));
            Caption = 'Balance EUR';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50030; BalanceLCY; Decimal)
        {
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter")));
            //"Cust. Ledg. Entry Is Open"=CONST(true),
            //"Cust. Ledg. Entry Doc. Date"=FIELD("Date Filter")));
            Caption = 'Balance (LCY)';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50100; "VAT Customer Name"; Text[50])
        {
            Caption = 'VAT Customer Name';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50101; "VAT Address & Telephone"; Text[50])
        {
            Caption = 'VAT Address & Telephone';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50102; "VAT Bank Name & Account"; Text[50])
        {
            Caption = 'VAT Bank Name & Account';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50103; "VAT Invoice Mail Address"; Text[50])
        {
            Caption = 'VAT Invoice Mail Address';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50104; "VAT Contact Information"; Text[30])
        {
            Caption = 'VAT Contact Information';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
    }

    var
        myInt: Integer;
}