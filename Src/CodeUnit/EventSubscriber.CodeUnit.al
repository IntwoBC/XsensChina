codeunit 50000 "Event Subscriber"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", 'OnAfterInsertPurchOrderHeader', '', false, false)]
    local procedure OnAfterInsertPurchOrderHeader(var PurchaseOrderHeader: Record "Purchase Header";
    CommitIsSuppressed: Boolean; SpecialOrder: Boolean; var RequisitionLine: Record "Requisition Line")
    var
        SalesHeaderL: Record "Sales Header";
    begin
        //INTWO-Start-10DEC2021-ICPO
        IF NOT SpecialOrder THEN BEGIN
            IF SalesHeaderL.GET(SalesHeaderL."Document Type"::Order, RequisitionLine."Sales Order No.") THEN BEGIN
                PurchaseOrderHeader."Sales Order no." := SalesHeaderL."No.";
            END;
        END;
        //INTWO-End-10DEC2021-ICPO
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeFinalizePosting', '', false, false)]
    local procedure OnBeforeFinalizePosting(var EverythingInvoiced: Boolean;
    sender: Codeunit "Sales-Post"; SuppressCommit: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line")
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IC Inbox Import", 'OnBeforeImportInboxTransactionProcedure', '', false, false)]
    local procedure OnBeforeImportInboxTransaction(var IStream: InStream; var TempICOutboxTransaction: Record "IC Outbox Transaction"; var TempICOutboxJnlLine: Record "IC Outbox Jnl. Line"; var TempICInboxOutboxJnlLineDim: Record "IC Inbox/Outbox Jnl. Line Dim."; var TempICOutboxSalesHeader: Record "IC Outbox Sales Header"; var TempICOutboxSalesLine: Record "IC Outbox Sales Line"; var TempICOutboxPurchaseHeader: Record "IC Outbox Purchase Header"; var TempICOutboxPurchaseLine: Record "IC Outbox Purchase Line"; var TempICDocDim: Record "IC Document Dimension"; var FromICPartnerCode: Code[20]; var IsHandled: Boolean);
    var
        ICPartner: Record "IC Partner";
        ICOutboxImpExpXML: XMLport "IC Outbox Imp/Exp_Intwo";
        IFile: File;
        ToICPartnerCode: Code[20];
        WrongCompanyErr: Label 'The selected xml file contains data sent to %1 %2. Current company''s %3 is %4.', Comment = 'The selected xml file contains data sent to IC Partner 001. Current company''s IC Partner Code is 002.';
        CompanyInfo: Record "IC Setup";
    begin
        CompanyInfo.Get();
        ICOutboxImpExpXML.SetSource(IStream);
        ICOutboxImpExpXML.Import;

        FromICPartnerCode := ICOutboxImpExpXML.GetFromICPartnerCode;
        ToICPartnerCode := ICOutboxImpExpXML.GetToICPartnerCode;
        if ToICPartnerCode <> CompanyInfo."IC Partner Code" then
            Error(
              WrongCompanyErr, ICPartner.TableCaption, ToICPartnerCode,
              CompanyInfo.FieldCaption("IC Partner Code"), CompanyInfo."IC Partner Code");

        ICOutboxImpExpXML.GetICOutboxTrans(TempICOutboxTransaction);
        ICOutboxImpExpXML.GetICOutBoxJnlLine(TempICOutboxJnlLine);
        ICOutboxImpExpXML.GetICIOBoxJnlDim(TempICInboxOutboxJnlLineDim);
        ICOutboxImpExpXML.GetICOutBoxSalesHdr(TempICOutboxSalesHeader);
        ICOutboxImpExpXML.GetICOutBoxSalesLine(TempICOutboxSalesLine);
        ICOutboxImpExpXML.GetICOutBoxPurchHdr(TempICOutboxPurchaseHeader);
        ICOutboxImpExpXML.GetICOutBoxPurchLine(TempICOutboxPurchaseLine);
        ICOutboxImpExpXML.GetICSalesDocDim(TempICDocDim);
        ICOutboxImpExpXML.GetICSalesDocLineDim(TempICDocDim);
        ICOutboxImpExpXML.GetICPurchDocDim(TempICDocDim);
        ICOutboxImpExpXML.GetICPurchDocLineDim(TempICDocDim);
        FromICPartnerCode := ICOutboxImpExpXML.GetFromICPartnerCode;

        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IC Outbox Export", 'OnBeforeExportOutboxTransaction', '', false, false)]
    local procedure OnBeforeExportOutboxTransaction(ICOutboxTransaction: Record "IC Outbox Transaction"; OutStr: OutStream; var IsHandled: Boolean);
    var
        ICOutboxImpExpXML: XMLport "IC Outbox Imp/Exp_Intwo";
        ICOutboxTransaction2: Record "IC Outbox Transaction";
    begin
        Clear(ICOutboxTransaction2);
        Clear(ICOutboxImpExpXML);
        // ICOutboxTransaction2.SetRange("Transaction No.", ICOutboxTransaction."Transaction No.");
        // ICOutboxTransaction2.SetRange("IC Partner Code", ICOutboxTransaction."IC Partner Code");
        // ICOutboxTransaction2.SetRange("Transaction Source", ICOutboxTransaction."Transaction Source");
        // ICOutboxTransaction2.SetRange("Document Type", ICOutboxTransaction."Document Type");
        ICOutboxTransaction2.SetRange("Line Action", ICOutboxTransaction2."Line Action"::"Send to IC Partner");
        if ICOutboxTransaction2.FindSet() then begin
            ICOutboxImpExpXML.SetICOutboxTrans(ICOutboxTransaction2);
            ICOutboxImpExpXML.SetDestination(OutStr);
            ICOutboxImpExpXML.Export;
        end;
        IsHandled := true;
        Clear(OutStr);
        Clear(ICOutboxImpExpXML);
    end;

    //For IC related fields 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnCreateSalesDocumentOnBeforeSalesHeaderModify', '', false, false)]
    local procedure OnCreateSalesDocumentOnBeforeSalesHeaderModify(var SalesHeader: Record "Sales Header"; ICInboxSalesHeader: Record "IC Inbox Sales Header");
    begin
        SalesHeader."Ship-to Address" := ICInboxSalesHeader."Ship-to Address";
        SalesHeader."Ship-to Address 2" := ICInboxSalesHeader."Ship-to Address 2";
        SalesHeader."Ship-to Post Code" := ICInboxSalesHeader."Ship-to Post Code";
        SalesHeader."Ship-to County" := ICInboxSalesHeader."Ship-to County";
        SalesHeader."Ship-to Contact" := ICInboxSalesHeader."Ship-to Contact";                          // 20100930 TG 23475
        SalesHeader."Ship-to Country/Region Code" := ICInboxSalesHeader."Ship-to Country/Region Code";              //20110103 GFR 25048
        SalesHeader."Salesperson Code" := ICInboxSalesHeader."Salesperson Code";                         // 20101001 TG 23475
        SalesHeader."Your Reference" := ICInboxSalesHeader."Sales Your Reference";                     // 20101001 TG 23475
        SalesHeader."Quote No." := ICInboxSalesHeader."Sales Quote No.";                          // 20101001 TG 23475
        SalesHeader."IC Payment Terms" := ICInboxSalesHeader."Payment Terms Code (US)";                         // 20160512 KBG 06458
        SalesHeader."IC Sales Order No." := ICInboxSalesHeader."Sales Order No. (US)";                    // 20160512 KBG 06458
        SalesHeader."SalesForce Comment" := ICInboxSalesHeader."SalesForce Comment";                       // 20160914 KBG 07441
        SalesHeader."Comment 2" := ICInboxSalesHeader."SalesForce Comment 2";                                // 20160914 KBG 07441

        //NM_BEGIN 20110415 GFR 25421
        SalesHeader."Sell-to IC Customer No." := ICInboxSalesHeader."Sell-to IC Customer No.";
        SalesHeader."Sell-to IC Name" := ICInboxSalesHeader."Sell-to IC Name";
        SalesHeader."Sell-to IC Name 2" := ICInboxSalesHeader."Sell-to IC Name 2";
        SalesHeader."Sell-to IC Address" := ICInboxSalesHeader."Sell-to IC Address";
        SalesHeader."Sell-to IC Address 2" := ICInboxSalesHeader."Sell-to IC Address 2";
        SalesHeader."Sell-to IC City" := ICInboxSalesHeader."Sell-to IC City";
        SalesHeader."Sell-to IC Contact" := ICInboxSalesHeader."Sell-to IC Contact";
        SalesHeader."Sell-to IC Post Code" := ICInboxSalesHeader."Sell-to IC Post Code";
        //NM_END 20110415 GFR 25421

        // NM_BEGIN 20100829 TG 23475
        IF ICInboxSalesHeader."Expected Receipt Date" <> 0D THEN BEGIN
            SalesHeader.VALIDATE("Shipment Date", ICInboxSalesHeader."Expected Receipt Date");
        END;
        // NM_BEGIN 20100829 TG 23475
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnAfterCreateSalesLines', '', false, false)]
    local procedure OnAfterCreateSalesLines(ICInboxSalesLine: Record "IC Inbox Sales Line"; var SalesLine: Record "Sales Line");
    begin
        // NM_BEGIN 20100829 TG 23475
        //100% discount- flowing line discount % and Line discount amount
        if ICInboxSalesLine."IC Partner Ref. Type" <> ICInboxSalesLine."IC Partner Ref. Type"::" " then begin
            SalesLine.validate("Line Discount %", ICInboxSalesLine."Line Discount %");
            //SalesLine.Validate("Line Discount Amount", ICInboxSalesLine."Line Discount Amount");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnBeforeICInboxSalesHeaderInsert', '', false, false)]
    local procedure OnBeforeICInboxSalesHeaderInsert(var ICInboxSalesHeader: Record "IC Inbox Sales Header"; ICOutboxPurchaseHeader: Record "IC Outbox Purchase Header");
    begin
        //NM_BEGIN 20110415 GFR 25421
        ICInboxSalesHeader."Sell-to IC Customer No." := ICOutboxPurchaseHeader."Sell-to IC Customer No.";
        ICInboxSalesHeader."Sell-to IC Name" := ICOutboxPurchaseHeader."Sell-to IC Name";
        ICInboxSalesHeader."Sell-to IC Name 2" := ICOutboxPurchaseHeader."Sell-to IC Name 2";
        ICInboxSalesHeader."Sell-to IC Address" := ICOutboxPurchaseHeader."Sell-to IC Address";
        ICInboxSalesHeader."Sell-to IC Address 2" := ICOutboxPurchaseHeader."Sell-to IC Address 2";
        ICInboxSalesHeader."Sell-to IC City" := ICOutboxPurchaseHeader."Sell-to IC City";
        ICInboxSalesHeader."Sell-to IC Contact" := ICOutboxPurchaseHeader."Sell-to IC Contact";
        ICInboxSalesHeader."Sell-to IC Post Code" := ICOutboxPurchaseHeader."Sell-to IC Post Code";
        ICInboxSalesHeader."Ship-to Address" := ICOutboxPurchaseHeader."Ship-to Address";
        ICInboxSalesHeader."Ship-to Address 2" := ICOutboxPurchaseHeader."Ship-to Address 2";
        ICInboxSalesHeader."Ship-to Post Code" := ICOutboxPurchaseHeader."Ship-to Post Code";
        ICInboxSalesHeader."Ship-to County" := ICOutboxPurchaseHeader."Ship-to County";
        ICInboxSalesHeader."Ship-to Contact" := ICOutboxPurchaseHeader."Ship-to Contact";   // 20100930 TG 23475
        ICInboxSalesHeader."Ship-to Country/Region Code" := ICOutboxPurchaseHeader."Ship-to Country/Region Code";
        ICInboxSalesHeader."Payment Terms Code (US)" := ICOutboxPurchaseHeader."Payment Terms Code (US)";    //20160512 KBG 06458
        ICInboxSalesHeader."Sales Order No. (US)" := ICOutboxPurchaseHeader."Sales Order No. (US)";       //20160512 KBG 05468
        ICInboxSalesHeader."SalesForce Comment" := ICOutboxPurchaseHeader."SalesForce Comment";         //20160914 KBG 07441
        ICInboxSalesHeader."SalesForce Comment 2" := ICOutboxPurchaseHeader."SalesForce Comment 2";       //20160914 KBG 07441
        //NM_END 20110415 GFR 25421
        ICInboxSalesHeader."Salesperson Code" := ICOutboxPurchaseHeader."Salesperson Code";
        ICInboxSalesHeader."Sales Your Reference" := ICOutboxPurchaseHeader."Sales Your Reference";
        ICInboxSalesHeader."Sales Quote No." := ICOutboxPurchaseHeader."Sales Quote No.";
        //ICInboxSalesHdr."Shortcut Dimension 1 Code"   := ICOutboxPurchHdr."Shortcut Dimension 1 Code";  // 20111207 GFR 27136
        //ICInboxSalesHdr."Shortcut Dimension 2 Code"   := ICOutboxPurchHdr."Shortcut Dimension 2 Code";  // 20111207 GFR 27136
        // NM_BEGIN 20100829 TG 23474
        IF ICOutboxPurchaseHeader."Expected Receipt Date" <> 0D THEN BEGIN
            ICInboxSalesHeader."Expected Receipt Date" := ICOutboxPurchaseHeader."Expected Receipt Date";
        END;
        // NM_END 20100829 TG 23474

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnBeforeICInboxSalesLineInsert', '', false, false)]
    local procedure OnBeforeICInboxSalesLineInsert(var ICInboxSalesLine: Record "IC Inbox Sales Line"; ICOutboxPurchaseLine: Record "IC Outbox Purchase Line");
    begin
        // NM_BEGIN 20100829 TG 23475
        //100% discount- flowing line discount % and Line discount amount
        if ICOutboxPurchaseLine."IC Partner Ref. Type" <> ICOutboxPurchaseLine."IC Partner Ref. Type"::" " then begin
            ICInboxSalesLine."Line Discount %" := ICOutboxPurchaseLine."Line Discount %";
            ICInboxSalesLine."Line Discount Amount" := ICOutboxPurchaseLine."Line Discount Amount";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnCreateOutboxPurchDocTransOnAfterTransferFieldsFromPurchHeader', '', false, false)]
    local procedure OnCreateOutboxPurchDocTransOnAfterTransferFieldsFromPurchHeader(var ICOutboxPurchHeader: Record "IC Outbox Purchase Header"; PurchHeader: Record "Purchase Header");
    var
        lRecSalesHeader: Record "Sales Header";
    begin
        ICOutBoxPurchHeader."Ship-to Post Code" := PurchHeader."Ship-to Post Code";           // 20100929 TG 23475
        ICOutboxPurchHeader."Ship-to Address" := PurchHeader."Ship-to Address";
        ICOutBoxPurchHeader."Ship-to Address 2" := PurchHeader."Ship-to Address 2";           // 20100928 TG 23475
        ICOutboxPurchHeader."Ship-to County" := PurchHeader."Ship-to County";
        ICOutBoxPurchHeader."Ship-to Contact" := PurchHeader."Ship-to Contact";             // 20100930 TG 23475
                                                                                            // 20101001 TG 23475

        //NM_BEGIN 20110415 GFR 25468
        IF lRecSalesHeader.GET(PurchHeader."Document Type"::Order, PurchHeader."Sales Order no.") THEN BEGIN
            ICOutBoxPurchHeader."Sell-to IC Customer No." := PurchHeader."Sell-to Customer No.";
            ICOutBoxPurchHeader."Sell-to IC Name" := lRecSalesHeader."Sell-to Customer Name";
            ICOutBoxPurchHeader."Sell-to IC Name 2" := lRecSalesHeader."Sell-to Customer Name 2";
            ICOutBoxPurchHeader."Sell-to IC Address" := lRecSalesHeader."Sell-to Address";
            ICOutBoxPurchHeader."Sell-to IC Address 2" := lRecSalesHeader."Sell-to Address 2";
            ICOutBoxPurchHeader."Sell-to IC City" := lRecSalesHeader."Sell-to City";
            ICOutBoxPurchHeader."Sell-to IC Contact" := lRecSalesHeader."Sell-to Contact";
            ICOutBoxPurchHeader."Sell-to IC Post Code" := lRecSalesHeader."Sell-to Post Code";
            ICOutBoxPurchHeader."Payment Terms Code (US)" := lRecSalesHeader."Payment Terms Code";       //20160512 KBG 06458
            ICOutBoxPurchHeader."Sales Order No. (US)" := lRecSalesHeader."No.";                      //20160512 KBG 06458
            ICOutBoxPurchHeader."SalesForce Comment" := lRecSalesHeader."SalesForce Comment";       //20160914 KBG 07441
            ICOutBoxPurchHeader."SalesForce Comment 2" := lRecSalesHeader."Comment 2";                //20160914 KBG 07441
            ICOutBoxPurchHeader."Sales Your Reference" := lRecSalesHeader."Your Reference";
            ICOutBoxPurchHeader."Salesperson Code" := lRecSalesHeader."Salesperson Code";
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ICInboxOutboxMgt, 'OnCreateOutboxPurchDocTransOnAfterICOutBoxPurchLineInsert', '', false, false)]
    local procedure OnCreateOutboxPurchDocTransOnAfterICOutBoxPurchLineInsert(var ICOutboxPurchaseLine: Record "IC Outbox Purchase Line"; PurchaseLine: Record "Purchase Line");
    var
        lRecSalesLine: Record "Sales Line";
    begin
        // NM_BEGIN 20100829 TG 23475
        //100% discount- flowing line discount % and Line discount amount
        if PurchaseLine.Type <> PurchaseLine.Type::" " then begin
            ICOutboxPurchaseLine."Line Discount %" := PurchaseLine."Line Discount %";
            ICOutboxPurchaseLine."Line Discount Amount" := PurchaseLine."Line Discount Amount";
        end;
        ICOutboxPurchaseLine.Modify();
        // NM_END 20100829 TG 23475
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", 'OnBeforePurchOrderLineInsert', '', false, false)]
    local procedure OnBeforePurchOrderLineInsert(var PurchOrderHeader: Record "Purchase Header"; var PurchOrderLine: Record "Purchase Line"; var ReqLine: Record "Requisition Line"; CommitIsSuppressed: Boolean);
    var
        RecVendor: Record Vendor;
        RecSalesLine: Record "Sales Line";
        RecSalesHeader: Record "Sales Header";
        CurrencyFactor, ExchangeRateAmt : Decimal;
        CurrencyExchangeRate: Record "Currency Exchange Rate";
    begin
        PurchOrderLine."Shortcut Dimension 1 Code" := ReqLine."Shortcut Dimension 1 Code";
        PurchOrderLine."Shortcut Dimension 2 Code" := ReqLine."Shortcut Dimension 2 Code";
        PurchOrderLine."Dimension Set ID" := ReqLine."Dimension Set ID";
        if PurchOrderHeader."Buy-from Vendor No." <> '' then begin
            Clear(RecVendor);
            if RecVendor.GET(PurchOrderHeader."Buy-from Vendor No.") then begin
                if RecVendor."Price Basis" = RecVendor."Price Basis"::Absolute then
                    exit
                else begin
                    Clear(RecSalesLine);
                    RecSalesLine.GET(RecSalesLine."Document Type"::Order, ReqLine."Sales Order No.", ReqLine."Sales Order Line No.");
                    Clear(RecSalesHeader);
                    RecSalesHeader.GET(RecSalesHeader."Document Type"::Order, ReqLine."Sales Order No.");
                    if RecSalesHeader."Currency Code" = PurchOrderHeader."Currency Code" then begin
                        //PurchOrderLine.Validate("Direct Unit Cost", (RecSalesLine."Line Amount" * RecVendor.Percentage / 100) / RecSalesLine.Quantity);
                        //commented above code as suggested by Biplab sir on 30th November 2021- in case of 100% discount line Amount is becoming 0
                        PurchOrderLine.Validate("Direct Unit Cost", Round(RecSalesLine."Unit Price" * RecVendor.Percentage / 100, 0.01, '='));
                        PurchOrderLine.Validate("Line Discount %", RecSalesLine."Line Discount %");
                        //flowing dicsount from sales line to purchase line as we were having 100% discunt case
                    end else begin

                        CLEAR(CurrencyFactor);
                        IF RecSalesHeader."Currency Factor" <> 0 THEN
                            CurrencyFactor := RecSalesHeader."Currency Factor"
                        ELSE
                            CurrencyFactor := 1;

                        Clear(CurrencyExchangeRate);
                        ExchangeRateAmt := CurrencyExchangeRate.GetCurrentCurrencyFactor(PurchOrderHeader."Currency Code");
                        //PurchOrderLine.Validate("Direct Unit Cost", Round((RecSalesLine."Unit Price" / CurrencyFactor) * ExchangeRateAmt, 0.01, '=') * RecVendor.Percentage / 100);
                        //commented above code as suggested by Biplab sir on 30th November 2021- in case of 100% discount line Amount is becoming 0
                        PurchOrderLine.Validate("Direct Unit Cost", Round(((RecSalesLine."Unit Price" / CurrencyFactor) * ExchangeRateAmt) * RecVendor.Percentage / 100, 0.01, '='));
                        PurchOrderLine.Validate("Line Discount %", RecSalesLine."Line Discount %");
                        //flowing dicsount from sales line to purchase line as we were having 100% discunt case
                    end;
                end;
            end;
        end
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Sales Orders", 'OnBeforeInsertReqWkshLine', '', false, false)]
    local procedure OnBeforeInsertReqWkshLine(SalesLine: Record "Sales Line"; SpecOrder: Integer;
    var ReqLine: Record "Requisition Line")
    begin
        ReqLine."Shortcut Dimension 1 Code" := SalesLine."Shortcut Dimension 1 Code";
        ReqLine."Shortcut Dimension 2 Code" := SalesLine."Shortcut Dimension 2 Code";
        ReqLine."Dimension Set ID" := SalesLine."Dimension Set ID"
    end;
}