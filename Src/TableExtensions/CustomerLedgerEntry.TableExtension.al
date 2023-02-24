tableextension 50001 "CustomerLedgerEntryExt" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; Tmp_InvAmt; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50001; Tmp_RemainingAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50003; Tmp_BalanceRMB; Decimal)
        {
            Caption = 'Balance RMB';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50004; Tmp_BalanceUSD; Decimal)
        {
            Caption = 'Balance USD';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50005; Tmp_BalanceEUR; Decimal)
        {
            Caption = 'Balance EUR';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50006; Tmp_BalanceLCY; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50007; BalanceRMB; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Cust. Ledger Entry No." = FIELD("Entry No.")));
            //"Currency Code"=FILTER(''),
            //Credit Amount=FIELD(CreditAmtFilter)));
            Caption = 'Balance RMB';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50008; BalanceUSD; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Cust. Ledger Entry No." = FIELD("Entry No."),
                                                                         "Currency Code" = FILTER('USD')));
            //"Credit Amount"=FIELD(CreditAmtFilter)));
            Caption = 'Balance USD';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50009; BalanceEUR; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE("Cust. Ledger Entry No." = FIELD("Entry No."),
                                                                         "Currency Code" = FILTER('EUR')));
            //"Credit Amount"=FIELD(CreditAmtFilter)));
            Caption = 'Balance EUR';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50010; BalanceLCY; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Cust. Ledger Entry No." = FIELD("Entry No."),
                                                                                 "Credit Amount" = FIELD(CreditAmtFilter)));
            Caption = 'Balance (LCY)';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; CreditAmtFilter; Decimal)
        {
            Description = 'CHCL21.5';
            FieldClass = FlowFilter;
        }
    }

    var
        myInt: Integer;
}