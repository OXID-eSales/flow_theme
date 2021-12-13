# Flow Theme

## General Information

*Flow* is a responsive theme for all OXID eShop editions.


## Installation

### Step 1: Select the appropriate branch

* Branch ``b-1.0`` contains *Flow* for OXID eShop version 4.10/5.3
* Branch ``b-2.x`` contains *Flow* for OXID eShop version 6.0.0
* Branch ``b-3.x`` contains *Flow* for OXID eShop compilation 6.1, 6.2 and 6.3
* Branch ``master`` contain *Flow* for OXID eShop master branch latest commits

### Step 2: Get the source code

Check out the appropriate branch for your OXID eShop version into the shop's ``Application/views`` directory:

```
cd DOCUMENT_ROOT/Application/views/
git clone -b BRANCH_NAME https://github.com/OXID-eSales/flow_theme.git flow
```

You should now have a new folder ``DOCUMENT_ROOT/Application/views/flow``.

### Step 3: Prepare the ``out`` folder

The ``out`` folder can be prepared in two possible ways. The first option is to use symbolic links, the second is to copy. Using a symbolic link is strongly recommended, as otherwise you would have do the copying everytime *Flow* is updated.

#### Option 1: Symbolic Linking

Link the theme's ``out`` directory to the ``out`` directory of the shop:

``ln -s ../Application/views/flow/out/flow ../../out/flow``

#### Option 2: Copying

Copy theme's ``out`` directory to shop:

``cp -r flow/out/flow ../../out/flow``

You now should be able to do ``cd ../../out/flow``.

### Step 4: Activate theme 

Log into the admin panel, go to *Extensions → Themes → Flow* and press the *Activate* button. Clean the cache and off you go, my friend!

## Development

All *Flow* theme related CSS/Javascript files can be found in theme's ``build`` directory. To regenerate the theme's assets, the ``grunt`` tasks should be used. Please install ``grunt`` and run ``grunt's`` default task to regenerate all minimized ``css`` and ``js`` files:

To get the development files you need to [clone the repository](#step-2-get-the-source-code).

1. To use ``grunt``, ``npm`` is required. Check ``nodejs`` website for installation
instructions (https://nodejs.org/en/download/package-manager/). Example of
Installation on ubuntu system:

	```
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
	```

2. Install ``grunt`` globally and update npm. Example:

	```
    sudo npm install -g npm grunt-cli 
    ```

3. Go to "flow" theme's directory and install all related ``grunt`` plugins:

	```
    cd DOCUMENT_ROOT/Application/views/flow/
    npm install
    ```

4. Now its possible to regenerate "flow" theme assets by running ``grunt`` default
task while being in "flow" directory:

	```
	grunt
	```

## Contributing

If you are interested in contributing of some changes, Please read [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.

## Distribution notice
The Flow Theme will not be shipped with the next major release of OXID eShop (>6) as it is using older components!
Please consider to use the [Wave Theme](https://github.com/OXID-eSales/wave-theme).

## Issues

Please forward all issues to https://bugs.oxid-esales.com/ for the project **Flow Theme**.
