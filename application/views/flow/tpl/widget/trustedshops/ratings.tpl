[{if $oView->getTrustedShopId()}]
    [{assign var="tsId" value=$oView->getTrustedShopId()}]
[{/if}]

[{if $oView->getTSExcellenceId()}]
    [{assign var="tsId" value=$oView->getTSExcellenceId()}]
[{/if}]

[{block name="dd_widget_sidebar_trustedshopsratings"}]
    [{assign var="tsRatings" value=$oViewConf->getTsRatings()}]
    [{if !$tsRatings.empty}]
        <div>
            [{$tsRatings.shopName}] [{oxmultilang ident="RATINGS_TXT_1"}]
            <span xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Review-aggregate">
                <span rel="v:rating"><span property="v:value">[{$tsRatings.result|number_format:2:",":"."}]</span></span>/<span property="v:best">[{$tsRatings.max|number_format:2:",":"."}]</span> [{oxmultilang ident="RATINGS_TXT_2"}] <span property="v:count">[{$tsRatings.count|number_format:0:",":"."}]</span>
            </span> [{oxmultilang ident="RATINGS_TXT_3"}]
            <a href="https://www.trustedshops.de/bewertung/info_[{$tsId}].html" title="[{$tsRatings.shopName}] [{oxmultilang ident='RATINGS'}]" target="_blank">[{oxmultilang ident="RATINGS_TXT_4"}]</a>.
        </div>
    [{/if}]
[{/block}]