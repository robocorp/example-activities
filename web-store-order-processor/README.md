# Web store order processor example activity

Swag order robot. Places orders at https://www.saucedemo.com/ by processing a
spreadsheet of orders and ordering the specified products using browser
automation. Uses local or cloud vault for credentials.

## Setup

Install Python package dependencies:

```bash
pip install rpa-framework
```

## Configure local vault

The robot needs credentials for logging in to the web store. These credentials
are provided from a _vault_. Vault can be configured both for local runs or in
the cloud.

### Create a local vault

Create a `vault.json` on your file system. Place the file outside your
repository. Do not commit your vault file.

Paste this content in the vault file:

```json
{
  "swaglabs": {
    "username": "standard_user",
    "password": "secret_sauce"
  }
}
```

In `devdata/env.json`, edit the `RPA_SECRET_FILE` variable to point to the
`vault.json` file on your filesystem. On macOS / Linux, use normal file paths,
for example, `"/tmp/vault.json"`. On Windows 10, you need to escape the path, for
example, `"C:\\Users\\User\\vault.json"`.

### Robocloud

Configure your vault using the UI. The name of the vault should be `swaglabs`.
Provide the user name and the password as key-value pairs (see the vault file
for the exact naming).

## Executing with Robocode CLI

> Assumes `robocode` is installed. Install with `pip install robocode`.

Create an executable package:

```bash
robo wrap
```

Execute the activity using the local environment variables file:

Windows:

```bash
robo run entrypoint.cmd -v devdata\env.json
```

macOS / Linux:

```bash
robo run entrypoint.sh -v devdata/env.json
```
