Fighcell Yii2 Base App
======================

Fighcell Yii2 Base app is forked nenad yii2-advanced-template modified by Nenad and created by yii2 core developers.
There are several changes made to this template to ease the start of developing a web application.

1. This template has additional features listed in the next section of this guide.
2. Application structure has been changed to be 'shared hosting friendly'.

Features
-------------------

- Signup with/without account activation
    - You can chose whether or not new users need to activate their account using email account activation system before they can log in. (see: common/config/params.php).
- Login using email/password or username/password combo.
    - You can chose how users will login into system. They can log in either by using their username|password combo or email|password. (see: common/config/params.php).
- Rbac tables are installed with other migrations when you run ```yii migrate``` command.
    - RbacController's init() action will insert 5 roles and 2 permissions in our rbac tables created by migration.
    - Roles can be easily assigned to users by administrators of the site (see: backend/user).
    - Nice example of how to use rbac in your code is given in this application. See: BackendController.
- Users with editor+ roles can create articles.
- Session data is stored in database out of box.
- System setting are stored in config/params.php file ( changes from v2 ).
- Theming is supported out of the box.
- Translation is supported out of the box.
- Administrators and The Creator can manage users ( changes from v2 ).
- Password strength validation and strength meter.
- All functionalities of default advanced template are included in this template.
- Code is heavily commented out.

Development Setup and Installation
-------------------------------------
Cloning this Repo for Development
Login to dev.azure.com  and open virtualmv repository

Go to More Actions (vertical ellipsis) and select fork

Enter Repo Name virtualmin-"devname") "devname" is the developer name and Branches to include: All branches

Local create and add SSH key

eval $(ssh-agent -s) ssh-add ~/location/to/ssh/key

Now open up your console and cd to your web root directory, or project folder for example: cd /var/www/sites/

Git clone the repo in to the root. A new folder by the name "ProjectFolderName" will be created for the project with the following command:

git clone git@ssh.dev.azure.com:v3/virtualmv-dev/virtual.mv/virtual.mv.devname ProjectFolderName where "ProjectFolderName" is where you want to store the project files

If you require help in setting up PHP, Composer please let Faisal know. I am assuming that you know how to: install and use Composer, and install additional packages/drivers that may be needed for you to run everything on your system. In case you are new to all of this, you can check default yii2 installation guides, provided by yii2 developers.

Create database that you are going to use for your application (you can use phpMyAdmin or any other tool you like). Alway for development use the application repo name as the database name and database user and defined password in the environment dev folder as below: database name => virtualmv username => virtualmv password => 123virtualmv098

Once cloning is completed, you need to initialize it in one of two environments: development (dev) or production (prod). Change your working directory to _protected and execute php init command.

cd projectfoldername/_protected/

php init

Type 0 for development, execute coomant, type yes to confirm, and execute again.

Now you need to tell your application to use database that you have previously created. Open up main-local.php config file in advanced/_protected/common/config/main-local.php and adjust your connection credentials. We encourage all developers to use visual code for development.

Go to project root directly and run command: code . to start visual code with project files

Back to the console. It is time to run yii migrations that will create necessary tables in our database. While you are inside _protected folder execute the following migration commands in the following order:
./yii migrate/up --migrationPath=@vendor/dektrium/yii2-user/migrations ./yii migrate/up --migrationPath=@yii/rbac/migrations ./yii migrate OR if you are on Windows ommit the "./" like so from the command: yii migrate

Execute rbac controller init action that will populate our rbac tables with default roles and permissions:
./yii rbac/init or if you are on Windows yii rbac/init

Make sure to develop in a Develop Branch or a Feature Branch always and never to develop in the Master Branch:
git switch develop

SOME HELPFULL GIT COMMANDS
--------------------------
git status git add . Adds ALL changed filed to Stage in case of adding individual files use "filename" instead git commit -m "Details of the commit" Try to commit with as little changes as possible so that valid commit messages can be given for tracking and monitoring purpose git push Pushes the commits to the remote (bitbucket repository)

You are done, you can start your application in your browser.

*Tip: if your application name is, for example, advanced, to see the frontend side of it you just have to visit this url in local host: localhost/advanced. To see backend side, this is enough: localhost/advanced/backend.

Note: First user that signs up will get 'The Creator' (super admin) role. This is supposed to be you. This role have all possible super powers 😃 . Every other user that signs up after the first one will get 'member' role. Member is just normal authenticated user.

Testing (THIS PART HAS NOT BEEN TESTED YET BUT SHOULD WORK)
If you want to run tests you should create additional database that will be used to store your testing data. Usually testing database will have the same structure like the production one. I am assuming that you have Codeception installed globally, and that you know how to use it. Here is how you can set up everything easily:

Let's say that you have created database called advanced. Go create the testing one called advanced_tests.

Inside your main-local.php config file change database you are going to use to advanced_tests.

Open up your console and cd to the _protected folder of your application.

Run the migrations again: ./yii migrate or if you are on Windows yii migrate

