# Terraform Demo Repository

This repo is used to perform TFE (SaaS) demos with AWS.

In order to perform the demo correctly, the github access should be [configured accordingly](https://www.terraform.io/docs/enterprise/vcs/github.html) in TFE.

# Phases and Patterns on Terraform adoption

 - Individual use
 - Teams
 - Organizations

# Workspaces and Organizations

Workspaces are technically equivalent to renaming your state file. They are not any more complex than that.
Terraform wraps this simple notion with a set of protections and support for remote state.

As an example, you can use a different workspace in order to have a staging environment in another AWS region.

You can view a [video](https://www.youtube.com/watch?v=atBRAG_3yNQ) showcasing workspaces in Terraform Enterprise.

Organizations are a shared space for teams to collaborate on workspaces in Terraform Enterprise.
Organizations are a group of users in Terraform Enterprise that have access and ownership over shared resources.
When operating within a team, we recommend creating an organization to manage access control, auditing, billing and authorization.

# Private Module Registry

The registry at registry.terraform.io only hosts public modules, but most organizations have some modules that can't, shouldn't, or don't need to be public.

If your organization is specialized enough that teams frequently use modules created by other teams, you will benefit from a private module registry.

# Sentinel

Sentinel is an embedded policy-as-code framework integrated with the HashiCorp Enterprise products. It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources.

# Policy as code:

We will use a module that has no tags and if we put in place a policy that checks the existence of tags in the instances that we spin, we will see how Sentinel will detect it and depending on the policy level will act accordingly.

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
# Permissions:

Teams can have read, write, or admin permissions on workspaces.

