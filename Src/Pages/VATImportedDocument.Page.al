page 50001 "VAT Imported Document"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'VAT Imported Document';
    PageType = Document;
    SourceTable = "VAT Imported Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        //AssistEdit(Rec);
                    end;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Validated By"; Rec."Validated By")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated By field.';
                }
                field("Validated Date"; Rec."Validated Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Date field.';
                }
                field("Validated Time"; Rec."Validated Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Validated Time field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(VATImportedSubform; "VAT Imported SubForm")
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
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
                action("Re-Open")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.MODIFY;
                    end;
                }
                action(Close)
                {
                    Caption = 'Close';
                    Image = Close;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Closed;
                        Rec.MODIFY;
                    end;
                }
                action("EDI - Synchronize")
                {
                    Caption = 'EDI - Synchronize';
                    Image = PostApplication;
                    ApplicationArea = All;
                    ToolTip = 'Executes the EDI - Synchronize action.';
                    trigger OnAction()
                    var
                        SynInvoiceVAT: Record "Synchronized Invoice VAT No";
                    begin
                        Rec.TESTFIELD(Status, Rec.Status::Validated);

                        VATImportLine.RESET;
                        VATImportLine.SETRANGE("Document No.", Rec."No.");
                        IF VATImportLine.FINDSET THEN
                            REPEAT
                                IF VATImportLine."Line Status" = VATImportLine."Line Status"::"Validate Passed" THEN BEGIN

                                    SalesInvoiceHeader.GET(VATImportLine."Posted Invoice No.");
                                    SalesInvoiceHeader."External Document No." := VATImportLine."VAT Invoice No.";

                                    /*
                                    SalesInvoiceLine.RESET;
                                    SalesInvoiceLine.SETRANGE("Document No.",SalesInvoiceHeader."No.");
                                    IF SalesInvoiceLine.FINDSET THEN
                                      REPEAT

                                        SalesInvoiceLine."VAT Invoice No." :=  VATImportLine."VAT Invoice No.";
                                        SalesInvoiceLine.MODIFY;
                                      UNTIL SalesInvoiceLine.NEXT=0;
                                    */
                                    SalesInvoiceHeader.MODIFY;


                                    SynInvoiceVAT.INIT;
                                    SynInvoiceVAT."Posted Invoice No." := VATImportLine."Posted Invoice No.";
                                    SynInvoiceVAT."Customer No." := VATImportLine."Customer No.";
                                    SynInvoiceVAT."Customer Name" := VATImportLine."Customer Name";
                                    SynInvoiceVAT."Invoice Amount" := VATImportLine."Invoice Amount";
                                    SynInvoiceVAT."VAT Invoice No." := VATImportLine."VAT Invoice No.";
                                    SynInvoiceVAT."VAT Documnet No." := VATImportLine."Document No.";
                                    SynInvoiceVAT."VAT Line No." := VATImportLine."Line No.";
                                    IF NOT SynInvoiceVAT.INSERT THEN
                                        SynInvoiceVAT.MODIFY;

                                    VATImportLine."Line Status" := VATImportLine."Line Status"::Synchronized;
                                    VATImportLine.MODIFY;
                                END
                            UNTIL VATImportLine.NEXT = 0;

                        Rec.Status := Rec.Status::Synchronized;
                        Rec.MODIFY;

                    end;
                }
                action("EDI - Validate")
                {
                    Caption = 'EDI - Validate';
                    Image = CheckDuplicates;
                    ApplicationArea = All;
                    ToolTip = 'Executes the EDI - Validate action.';
                    trigger OnAction()
                    begin
                        Rec.TESTFIELD(Status, Rec.Status::Open);

                        VATImportLine.RESET;
                        VATImportLine.SETRANGE("Document No.", Rec."No.");
                        IF VATImportLine.FINDSET THEN
                            REPEAT
                                VATImportLine.CALCFIELDS("Validated Posted Invoice No.", "Validated Customer No.", "Validated VAT Invoice No."
                                                         , "Posted Invoice Amount", "Posted Invoice Amount Incl VAT");
                                IF VATImportLine."Posted Invoice No." <> VATImportLine."Validated Posted Invoice No." THEN
                                    VATImportLine."Line Status" := VATImportLine."Line Status"::"Posted No. Not Existed"
                                ELSE BEGIN
                                    IF VATImportLine."Customer No." <> VATImportLine."Validated Customer No." THEN
                                        VATImportLine."Line Status" := VATImportLine."Line Status"::"Customer Not Matched"
                                    ELSE BEGIN
                                        IF VATImportLine."Invoice Amount" <> VATImportLine."Posted Invoice Amount Incl VAT" THEN
                                            VATImportLine."Line Status" := VATImportLine."Line Status"::"Amounts Not Matched"
                                        ELSE
                                            VATImportLine."Line Status" := VATImportLine."Line Status"::"Validate Passed";
                                    END;
                                END;

                                VATImportLine.MODIFY;

                            UNTIL VATImportLine.NEXT = 0;

                        Rec."Validated By" := USERID;
                        Rec."Validated Date" := WORKDATE;
                        Rec."Validated Time" := TIME;
                        Rec.Status := Rec.Status::Validated;
                        Rec.MODIFY;
                    end;
                }
                // action("EDI - VAT No Import")
                // {
                //     Caption = 'EDI - VAT No Import';
                //     Image = ImportExcel;

                //     trigger OnAction()
                //     var
                //         l_rptVATimport: Report ;
                //     begin
                //         Rec.TESTFIELD(Status, Rec.Status::Open);

                //         CLEAR(l_rptVATimport);
                //         l_rptVATimport.SetVATImport(Rec);
                //         l_rptVATimport.RUNMODAL;
                //     end;
                // }
            }
        }
    }

    var
        VATImportLine: Record "VAT Imported Line";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
}

