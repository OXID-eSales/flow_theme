<div id="betaNote">
    <div class="notify">
        [{oxmultilang ident='BETA_NOTE'}]
        [{$oxcmp_shop->oxshops__oxversion->value|regex_replace:"/[0-9]+\.[0-9]+\.[0-9]+([_a-zA-Z]+)?/":""}]
        [{oxmultilang ident='BETA_NOTE_MIDDLE'}]
        [{$oxcmp_shop->oxshops__oxversion->value|regex_replace:"/[_a-zA-Z]+[0-9]+/":""}]
        [{oxmultilang ident='BETA_NOTE_FAQ'}]
        <span class="dismiss"><a href="#" title="[{oxmultilang ident='BETA_NOTE_CLOSE'}]">x</a></span>
    </div>
</div>