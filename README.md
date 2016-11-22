# install-aws-cli

Installs the AWS Command Line Tools

Based on [AWS CLI installation](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

## Options

- `key` required
- `secret` required
- `region` optional
- `version` optional, defaults to latest

### Example

```yaml
steps:
  - edgecaseadmin/install-aws-cli:
      key: $AWS_KEY
      secret: $AWS_SECRET
      region: $AWS_REGION
      version: 1.11.18
```
