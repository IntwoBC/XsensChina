tableextension 50102 "Item Ext" extends Item
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
    }

    var
        myInt: Integer;
}
