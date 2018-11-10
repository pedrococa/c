# Terraform Demo Repository

This repo is used to perform TFE (SaaS) demos with AWS.

In order to perform the demo correctly, the github access should be [configured accordingly](https://www.terraform.io/docs/enterprise/vcs/github.html) in TFE.

# Workspaces and Organizations

Workspaces are technically equivalent to renaming your state file. They are not any more complex than that.
Terraform wraps this simple notion with a set of protections and support for remote state.

As an example, you can use a different workspace in order to have a staging environment in another AWS region.

You can view a [video](https://www.youtube.com/watch?v=atBRAG_3yNQ) showcasing workspaces in Terraform Enterprise.

Organizations are a shared space for teams to collaborate on workspaces in Terraform Enterprise.

# Private Module Registry

The registry at registry.terraform.io only hosts public modules, but most organizations have some modules that can't, shouldn't, or don't need to be public.

If your organization is specialized enough that teams frequently use modules created by other teams, you will benefit from a private module registry.

# Policy in place:

```
import "ftplan"
main = rule {
  all tfplan.resources.aws_instance as _, instances {
    all instances as _, r {
       (length(r.applied.tags) else 0) >= 1
    }
  }
}
```
