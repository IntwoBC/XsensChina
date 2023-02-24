tableextension 50000 "SalesHeaderExt" extends "Sales Header"
{
    fields
    {
        field(50010; ExternalID; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'LT240621';
        }
        field(50011; "Comment 2"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'LT210721';
        }
        field(50012; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            Description = 'LT210721';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(true));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50013; "Application area"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'LT280721';
        }
        field(50015; "Sell-to Customer Name 3"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Payment Terms Code IT"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50023; "Payment Method Code IT"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50024; "Salesperson Code IT"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50025; "Shipment Date IT"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50026; "Currency Code IT"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50027; "Created By Rapidi"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
        }
        field(50028; "Rapidi Fields Updated"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'INTWO25OCT2021';
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
        field(50302; "Sell-to Contact E-mail"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'LT240621';
        }
        field(50303; "Sell-to Contact Phone"; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'LT240621';
        }
        field(50304; "SalesForce Comment"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'LT240621';
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
        field(50503; "Date Order Confirmation"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50504; "SalesForce Comment 2"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50505; "IC Payment Terms"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
        field(50506; "IC Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
    }

    var
        myInt: Integer;
}