[{if $oxcmp_basket->isNewItemAdded() && $oView->getNewBasketItemMsgType() == 2}]
    [{include file="widget/minibasket/minibasket.tpl" _prefix="modal"}]
[{/if}]