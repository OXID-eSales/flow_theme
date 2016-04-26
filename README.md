# OXID responsive Theme

##General Information

"Flow" is responsive theme for OXID eShop.

##Branches

Currently we have two main branches for "flow" theme:

* Branch ``b-1.0`` is for 5.3+ (4.10+ in case of CE edition) < x < 6.0 shop.
* Branch ``master`` is for 6.0+ shop.


##﻿Installation

Checkout appropriate "flow" theme repository branch by your shop version to shop's
``application/views`` directory and link or copy theme's ``out/flow`` directory to shop's ``out/flow``:

* Clone "flow" theme:

	```
	cd <shopSourceDirectory>
	git clone -b b-1.0 https://github.com/OXID-eSales/flow_theme.git application/views/flow
	```

* Link theme's ``out`` directory to shop:

	```
	cd out
	ln -s ../application/views/flow/out/flow flow
	```
	Or copy theme's ``out`` directory to shop:

	```
	cp -r application/views/flow/out/flow out/flow
    ```

*  Activate theme in shop admin:

Go to eShopAdmin->Extensions->Themes->Flow and Press "Activate" button.

##Development

All "flow" theme related ``css/javascript`` files can be found in theme's ``build`` directory,
For regenerating theme's assets, the ``grunt`` tasks should be used. Please install ``grunt`` and
run ``grunt's`` default task to regenerate all minimized ``css`` and ``js`` files:

1. To use ``grunt``, ``npm`` is required. Check ``nodejs`` website for installation
instructions (https://nodejs.org/en/download/package-manager/). Example of
Installation on ubuntu system:

	```
	curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
	sudo apt-get install -y nodejs
	```

2. Install ``grunt`` globally. Example:

	```
    sudo npm install -g grunt-cli
    ```

3. Go to "flow" theme's directory and install all related ``grunt`` plugins:

	```
    cd <shopSourceDirectory>/application/views/flow/
    sudo npm install
    ```

4. Now its possible to regenerate "flow" theme assets by running ``grunt`` default
task while being in "flow" directory:

	```
	grunt
	```

##Contributing

If you are interested in contributing of some changes, Please read [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.

##License

Licensing of the software product depends on the shop edition used. The software for OXID eShop Community Edition is published under the GNU General Public License v3. You may distribute and/or modify this software according to the licensing terms published by the Free Software Foundation. Legal licensing terms regarding the distribution of software being subject to GNU GPL can be found under http://www.gnu.org/licenses/gpl.html. The software for OXID eShop Professional Edition and Enterprise Edition is released under commercial license. OXID eSales AG has the sole rights to the software. Decompiling the source code, unauthorized copying as well as distribution to third parties is not permitted. Infringement will be reported to the authorities and prosecuted without exception.
