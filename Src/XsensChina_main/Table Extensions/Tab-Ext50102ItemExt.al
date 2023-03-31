tableextension 50102 ItemExt extends Item
{
    fields
    {
        field(50306; "Not synchronize to SF"; Boolean)
        {
            Caption = 'Not synchronize to SF';
            DataClassification = ToBeClassified;
        }
        field(50309; "Print Item Description 2"; Boolean)
        {
            Caption = 'Print Item Description 2';
            DataClassification = ToBeClassified;
        }
        field(50310; "Purchasing Code2"; Code[10]) { }
    }

    var
        myInt: Integer;
}