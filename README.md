# Terraform demo Repository

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
