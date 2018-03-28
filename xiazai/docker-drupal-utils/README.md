Drupal Docker Utils


# Available

## PHPCS

Check current folder against Drupal Coding standards:
```
docker run --rm -ti -v $(pwd):/var/www/html zaporylie/phpcs
```

## SSHD

Get access to /var/www/html from another php container:
```
docker run -dP --volumes-from=<your-php-container> zaporylie/sshd
```

## GIT

### Auto

Automatically discover if repository exists and pull or clone (according to the result)
```
docker run --rm --ti --volumes-from=<app-data-container> zaporylie/git
```

### Clone

Clone repository to /var/www/html:
```
docker run --rm --ti --volumes-from=<app-data-container> zaporylie/git:clone
```

### Pull

Pull (fetch + merge) remote repository:
```
docker run --rm --ti --volumes-from=<app-data-container> zaporylie/git:pull
```

## Backup

Backup public and private folders + database and store in current path:
```
docker run --rm --ti --volumes-from=<app-data-container> --link=<your-mysql-container>:db -v $(pwd):/var/backups zaporylie/backup
```
