tableextension 50015 "ICOutboxPurchaseHeader Ext" extends "IC Outbox Purchase Header"
{
    fields
    {
        field(50003; "Ship-to Contact"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50004; "Salesperson Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50006; "Sales Your Reference"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50007; "Sales Quote No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50008; "Ship-to County_M"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50009; "Ship-to Country/Region M"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50360; "Sell-to IC Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50361; "Sell-to IC Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50362; "Sell-to IC Name 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50363; "Sell-to IC Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50364; "Sell-to IC Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50365; "Sell-to IC City"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50366; "Sell-to IC Contact"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50367; "Sell-to IC Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50368; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50369; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50370; "Payment Terms Code (US)"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50371; "Sales Order No. (US)"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50372; "SalesForce Comment"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50373; "SalesForce Comment 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
    }

    var
        myInt: Integer;
}