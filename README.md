# faker-infra (monorepo)

    2020 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/faker-infra


### Create Infrastructure

```
(cd gitlab_server && terraform apply -auto-approve)
(cd gitlab && terraform apply -auto-approve)
(cd gitlab_runners && terraform apply -auto-approve)
(cd rancher_server && terraform apply -auto-approve)
(cd rancher_bootstrap && terraform apply -auto-approve)
(cd rancher && terraform apply -auto-approve)
```

### Destroy Infrastructure

```
(cd rancher && terraform destroy -auto-approve)
(cd rancher_bootstrap && terraform destroy -auto-approve)
(cd rancher_server && terraform destroy -auto-approve)
(cd gitlab_runners && terraform destroy -auto-approve)
(cd gitlab && terraform destroy -auto-approve)
(cd gitlab_server && terraform destroy -auto-approve)
```