Run rbac/init again: ./yii rbac/init or if you are on Windows yii rbac/init

Now you can tell your application to use your advanced database again instead of advanced_tests. Adjust your main-local.php config file again.

Now you are ready to tell Codeception to use advanced_tests database.

Inside: _protected/tests/codeception/config/config.php file tell your db to use advanced_tests database.

Start your php server inside the root of your application: php -S localhost:8080 (if the name of your application is advanced, then root is advanced folder)

To run tests written for frontend side of your application cd to _protected/tests/codeception/frontend , run codecept build and then run your tests.

Take similar steps like in step 9 for backend and common tests.

Creating a new project using yii2-base
-------------------------------------
1. Clone the yii2-base project
     git clone https://github.com/thephpleague/skeleton my-project
2. Create a new repository for the new Project
3. Check the remote repository details
    git remote -v
4. Remove the remote origin and assign to new remote repo
    git remote remove origin
    git remote add origin (url of new remote repository)
5. Clean the old history from the yii2-base
    git checkout --orphan develop



Directory structure
-------------------
_protected
    backend
        assets/              contains backend assets definition
        config/              contains backend configurations
        controllers/         contains Web controller classes
        helpers/             contains helper classes
        models/              contains backend-specific model classes
        runtime/             contains files generated during runtime
        views/               contains view files for the Web application
    common
        config/              contains shared configurations
        mail/                contains view files for e-mails
        models/              contains model classes used in both backend and frontend
        rbac/                contains role based access control classes
    console
        config/              contains console configurations
        controllers/         contains console controllers (commands)
        migrations/          contains database migrations
        models/              contains console-specific model classes
        runtime/             contains files generated during runtime
    environments             contains environment-based overrides
    frontend
        assets/              contains frontend assets definition
        config/              contains frontend configurations
        controllers/         contains Web controller classes
        models/              contains frontend-specific model classes
        runtime/             contains files generated during runtime
        views/               contains view files for the Web application
        widgets/             contains frontend widgets

assets                   contains application assets generated during runtime
backend                  contains the entry script and Web resources for backend side of application
themes                   contains frontend themes
uploads                  contains various files that can be used by both frontend and backend applications


Features
-------------------

- Signup with/without account activation
    - You can chose whether or not new users need to activate their account using email account activation system before they can log in. (see: common/config/params.php).
- Login using email/password or username/password combo.
    - You can chose how users will login into system. They can log in either by using their username|password combo or email|password. (see: common/config/params.php).
- Rbac tables are installed with other migrations when you run ```yii migrate``` command.
    - RbacController's init() action will insert 5 roles and 2 permissions in our rbac tables created by migration.
    - Roles can be easily assigned to users by administrators of the site (see: backend/user).
    - Nice example of how to use rbac in your code is given in this application. See: BackendController.
- Users with editor+ roles can create articles.
- Session data is stored in database out of box.
- System setting are stored in config/params.php file ( changes from v2 ).
- Theming is supported out of the box.
- Translation is supported out of the box.
- Administrators and The Creator can manage users ( changes from v2 ).
- Password strength validation and strength meter.
- All functionalities of default advanced template are included in this template.
- Code is heavily commented out.



Version 2.2.0 changes
Adds uploads folder to the application root that can be shared by both frontend and backend applications.
@uploads alias has been added, so you can use it in your code ( will target your_app_name/uploads folder )
Additional translations are included. Thanks to MeFuMo and hior
Alert widget call is added to backend main.php layout
Minor fixes
Version 2.1.0 changes
option to CRUD articles ( posts ) has been added
translation support has been included and Serbian translation has been added
themes has been improved
new roles, permissions and rules are added
other code refactoring has been done
Version 2.0 changes
settings are stored in config/params.php configuration file to reduce database load
account update is merged with user management and user management is more powerful now
User model has been separated on UserIdentity and User (for easier understanding and use)
4 beautiful bootstrap responsive themes are included out of the box
comment style is changed according to yii2 official style
tests has been rewritten according to the changes that has been made
a lot of other polishing has been done
Password strength guide
Since 1.1.1 version has been released, password strength extension has been included as a core part of improved templates. Usage is very simple:

In our signup, user create/update and password reset forms password strength meter is always displayed when users are entering their password. This will give them visual representation of their password strength.
But this is not all. As The Creator you have option in your settings "Force Strong Password" that you can use. If you turn it on, users will be forced to use strong passwords according to preset you chose. For example if you use normal preset, users will be forced to use at least 8 characters long password, with at least one upper-case and one lower-case letter, plus at least one digit.

Since version 2 settings are stored in config/params.php file!

Choosing presets:

By default normal preset is used for signup and user create/update forms. For password reset we are using 'reset' preset if you want to customize which presets is used, see SignupForm model, User model and ResetPasswordForm model. You will see rules declared for using strong passwords. Presets are located in vendor/nenad/yii2-password-strength/presets.php. You can chose some other preset declared in presets.php, or create new ones.