[{if $oView->isActive('FbShare') && $oViewConf->getFbAppId()}]
    <fb:share-button href="[{$oView->getCanonicalUrl()}]"></fb:share-button>
[{/if}]

