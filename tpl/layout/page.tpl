[{if !isset($sidebar)}][{assign var="sidebar" value=null}][{/if}]
[{if !isset($oxidBlock_head)}][{assign var="oxidBlock_head" value=null}][{/if}]
[{if !isset($force_sid)}][{assign var="force_sid" value=null}][{/if}]
[{if !isset($Errors)}][{assign var="Errors" value=null}][{/if}]
[{if !isset($oxidBlock_pageScript)}][{assign var="oxidBlock_pageScript" value=null}][{/if}]
[{if !isset($oxidBlock_pagePopup)}][{assign var="oxidBlock_pagePopup" value=null}][{/if}]
[{if !isset($blWorkaroundInclude)}][{assign var="blWorkaroundInclude" value=null}][{/if}]
[{if !isset($blHideBreadcrumb)}][{assign var="blHideBreadcrumb" value=null}][{/if}]

[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]

    [{block name="layout_header"}]
        [{include file="layout/header.tpl"}]
    [{/block}]

    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    <div id="wrapper" [{if $sidebar}]class="sidebar[{$sidebar}]"[{/if}]>

        <div class="[{if $blFullwidth}]container[{else}]container-fluid[{/if}]">

            <div class="underdog">

                <div class="row">

                    [{if $oView->getClassName()=='start' && $oView->getBanners() && !empty($oView->getBanners())}]
                        [{include file="widget/promoslider.tpl"}]
                    [{/if}]

                </div>

                <div class="content-box">

                    [{if $oView->getClassName() != "start" && !$blHideBreadcrumb}]
                        [{block name="layout_breadcrumb"}]
                            [{include file="widget/breadcrumb.tpl"}]
                        [{/block}]
                    [{/if}]

                    [{if isset($smarty.capture.loginErrors)}]
                        [{$smarty.capture.loginErrors}]
                    [{/if}]

                    <div class="row">
                        [{if $sidebar && $sidebar != "Right"}]
                            <div class="col-xs-12 col-md-3 [{$oView->getClassName()}]">
                                <div id="sidebar">
                                    [{include file="layout/sidebar.tpl"}]
                                </div>
                            </div>
                        [{/if}]

                        <div class="col-xs-12 [{if $sidebar}]col-md-9[{/if}]">

                            <div id="content">
                                [{block name="content_main"}]
                                    [{include file="message/errors.tpl"}]

                                    [{foreach from=$oxidBlock_content item="_block"}]
                                        [{$_block}]
                                    [{/foreach}]
                                [{/block}]
                            </div>

                        </div>

                        [{if $sidebar && $sidebar == "Right"}]
                            <div class="col-xs-12 col-md-3 [{$oView->getClassName()}]">
                                <div id="sidebar">
                                    [{include file="layout/sidebar.tpl"}]
                                </div>
                            </div>
                        [{/if}]
                    </div>

                </div>

            </div>

        </div>

    </div>

    [{include file="layout/footer.tpl"}]

    [{block name="layout_init_social"}]
    [{/block}]

    <i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]
