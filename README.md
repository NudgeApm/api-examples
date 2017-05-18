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

### Test connection

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
	"login": "Sylvain",
	"phone": "",
	"position": "",
	"status": "USED",
	"timezone": "Europe/Paris",
	"tokens_url": "https://monitor.nudge-apm.com/api/users/00000000-0000-0000000000000000000000/tokens",
	"url": "https://monitor.nudge-apm.com/api/users/00000000-0000-0000000000000000000000"
}

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
