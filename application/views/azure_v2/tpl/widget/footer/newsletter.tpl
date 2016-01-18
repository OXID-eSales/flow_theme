[{block name="dd_footer_newsletter_form"}]
    <form class="form-inline" role="form" action="[{$oViewConf->getSslSelfLink()}]" method="post">
        [{block name="dd_footer_newsletter_form_inner"}]
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="fnc" value="fill">
                <input type="hidden" name="cl" value="newsletter">
                [{if $oView->getProduct()}]
                    [{assign var="product" value=$oView->getProduct()}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
            </div>

            [{block name="dd_footer_newsletter_form_inner_group"}]
                <label class="sr-only" for="footer_newsletter_oxusername">[{oxmultilang ident="WIDGET_FOOTER_NEWSLETTER_TITLE"}]</label>
                <input class="form-control" type="email" name="editval[oxuser__oxusername]" id="footer_newsletter_oxusername" value="" placeholder="[{oxmultilang ident="EMAIL"}]">
                <button class="btn btn-primary" type="submit">[{oxmultilang ident="FORM_NEWSLETTER_SUBSCRIBE"}]</button>
            [{/block}]
        [{/block}]
    </form>
[{/block}]