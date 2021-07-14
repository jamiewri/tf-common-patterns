# Reading JSON from a file inorder to build new data structure

## Example files
### Json blob 1
```json
{
    "subnets" : ["100.1.1.1", "100.2.2.2"],
    "name" : "bob",
    "environment" : "dev"
}
```

### Json blob 2
```json
{
    "subnets" : ["100.1.1.3", "100.2.2.3"],
    "name" : "bobby",
    "environment" : "prod"
}
```

### Terraform
```hcl
locals {
  inputvars = [ for f in fileset(path.module, "*.json") : jsondecode(file(f)) ]
  inputmap = {for app in toset(local.inputvars): app.name => app}
}

output "jsonblob" {
  value = local.inputvars
}

output "mungedjson" {
  value = local.inputmap
}
```

### Outcome
```
 + jsonblob   = [
      + {
          + environment = "dev"
          + name        = "bob"
          + subnets     = [
              + "100.1.1.1",
              + "100.2.2.2",
            ]
        },
      + {
          + environment = "prod"
          + name        = "bobby"
          + subnets     = [
              + "100.1.1.3",
              + "100.2.2.3",
            ]
        },
    ]
  + mungedjson = {
      + bob   = {
          + environment = "dev"
          + name        = "bob"
          + subnets     = [
              + "100.1.1.1",
              + "100.2.2.2",
            ]
        }
      + bobby = {
          + environment = "prod"
          + name        = "bobby"
          + subnets     = [
              + "100.1.1.3",
              + "100.2.2.3",
            ]
        }
    }
```
