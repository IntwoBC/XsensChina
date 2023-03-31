tableextension 50101 VendorExt extends Vendor
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
    }

    var
        myInt: Integer;
}