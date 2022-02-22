# TODO

* [x] Basic docker image bauen
* [ ] Github Actions:
  * [ ] bei Aenderung in Dockerfile:
  * [x] bei PR (Erstellung, Aktualisierung) und Push auf Branch: hadolint, bauen, security check
  * [ ] bei merge auf main: hadolint, bauen, security check, publishen
  * [ ] woechentlich hadolint, bauen, security check, publishen
* [ ] Github Workflows testen
  * [x] development (security scan)
  * [ ] merge auf main
  * [ ] trigger fuers neu bauen jede Woche
* [ ] Doku Github Actions
* [ ] Doku grundlegende Nutzung (docker pull..., docker run..., etc.)
* [ ] ansible einbauen und zum laufen bekommen
* [ ] ansible-lint einbauen
* [ ] Image bei Aenderungen in requirements und ansible_requirements neu bauen
* [ ] Playbook für Templates (Erstellung auf allen Hosts der Gruppe proxmox-hosts, Image, Name, Beschreibung, etc. parametrisierbar)
* [ ] Playbook für VMs (proxmox_kvm mit Parametern für cloud-init, qm resize danach, dann ggf. VM starten); übergreifende Variablen und Defaults in group_vars für Gruppe proxmox_vms, pro Host überschreibbar/konfigurierbar; Credentials in Vault/auf Kommandozeile übergeben
* [ ] Inventory basteln
* [ ] Grundlegende Pakete installieren, dev-sec-ops
* [ ] Ggf. Prometheus installieren
* [ ] Doku fuer ansible Nutzung
* [ ] terraform integrieren
* [ ] terraform cloud fuer tf state
* [ ] Doku fuer terraform Nutzung und terraform cloud
* [ ] buildah installieren (nach Upgrade/Wechsel auf Manjaro)
* [ ] Github Security (Upload von SARIF reports)

## Links

### Docker

* https://docs.docker.com/engine/reference/builder/#user
* https://matduggan.com/are-dockerfiles-good-enough/
* https://snyk.io/blog/10-docker-image-security-best-practices/

### Ansible

* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
* https://jdhao.github.io/2021/01/17/install_python3_in_ubuntu_docker/
* https://www.digitalocean.com/community/tutorials/how-to-set-up-ansible-inventories
* https://polarsquad.com/blog/ansible-best-practices-part-2
* https://github.com/zimmertr/Bootstrap-Kubernetes-with-QEMU/blob/master/playbooks/main/deploy_qcow2_vms.yml
* https://pip.pypa.io/en/stable/cli/pip_install/#requirement-specifiers
* https://www.michalklempa.com/2020/05/ansible-in-docker/

### Terraform

* https://morethancertified.com/terraform-in-docker/
