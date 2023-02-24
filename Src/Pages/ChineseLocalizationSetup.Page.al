page 50000 "Chinese Localization Setup"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Chinese Localization Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Chinese Localization Setup";

    layout
    {
        area(content)
        {
            group("Golden Tax")
            {
                Caption = 'Golden Tax';
                field("Invoice Handle Nos."; Rec."Invoice Handle Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Handle Nos. field.';
                }
                field("Max Amount of Export"; Rec."Max Amount of Export")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max Amount of Export field.';
                }
                field("Invoice User"; Rec."Invoice User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice User field.';
                }
                field("Check User"; Rec."Check User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check User field.';
                }
                field(Receipt; Rec.Receipt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt field.';
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Address&Telephone"; Rec."Address&Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address&&Telephone field.';
                }
            }
            group(VAT)
            {
                field("VAT Imported Nos."; Rec."VAT Imported Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Imported Nos. field.';
                }
            }
            group("Local Report")
            {
                Caption = 'Local Report';
                field("Account Schedule Name-BS"; Rec."Account Schedule Name-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Schedule Name BS field.';
                }
                field("Column Layout Name-BS"; Rec."Column Layout Name-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Coulumn Layout Name BS field.';
                }
                field("Left Starting Line-BS"; Rec."Left Starting Line-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Left Starting Line-BS field.';
                }
                field("Left Ending Line-BS"; Rec."Left Ending Line-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Left Ending Line-BS field.';
                }
                field("Right Starting Line-BS"; Rec."Right Starting Line-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Right Starting Line-BS field.';
                }
                field("Right Ending Line-BS"; Rec."Right Ending Line-BS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Right Ending Line-BS field.';
                }
                field("Account Schedule Name-IS"; Rec."Account Schedule Name-IS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Schedule Name IS field.';
                }
                field("Column Layout Name-IS"; Rec."Column Layout Name-IS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Column Layout Name IS field.';
                }
                field("Line Count -A4"; Rec."Line Count -A4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Count -A4 field.';
                }
                field("Account Schedule Name-CF"; Rec."Account Schedule Name-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Schedule Name CF field.';
                }
                field("Column Layout Name-CF"; Rec."Column Layout Name-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Column Layout Name CF field.';
                }
                field("Left Starting Line-CF"; Rec."Left Starting Line-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Left Starting Line-CF field.';
                }
                field("Left Ending Line-CF"; Rec."Left Ending Line-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Left Ending Line-CF field.';
                }
                field("Right Starting Line-CF"; Rec."Right Starting Line-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Right Starting Line-CF field.';
                }
                field("Right Ending Line-CF"; Rec."Right Ending Line-CF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Right Ending Line-CF field.';
                }
                field("Cash Flow Dimension Code"; Rec."Cash Flow Dimension Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Flow Dimension Code field.';
                }
                field(Manager; Rec.Manager)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Manager field.';
                }
                field("Fixed Line"; Rec."Fixed Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Line field.';
                }
            }
            group("Order")
            {
                Caption = 'Order';
                field("Keep SO when Post Completely"; Rec."Keep SO when Post Completely")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Keep SO when Post Completely field.';
                }
                field("Keep PO when Post Completely"; Rec."Keep PO when Post Completely")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Keep PO when Post Completely field.';
                }
            }
            group(Reminder)
            {
                field("PO Delay Reminder Title"; Rec."PO Delay Reminder Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO Delay Reminder Title field.';
                }
                field("SO Delay Reminder Title"; Rec."SO Delay Reminder Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SO Delay Reminder Title field.';
                }
                field("MO Delay Reminder Title"; Rec."MO Delay Reminder Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MO Delay Reminder Title field.';
                }
                field("PO Delay Reminder Footer"; Rec."PO Delay Reminder Footer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO Delay Reminder Footer field.';
                }
                field("SO Delay Reminder Footer"; Rec."SO Delay Reminder Footer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SO Delay Reminder Footer field.';
                }
                field("MO Delay Reminder Footer"; Rec."MO Delay Reminder Footer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MO Delay Reminder Footer field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}

