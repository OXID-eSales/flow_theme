<strong>[{oxmultilang ident="DD_FILE_ATTRIBUTES_FILESIZE"}]</strong> [{$oOrderFile->getFileSize()|oxfilesize}]

[{if $oOrderFile->oxorderfiles__oxdownloadcount->value == 0 && $oOrderFile->getValidUntil() != "0000-00-00 00:00" }]
    [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value}]
        <br>[{oxmultilang ident="START_DOWNLOADING_UNTIL"}] [{$oOrderFile->getValidUntil()|date_format:"%d.%m.%Y"}] [{$oOrderFile->getValidUntil()|date_format:"%H:%M:%S"}] [{oxmultilang ident="DD_FILE_ATTRIBUTES_OCLOCK"}].
    [{/if}]
    [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0}]
        <br><strong>[{oxmultilang ident="LEFT_DOWNLOADS"}]:</strong> [{$oOrderFile->getLeftDownloadCount()}]
    [{/if}]
[{else}]
    [{if $oOrderFile->getValidUntil() != "0000-00-00 00:00" }]
        [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value}]
            <br><strong>[{oxmultilang ident="LINK_VALID_UNTIL"}]:</strong> [{$oOrderFile->getValidUntil()|date_format:"%d.%m.%Y"}] [{$oOrderFile->getValidUntil()|date_format:"%H:%M:%S"}] [{oxmultilang ident="DD_FILE_ATTRIBUTES_OCLOCK"}].
        [{/if}]
    [{/if}]
    [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0}]
        <br><strong>[{oxmultilang ident="LEFT_DOWNLOADS"}]:</strong> [{$oOrderFile->getLeftDownloadCount()}]
    [{/if}]
[{/if}]