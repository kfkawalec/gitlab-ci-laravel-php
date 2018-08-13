# GitLab CI runner for PHP including Git, Composer and PHPUnit
[![Docker Pulls](https://img.shields.io/docker/pulls/karbon001/gitlab-ci-laravel-php.svg)](https://hub.docker.com/r/karbon001/gitlab-ci-laravel-php/)

Docker images for GitLab CI runner built on top of the [official PHP images](https://hub.docker.com/r/_/php/) with the addition of some common and useful extensions for Laravel Framework.

## Available tags and `Dockerfile` links
- [`latest` (_Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/Dockerfile)
- [`5.6` (_5.6/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/5.6/Dockerfile)
- [`7.0` (_7.0/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/7.0/Dockerfile)
- [`7.1` (_7.1/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/7.1/Dockerfile)
- [`7.2` (_7.2/Dockerfile_)](https://github.com/kfkawalec/gitlab-ci-laravel-php/blob/master/7.2/Dockerfile)

## Installed extensions
The following modules and extensions have been enabled,
in addition to those you can already find in the [official PHP image](https://hub.docker.com/r/_/php/):

- `mcrypt`
- `mbstring`
- `curl`
- `json`
- `pdo_mysql`
- `exif`
- `tidy`
- `zip`
- `gd`
- `ldap`
- `xdebug`

## Composer
[Composer](https://getcomposer.org) is installed globally in the all images.

## Git
[Git](https://git-scm.com/) is installed globally in the all images.

## PHPUnit & CodeSniffer
[PHPUnit](https://phpunit.de/) and [CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) are installed globally in the all images.
