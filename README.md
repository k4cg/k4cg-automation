# k4cg automation

Repo, um verschiedenes Automatisierungszeug, Docker und Github Actions auszuprobieren:

* Docker Image mit allen Tools und Abhaengigkeiten fuer Automatisierungsdinge bauen (ansible, terraform)
* Docker Image Lifecycle mit Github Actions (lint, build, scan, publish)
* Playbooks fuer VM Template Erstellung und VM Provisionierung mit ansible und proxmox
* VM Provisionierung mit terraform und proxmox
* Flatcar Linux und Proxmox ausprobieren ([Talk FOSDEM 2022](https://fosdem.org/2022/schedule/event/flatcar_container_linux/))
* ...

## Github Actions

### Workflows

#### development

* Laeuft immer bei:
  * push auf branches ausser main
  * PRs mit target branch main
* Jobs
  * lint: hadolint
  * build: Image bauen, Scan mit trivy (kein Upload zu Github Security)

### Notizen

* [How to build a CI/CD pipeline with GitHub Actions in four simple steps](https://github.blog/2022-02-02-build-ci-cd-pipeline-github-actions-four-steps/)
* [Understanding GitHub Actions (Basics)](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)
* Scheinbar (?) wird nur der Stand aus .github/workflows/... (main) genommen (siehe [Thread im Github Forum](https://github.community/t/workflow-files-only-picked-up-from-master/16129)).. Workaround ausprobieren: PR fuer Branch mit Aenderungen in Workflows machen. Dann triggert aber ein Push auf einen Branch, zu dem schon ein PR existiert, den Workflow mehrmals :/
* Jobs werden by default parallel ausgefuehrt. "needs: ...", um Abhaengigkeiten zu definieren
* Security Settings fuer Github Actions: Settings - Actions - General - Workflow permissions: [Github Actions Dokumentation](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token)

## Ansible

### Installation

Voraussetzung fuer diese Methode: der python package manager `pip` ist bereits auf dem System installiert ([Installationsanleitungen](https://pip.pypa.io/en/stable/installation/)).
Fuer die Verwaltung von python dependencies ist es unter Umstaenden sinnvoll, `pipenv` zu nutzen ([pipenv Webseite](https://pipenv.pypa.io/en/latest/)): `python3 -m pip install --user pipenv`
* [Doku Ansible Installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* `pipenv install ansible`

### Benoetigte Ansible Module

* `community.general.proxmox_kvm` ([Dokumentation](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_kvm_module.html)). Benoetigt die python Module `requests` und `proxmoxer` (siehe [Requirements](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_kvm_module.html#requirements))

### Notes

#### Basics

* [Intro playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)
* [Intro inventories](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#)
* [Dictionary variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#dictionary-variables)

#### Anderes Zeug

* [Implicit localhost](https://docs.ansible.com/ansible/latest/inventory/implicit_localhost.html): `localhost` nutzt die group_vars/all.yml Werte (aber scheinbar nur, wenn mit `-i ...` irgendein Inventory angegeben wird)
* [Organizing host and group variables](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#organizing-host-and-group-variables)
* [Keep vaulted variables safely visible](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#keep-vaulted-variables-safely-visible): `ansible-vault encrypt ansible/inventories/k4cg/group_vars/all/vault.yml`

#### Playbooks ausfuehren

* `ansible-playbook -v --vault-password-file ./ansible/vault-password-file ./ansible/homeassi.yml -i ./ansible/inventories/k4cg/inventory.yml`

#### Neue Secrets hinzufuegen

* `ansible-vault view ./ansible/inventories/k4cg/group_vars/all/vault.yml > vault.yml.tmp`
* Aenderungen machen
* `ansible-vault encrypt vault.yml.tmp`
* `mv vault.yml.tmp ./ansible/inventories/k4cg/group_vars/all/vault.yml`
