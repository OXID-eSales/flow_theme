[{capture append="oxidBlock_content"}]
    <div class="row">
        <div class="col-xs-12">
            [{if $oView->getNewsletterStatus() == 4 || !$oView->getNewsletterStatus()}]
                <h1 class="page-header">[{oxmultilang ident="STAY_INFORMED"}]</h1>
                <div class="row">
                    <div class="col-lg-7">
                        <article>
                            [{oxifcontent ident="oxnewstlerinfo" object="oCont"}]
                                [{$oCont->oxcontents__oxcontent->value}]
                            [{/oxifcontent}]
                        </article>
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                [{include file="form/newsletter.tpl"}]
            [{elseif $oView->getNewsletterStatus() == 1}]
                <h1 class="page-header">[{oxmultilang ident="MESSAGE_THANKYOU_FOR_SUBSCRIBING_NEWSLETTERS"}]</h1>
                <article>
                    <p>[{oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL"}]</p>
                </article>
            [{elseif $oView->getNewsletterStatus() == 2}]
                <h1 class="page-header">[{oxmultilang ident="MESSAGE_NEWSLETTER_CONGRATULATIONS"}]</h1>
                <article>
                    <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_ACTIVATED"}]</p>
                </article>
            [{elseif $oView->getNewsletterStatus() == 3}]
                <h1 class="page-header">[{oxmultilang ident="SUCCESS"}]</h1>
                <article>
                    <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</p>
                </article>
            [{/if}]
        </div>
    </div>
    [{insert name="oxid_tracker"}]
[{/capture}]

[{include file="layout/page.tpl"}]