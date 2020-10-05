# Web store order processor example robot

Swag order robot. Places orders at https://www.saucedemo.com/ by processing a
spreadsheet of orders and ordering the specified products using browser
automation. Uses local or cloud vault for credentials.

## Configure local vault

See https://robocorp.com/docs/development-howtos/variables-and-secrets/vault

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
for example, `"/Users/<username>/vault.json"` or `"/home/<username>/vault.json"`.
On Windows 10, you need to escape the path, for example, `"C:\\Users\\User\\vault.json"`.

### Robocorp Cloud

Configure your vault using the UI. The name of the vault should be `swaglabs`.
Provide the user name and the password as key-value pairs (see the vault file
for the exact naming).

## Access the code

Click the link below to get to the code:

[tasks.robot](./tasks.robot)
