# Nudge API examples

## Why ?

- do you need to retrieve data from Nudge APM ?
- do you need to automate operations like "creating new app" or "managing user access" ?

If you answered *yes* to any of above questions, then you are on the right place.

## Requirements

- Bash command line shell
- Curl
- Python (optional), only required for JSON formatting

## 5 minute tutorial

### Create API token

- Log in on [Nudge APM](https://www.nudge-apm.com/)
- Go to user profile.
- In *Authentication Tokens* section, create new token.
- Copy token value we will refer to it as `xxx.yyy.zzz`

### Setup & Test

#### Clone this repository, or [download ZIP](https://github.com/NudgeApm/api-examples/archive/master.zip) if you don't have [Git](https://git-scm.com/).
```bash
git clone https://github.com/NudgeApm/api-examples.git
cd api-examples
```

#### execute `test_connect.sh` with token
```bash
NUDGE_TOKEN=xxx.yyy.zzz ./test_connect.sh
```

You should get a repy similar to this (formatting may differ if python is not available)
```
-- get current user --
request : GET https://monitor.nudge-apm.com/api/users/current
HTTP status : 200
{
	"auth": null,
	"avatar": null,
	"company": "",
	"email": "youremail@yourcompany.com",
	"firstname": "",
	"id": "00000000-0000-0000000000000000000000",
	"lastname": "",
	"locale": "en",
	"login": "YourLogin",
	"phone": "",
	"position": "",
	"status": "USED",
	"timezone": "Europe/Paris",
	"tokens_url": "https://monitor.nudge-apm.com/api/users/00000000-0000-0000000000000000000000/tokens",
	"url": "https://monitor.nudge-apm.com/api/users/00000000-0000-0000000000000000000000"
}

```

### Available examples

#### Get list of applications [list_apps.sh](./list_apps.sh)

```bash
NUDGE_TOKEN=xxx.yyy.zzz ./list_apps.sh
```

#### Get list of accounts [list_accounts.sh](./list_accounts.sh)

```bash
NUDGE_TOKEN=xxx.yyy.zzz ./list_accounts.sh
```

#### Create application(s) [create_app.sh](./create_app.sh)

First, you need to know on which account you should create application.
In order to get account ID, use [Get list of accounts](#get-list-of-accounts)

Account ID (here with 1s) is provided as script argument, name is optional.

```bash
NUDGE_TOKEN=xxx.yyy.zzz ./create_app.sh 11111111-1111-1111111111111111111111 'my awesome new app'
```

If you need to create multiple applications, you just have to write a simple loop.
```bash
for i in 1 2 3 4
do
	NUDGE_TOKEN=xxx.yyy.zzz ./create_app.sh 11111111-1111-1111111111111111111111 "my awesome new app ${i}"
done
```

#### Get application Access Control List (ACL) [get_acl_app.sh](./get_acl_app.sh)

Application ID (here with 2s) should be provided as script argument, you must be admin on this application.

```bash
NUDGE_TOKEN=xxx.yyy.zzz ./get_acl_app.sh 22222222-2222-2222222222222222222222
```

#### Update application Access Control List (ACL) [update_acl_app.sh](./update_acl_app.sh)

Application ID (here with 2s) should be provided as 1st script argument, you must be admin on this application.
An admin and guest emails are required as 2cnd & 3rd arguments.

This example only supports a single guest and a single admin.
Since you can't escape from your own admin duty, you need to use your current account email as 1st argument.

```bash
NUDGE_TOKEN=xxx.yyy.zzz ./get_acl_app.sh 22222222-2222-2222222222222222222222 'my_admin_email@my_company.com' 'guest@my_company.com'
```

#### Export Transactions to CSV [transactions_csv.sh](./transactions_csv.sh)

Application ID (here with 2s) should be provided as 1st script argument.

```bash
# get transactions from last 24h (default)
NUDGE_TOKEN=xxx.yyy.zzz ./get_acl_app.sh 22222222-2222-2222222222222222222222
```

```bash
# get transactions from last hour
NUDGE_TOKEN=xxx.yyy.zzz ./get_acl_app.sh 22222222-2222-2222222222222222222222 -1h
```

### Explore API

- Log in on [Nudge APM](https://www.nudge-apm.com/)
- go to *API* section to see which entry points are available

### Do awesome stuff !

You are now a certified Nudge API master, but don't forget :

> To err is human, to really foul things up requires a computer,
> an API with your credentials and an unattended shell script.

## Other languages

This repository contains examples using *bash* scripting language because it's almost always available on unix/linux
and you can even install it on Windows using *Cygwin* or *Git Bash*.

The goal here is to show you how to authenticate and use API for your needs. Once you get this, you'll be able to
do it in any language platform.

If you have any questions, don't hesitate to contact us at helpdesk@nudge.org.
