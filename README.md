# tf-common-patterns

## Examples
- [Reading JSON from a file](./reading-json-from-file-and-merge-on-key/reading-json-from-file-and-merge-on-key.md)

```json

  "ID": "82f64bfa-22c2-5727-0f5d-0bae376f6584",
  "Name": "webapp",
  "Tags": ["rds", "aws"],
  "Address": "10.0.1.136",
  "Port": 3306,
  "Meta": {
    "mysql_version": "5.7"
  },
  "EnableTagOverride": false,
  "Check": {
    "name": "TCP Check on port 3306",
    "tcp": "10.0.1.136:3306",
    "interval": "10s",
    "timeout": "1s"
  }
}
```
