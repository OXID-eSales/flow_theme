# OXID responsive Theme

##General Information

"Flow" is responsive theme for OXID eShop.

##Branches

Currently we have two main branches for "flow" theme:

* Branch ``b-0.1`` is for 5.3+ (4.10+ in case of CE edition) < x < 6.0 shop.
* Branch ``master`` is for 6.0+ shop.


##﻿Installation

Checkout appropriate "flow" theme repository branch by your shop version to shop's
``Application/views`` directory and link or copy theme's ``out/flow`` directory to shop's ``out/flow``:

* Clone "flow" theme:

	```
	cd <shopSourceDirectory>
	git clone -b master https://github.com/OXID-eSales/flow_theme.git Application/views/flow
	```

* Link theme's ``out`` directory to shop:

	```
	cd out
	ln -s ../Application/views/flow/out/flow flow
	```
	Or copy theme's ``out`` directory to shop:

	```
	cp -r Application/views/flow/out/flow out/flow
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
    cd <shopSourceDirectory>/Application/views/flow/
    sudo npm install
    ```

4. Now its possible to regenerate "flow" theme assets by running ``grunt`` default
task while being in "flow" directory:

	```
	grunt
	```

##Contributing

If you are interested in contributing of some changes, Please read [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.
