# AlwaysBeRunning.net (ABR)

### Installation (Linux/Mac)

You will need the following in order to run ABR locally:
- MySQL (preferably)
- PHP
- PHP Composer
- Node, NPM
- JQ - download via apt-get (Debian) or homebrew (Mac), this is NOT an npm module
- imagemagick

1. Clone ABR from GitHub
2. Install npm dependencies, install npm gulp globally

        npm install
        npm install -g gulp

3. Install PHP dependencies

        php composer.phar install

4. Run gulp to prepare assets (do this every time if you change JS or CSS)

        gulp

5. Configure the settings of your local environment. Rename the **.example.env** file to **.env**. Edit the DB settings to connect to your locally running DB. *Ask the main dev (madarasz / Necro) for NetrunnerDB keys*.
Google API keys, you can create yourself.
6. Prepare ID icons by running this script (downloads from NetrunnerDB, run it regularly)

        ./get_id_images.sh

7. Prepare DB tables

        php artisan migrate
        php artisan db:seed

8. Add Badges data to your database by importing `badges.sql`

9. Run the webapp. It should be available at [http://localhost:8000](http://localhost:8000) afterwards.

        php artisan serve

10. Make yourself an admin. Go to the webapp in your browser. Login via NetrunnerDB to enter your user in the DB. Check your DB (use phpMyAdmin), in table **users** set the **admin** value of your user to 1. If you reload the webapp you should see the **Admin** section in the top menu.

12. Download all the data required from NetrunnerDB. Go to [Admin section](http://localhost:8000/admin) and click the **Update Card cycles**, **Update Card packs** and **Update Identities** buttons to get the data. Do this every time a new pack comes out.

13. You are done :)

### Automated tests

There are Nightwatch automated integration tests in the *tests/nightwatch* directory.

Install globally nightwatch and webdriver-manager
```
npm install -g nightwatch
npm install -g webdriver-manager
```

Update webdriver-manager: `webdriver-manager update`

Start webdriver-manager process in seperate terminal
```
webdriver-manager start
```

Run Nightwatch tests on **Chrome** by command:

        gulp nightwatch:chrome
        
There are currently problems with running tests on **PhantomJS** and **Safari**
Safari browser must be enabled for automation, [https://webkit.org/blog/6900/webdriver-support-in-safari-10/](read more)

To delete test data (substitute current year):
```
DELETE FROM entries WHERE tournament_id IN (SELECT id FROM tournaments WHERE title LIKE '%|2019%')
DELETE FROM tournaments WHERE title LIKE '%|2019%'
```