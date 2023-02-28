tableextension 50019 VendorExtension extends Vendor
{
    fields
    {
        field(50015; "Price Basis"; Option)
        {
            OptionMembers = Absolute,Percentage;
            Caption = 'Price Basis';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Price Basis" = "Price Basis"::Absolute THEN
                    Percentage := 0;
            end;
        }
        field(50016; Percentage; Decimal)
        {
            Caption = 'Percentage';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF Percentage > 100 THEN
                    ERROR('Percentage value must be less than or equal to 100');
            end;
        }
        field(50020; "Tmp_OverDue(LCY)"; Decimal)
        {
            Caption = 'Tmp_OverDue(LCY)';
            DataClassification = ToBeClassified;
        }
        field(50022; Tmp_Balance; Decimal)
        {
            Caption = 'Tmp_Balance';
            DataClassification = ToBeClassified;
        }
        field(50023; Tmp_OverDue; Decimal)
        {
            Caption = 'Tmp_OverDue';
            DataClassification = ToBeClassified;
        }
        field(50024; Tmp_BalanceLCY; Decimal)
        {
            Caption = 'Tmp_BalanceLCY';
            DataClassification = ToBeClassified;
        }
        field(50025; Tmp_BalanceRMB; Decimal)
        {
            Caption = 'Tmp_BalanceRMB';
            DataClassification = ToBeClassified;
        }
        field(50026; Tmp_BalanceUSD; Decimal)
        {
            Caption = 'Tmp_BalanceUSD';
            DataClassification = ToBeClassified;
        }
        field(50027; Tmp_BalanceEUR; Decimal)
        {
            Caption = 'Tmp_BalanceEUR';
            DataClassification = ToBeClassified;
        }
        field(50028; BalanceLCY; Decimal)
        {
            Caption = 'Tmp_BalanceEUR';
            DataClassification = ToBeClassified;
        }
        field(50029; BalanceRMB; Decimal)
        {
            Caption = 'Tmp_BalanceEUR';
            DataClassification = ToBeClassified;
        }
        field(50030; BalanceUSD; Decimal)
        {
            Caption = 'BalanceUSD';
            DataClassification = ToBeClassified;
        }
        field(50031; BalanceEUR; Decimal)
        {
            Caption = 'BalanceEUR';
            DataClassification = ToBeClassified;
        }
    }
}
