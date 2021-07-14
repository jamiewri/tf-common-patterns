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
