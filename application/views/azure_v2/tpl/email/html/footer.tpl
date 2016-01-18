                                    <table class="row footer">
                                        <tr bgcolor="#ebebeb">
                                            <td class="wrapper">
                                                <table class="six columns">
                                                    <tr>
                                                        <td class="left-text-pad">
                                                            <h5>[{oxmultilang ident="DD_FOOTER_CONTACT_INFO"}]</h5>
                                                            [{oxcontent ident="oxemailfooter"}]
                                                        </td>
                                                        <td class="expander"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            [{if $oViewConf->getViewThemeParam('sFacebookUrl') || $oViewConf->getViewThemeParam('sGooglePlusUrl') || $oViewConf->getViewThemeParam('sTwitterUrl') || $oViewConf->getViewThemeParam('sYouTubeUrl') || $oViewConf->getViewThemeParam('sBlogUrl')}]
                                                <td class="wrapper last">
                                                    <table class="six columns">
                                                        <tr>
                                                            <td class="right-text-pad">

                                                                <h5>[{oxmultilang ident="DD_FOOTER_FOLLOW_US"}]</h5>

                                                                [{if $oViewConf->getViewThemeParam('sFacebookUrl')}]
                                                                    <table class="tiny-button facebook">
                                                                        <tr>
                                                                            <td>
                                                                                <a href="[{$oViewConf->getViewThemeParam('sFacebookUrl')}]" target="_blank">Facebook</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br>
                                                                [{/if}]

                                                                [{if $oViewConf->getViewThemeParam('sTwitterUrl')}]
                                                                    <table class="tiny-button twitter">
                                                                        <tr>
                                                                            <td>
                                                                                <a href="[{$oViewConf->getViewThemeParam('sTwitterUrl')}]" target="_blank">Twitter</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br>
                                                                [{/if}]

                                                                [{if $oViewConf->getViewThemeParam('sGooglePlusUrl')}]
                                                                    <table class="tiny-button google-plus">
                                                                        <tr>
                                                                            <td>
                                                                                <a href="[{$oViewConf->getViewThemeParam('sGooglePlusUrl')}]" target="_blank">Google+</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br>
                                                                [{/if}]

                                                                [{if $oViewConf->getViewThemeParam('sYouTubeUrl')}]
                                                                    <table class="tiny-button youtube">
                                                                        <tr>
                                                                            <td>
                                                                                <a href="[{$oViewConf->getViewThemeParam('sYouTubeUrl')}]" target="_blank">YouTube</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                [{/if}]

                                                            </td>
                                                            <td class="expander"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            [{/if}]
                                        </tr>
                                    </table>


                                    <table class="row">
                                        <tr>
                                            <td class="wrapper last">

                                                <table class="twelve columns">
                                                    <tr>
                                                        <td align="left">
                                                            [{*ToDo*}]
                                                        </td>
                                                        <td class="expander"></td>
                                                    </tr>
                                                </table>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>


                    </center>
                </td>
            </tr>
        </table>
    </body>
</html>