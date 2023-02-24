tableextension 50101 "Vendor Ledger Entry Ext" extends "Vendor Ledger Entry"
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
            FieldClass = FlowField;
            CalcFormula = - Sum("Detailed Vendor Ledg. Entry".Amount WHERE("Vendor Ledger Entry No." = FIELD("Entry No."),
                                                                           "Currency Code" = FILTER(''), "Debit Amount" = field(DebitAmtFilter)));
            Caption = 'Balance RMB';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50008; BalanceUSD; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = - Sum("Detailed Vendor Ledg. Entry".Amount WHERE("Vendor Ledger Entry No." = FIELD("Entry No."),
                                                                           "Currency Code" = FILTER('USD')));
            //"Debit Amount"=FIELD(DebitAmtFilter)));
            Caption = 'Balance USD';
            Description = 'CHCL21.5';
            Editable = false;
        }
        field(50009; BalanceEUR; Decimal)
        {
            CalcFormula = - Sum("Detailed Vendor Ledg. Entry".Amount WHERE("Vendor Ledger Entry No." = FIELD("Entry No."),
                                                                           "Currency Code" = FILTER('EUR'), "Debit Amount" = field(DebitAmtFilter)));
            Caption = 'Balance EUR';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50010; BalanceLCY; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE("Vendor Ledger Entry No." = FIELD("Entry No."), "Debit Amount" = FIELD(DebitAmtFilter)));
            Caption = 'Balance (LCY)';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; DebitAmtFilter; Decimal)
        {
            Description = 'CHCL21.5';
            FieldClass = FlowFilter;
        }
    }

    var
        myInt: Integer;
}