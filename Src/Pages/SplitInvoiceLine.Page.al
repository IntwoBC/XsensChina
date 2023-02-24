page 50005 "Split Invoice Line"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Split Invoice Line';
    PageType = Worksheet;
    SourceTable = "Invoice Export Entry";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(Control20)
            {
                grid(Contrl21)
                {
                    group(Contrl22)
                    {
                        field(SourceLineDocumentNo; SourceLine."Document No.")
                        {
                            Caption = 'Invoice No.';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Invoice No. field.';
                        }
                        field(InvoicedQuantity; SourceLine."Invoiced Quantity")
                        {
                            Caption = 'Invoice Quantity';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Invoice Quantity field.';
                        }
                        field(Qty2Split; Qty2Split)
                        {
                            Caption = 'Qty. to Split';
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Qty. to Split field.';
                        }
                    }
                    group(Control27)
                    {
                        field(SourceLineDocumentLineNo;
                        SourceLine."Document Line No.")
                        {
                            Caption = 'Invoice Line No.';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Invoice Line No. field.';
                        }
                        field(SourceLineAmountIncludingVAT;
                        SourceLine."Amount Including VAT")
                        {
                            Caption = 'Invoice Amount';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Invoice Amount field.';
                        }
                        field(Amt2Split; Amt2Split)
                        {
                            Caption = 'Amount to Split';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Amount to Split field.';
                        }
                    }
                    group(Control30)
                    {
                        field(SourceLineCode;
                        SourceLine.Code)
                        {
                            Caption = 'Item No.';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Item No. field.';
                        }
                        field(SourceLineVATAmount;
                        SourceLine."VAT Amount")
                        {
                            Caption = 'VAT Amount';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the VAT Amount field.';
                        }
                        field(RemainAmt; RemainAmt)
                        {
                            Caption = 'Remaining Amount';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Remaining Amount field.';
                        }
                    }
                    group(Control34)
                    {
                        field(SourceLineDescription;
                        SourceLine.Description)
                        {
                            Caption = 'Description';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Description field.';
                        }
                        field(RemainQty; RemainQty)
                        {
                            Caption = 'Remaining Quantity';
                            Editable = false;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Remaining Quantity field.';
                        }
                    }
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Line No. field.';
                }
                field("Ref. Line No."; Rec."Ref. Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ref. Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced Quantity field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(Split)
                {
                    Caption = 'Split';
                    Image = Split;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Split action.';
                    trigger OnAction()
                    begin
                        IF Qty2Split <= 0 THEN BEGIN
                            MESSAGE('Error, Quantity to Split cannot be zero!');
                            EXIT;
                        END;

                        IF Qty2Split > SourceLine."Invoiced Quantity" THEN BEGIN
                            MESSAGE('Error, Quantity to Split cannot be larger than original invoice quantity!');
                            EXIT;
                        END;

                        SplitRate := Qty2Split / SourceLine."Invoiced Quantity";

                        SplitLine;

                        Qty2Split := 0;
                        Amt2Split := 0;

                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(Separator1)
                {
                }
                action(Confirm)
                {
                    Caption = 'Confirm';
                    Image = Confirm;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Confirm action.';
                    trigger OnAction()
                    begin
                        IF Rec.COUNT <= 1 THEN BEGIN
                            MESSAGE('There is nothing to confirm!');
                            EXIT;
                        END;

                        Rec.FINDFIRST;
                        REPEAT
                            NewLine.INIT;
                            NewLine := Rec;
                            NewLine.INSERT;
                        UNTIL Rec.NEXT = 0;

                        CurrPage.CLOSE;
                    end;
                }
                separator(Separator2)
                {
                }
                action(Cancel)
                {
                    Caption = 'Cancel';
                    Image = Cancel;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Cancel action.';
                    trigger OnAction()
                    begin
                        CurrPage.CLOSE;
                    end;
                }
            }
        }
        area(navigation)
        {
            action("Posted Invoice")
            {
                Caption = 'Posted Invoice';
                Image = Invoice;
                ApplicationArea = All;
                ToolTip = 'Executes the Posted Invoice action.';
                trigger OnAction()
                var
                    lSalesInvLine: Record "Sales Invoice Line";
                begin
                    lSalesInvLine.SETRANGE("Document No.", Rec."Document No.");
                    lSalesInvLine.SETRANGE("Line No.", Rec."Document Line No.");

                    PAGE.RUNMODAL(PAGE::"Posted Sales Invoices", lSalesInvLine);
                end;
            }
        }
    }

    var
        SourceLine: Record "Invoice Export Entry" temporary;
        NewLine: Record "Invoice Export Entry" temporary;
        Qty2Split: Decimal;
        Amt2Split: Decimal;
        RemainAmt: Decimal;
        RemainQty: Decimal;
        SplitRate: Decimal;
        EntryNo: Integer;
        LineNo: Integer;

    //[Scope('Internal')]
    procedure SetValue(pEntryTemp: Record "Invoice Export Entry" temporary)
    begin
        SourceLine := pEntryTemp;

        EntryNo := SourceLine."Entry No.";
        LineNo := SourceLine."Ref. Line No.";

        RemainAmt := SourceLine."Amount Including VAT";

        InsertLine;
    end;

    //[Scope('Internal')]
    procedure InsertLine()
    begin
        Rec.INIT;
        Rec := SourceLine;
        Rec.INSERT;
    end;

    //[Scope('Internal')]
    procedure SplitLine()
    var
        lFirstEntry: Record "Invoice Export Entry" temporary;
    begin
        //Rec.DELETEALL;
        IF Rec.GET(SourceLine."Entry No.") THEN
            Rec.DELETE;

        //Original line
        Rec.INIT;
        Rec := SourceLine;
        Rec."Invoiced Quantity" := SourceLine."Invoiced Quantity" - Qty2Split;
        Rec.Amount := ROUND(SourceLine.Amount * (1 - SplitRate), 0.00001);
        Rec."Amount Including VAT" := ROUND(SourceLine."Amount Including VAT" * (1 - SplitRate), 0.00001);
        Rec."Amount (LCY)" := ROUND(SourceLine."Amount (LCY)" * (1 - SplitRate), 0.00001);
        Rec."Line Amount" := ROUND(SourceLine."Line Amount" * (1 - SplitRate), 0.00001);
        Rec."VAT Amount" := ROUND(SourceLine."VAT Amount" * (1 - SplitRate), 0.00001);
        Rec.Splited := TRUE;
        Rec.INSERT;

        lFirstEntry := Rec;

        //new Splited line
        EntryNo += 1;
        Rec.INIT;
        Rec := SourceLine;
        Rec."Entry No." := EntryNo;
        LineNo += 10000;
        Rec."Ref. Line No." := LineNo;
        Rec."Invoiced Quantity" := SourceLine."Invoiced Quantity" - lFirstEntry."Invoiced Quantity";
        Rec.Amount := SourceLine.Amount - lFirstEntry.Amount;
        Rec."Amount Including VAT" := SourceLine."Amount Including VAT" - lFirstEntry."Amount Including VAT";
        Rec."Amount (LCY)" := SourceLine."Amount (LCY)" - lFirstEntry."Amount (LCY)";
        Rec."Line Amount" := SourceLine."Line Amount" - lFirstEntry."Line Amount";
        Rec."VAT Amount" := SourceLine."VAT Amount" - lFirstEntry."VAT Amount";
        Rec.Splited := TRUE;
        Rec.INSERT;

        //Update original line
        SourceLine := lFirstEntry;
        RemainAmt := SourceLine."Amount Including VAT";
        RemainQty := SourceLine."Invoiced Quantity";
    end;

    //[Scope('Internal')]
    procedure ReturnNewLine(var pNewLine: Record "Invoice Export Entry" temporary)
    begin
        IF NewLine.FINDFIRST THEN
            REPEAT
                pNewLine.INIT;
                pNewLine := NewLine;
                pNewLine.INSERT;
            UNTIL NewLine.NEXT = 0;
    end;
}

