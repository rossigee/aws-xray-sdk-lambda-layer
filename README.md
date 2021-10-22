# Lambda layer for AWS X-Ray SDK

Simple usage:

```
./build_layer.sh
```

If your setup is multi-account, you might need to use something like `aws-vault`.

```
aws-vault exec golder-experimental -- ./build_layer.sh
```
