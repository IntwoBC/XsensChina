tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50004; "Application area"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "ExternalID"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Name 3"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}