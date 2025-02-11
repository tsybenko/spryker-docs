---
title: 'Step 2: Upgrade the PHP version'
description: To migrate to SCCOS, you need to upgrade the PHP version.
template: howto-guide-template
last_updated: Dec 6, 2023
---

After you have [integrated the Docker SDK](/docs/scos/dev/migration-concepts/migrate-to-sccos/step-1-integrate-the-docker-sdk.html), you have to upgrade the PHP version. 
To upgrade, follow these steps.

## 1. Check project code for PHP 8.0 compatibility using PHPCompatibility

To check the project code, do the following:

1. Require the `php-compatibility` package:

```bash
composer require --dev phpcompatibility/php-compatibility --ignore-platform-reqs
```

2. Tune phpcs settings to allow `php-compatibility` rules:
```bash
vendor/bin/phpcs --config-set installed_paths vendor/phpcompatibility/php-compatibility
```

3. Execute the `php-compatibility` sniffer:

```bash
vendor/bin/phpcs -p src/ --standard=PHPCompatibility  --runtime-set testVersion 8.0
```
This returns the code that's not compatible with PHP 8.0.

4. Fix all discovered incompatibilities.

## 2. Check composer dependencies for PHP 8.0 compatibility

To check composer dependencies, do the following:

1. To discover all incompatible composer packages with the required PHP version, run the following command:

```bash
composer why-not php 8.0
```
2. Update packages to make composer dependencies compatible with PHP 8.0.

3. Update platform requirements:

```bash
  "config": {
    "preferred-install": "dist",
    "platform": {
      "php": "8.0"
    },
```

## 3. Change the Docker image to php 8.0

Add the new PHP version in every `deploy.yml` file:

```bash
image:
    tag: spryker/php:8.0
    environment:
```

## Next step
 [Migrate non-standard services](/docs/scos/dev/migration-concepts/migrate-to-sccos/step-3-migrate-non-standard-services.html)
