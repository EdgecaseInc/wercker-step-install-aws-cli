install-aws-cli
===========================

Install AWS Command Line Tools


Example
--------

Add AWS_KEY and AWS_SECRET as deploy target or application environment variables.
`region` is optional.

```
    - edgecaseadmin/install-aws-cli:
        key: $AWS_KEY
        secret: $AWS_SECRET
        region: $AWS_REGION
```