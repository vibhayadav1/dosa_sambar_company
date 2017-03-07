# dosa_sambar_company
Who doesn't love Dosa? This is a test repo for playing

# Centre Websites

Powering:
* uk.westfield.com
* westfield.com
* westfield.com.au
* westfield.co.nz

An overview of the AEM platform can be found
[here](https://docs.adobe.com/docs/en/aem/6-0.html).

## Setup

1. Fork the repo
2. `cd aem_unified`
3. Create a [Maven settings file](http://maven.apache.org/settings.html) with the following:

  ```xml
  <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <servers>
      <server>
        <id>westfieldlabs</id>
        <username>aem</username>
        <password>SK8-VxW-wBu-Rb5</password>
        <configuration>
          <timeout>5000</timeout>
        </configuration>
      </server>
      <server>
        <id>westfieldlabs-aem</id>
        <username>aem</username>
        <password>SK8-VxW-wBu-Rb5</password>
        <configuration>
          <timeout>5000</timeout>
        </configuration>
      </server>
      <server>
        <id>adobe</id>
        <configuration>
          <timeout>5000</timeout>
        </configuration>
      </server>
    </servers>
  </settings>
  ```

  *On OS X and Linux, this file should be located at `~/.m2/settings.xml`.*
4. Run `mvn -Pinstall-full clean install` to install dependencies and deploy the entire project (formerly separated Bluegrass, GPP, and Centre) to your local AEM author
5. Run `mvn -Pinstall-pub-full clean install` to install to your publish instance

Note: You may build or deploy sub-modules independently to shorten build time. When you build for the first time with a new version number SNAPSHOT, that is you've rebased after a deployment, you'll need to build the project in it's entirety. To build modules indepdently:

cd <sub-module-dir>

Centre: Run 'mvn -Pinstall-centre-package clean install' or 'mvn -Pinstall-pub-centre-package clean install'
Bluegrass: Run 'mvn -Pinstall-bluegrass-package clean install' or 'mvn -Pinstall-pub-bluegrass-package clean install'
GPP: Run 'mvn -Pinstall-gpp-package clean install' or 'mvn -Pinstall-pub-gpp-package clean install'


## Building

This project uses Maven for building. Common commands:

From the root directory, run ``mvn -Pinstall-full clean install`` to build the bundle and content package and install to a CQ instance.

## Sandbox

Each week the sandbox environments reloads fresh content from the production environments. Any new features that is not external facing on production will be removed. To help re-enable such features, we have a nifty script available.

From the root directory, run ``ruby sandbox.rb host=<<sandbox domain>>`` to enable the various feature toggles and activate the changes.

The script currently supports the following:
1. DSS
2. Wallet
3. Smart Parking
4. Favorites


## Frontend

### Prerequisites
Node.js v6 (Download from the node website)

Go to centre with `cd centre`

Install dependencies with `npm install`

Gulp (run `npm install -g gulp`)

Bower (run `npm install -g bower`)

Run `gulp env` to setup your `.env` file.

### Development

To compile all jsp, scss and coffeescript files when they change, and then deploy them to your local AEM instance run:

`gulp` (or `gulp sandbox` if you are using a sandbox)

*This also integrates with the "livereload" Chrome extension which refreshes the page once a file has changed*

To build the css and js files, run

`gulp build`

To update bower dependencies (ie get latest version of aurora if there is a new update), run:
`bower install` then check in the new files.


### Analytics
See [Analytics Documents](docs/analytics.md) for a `how-to` overview.

### Testing
To run integration tests:

```
npm test
```

To run unit tests:

```
npm run test:unit
```


See [Testing Documents](docs/testing.md) for a `how-to` overview.

### CoffeeScript linter

To run the coffeescript linter:

```
gulp coffee:lint
```

## Deploying

See [CW Deployments](https://github.com/westfield/engineering/blob/master/aem/cw-deployments.md) for deployment instructions.

## Specifying CRX Host/Port

The CRX host and port can be specified on the command line with:
mvn -Dcrx.host=otherhost -Dcrx.port=5502 <goals>