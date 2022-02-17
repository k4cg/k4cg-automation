# TODO

* [ ] Basic docker image bauen
* [ ] hadolint bei push auf branches/pr
* [ ] Github Actions:
  * [ ] bei Aenderung in Dockerfile:
  * [ ] bei PR (Erstellung, Aktualisierung) und Push auf Branch: hadolint, bauen, security check
  * [ ] bei merge auf main: hadolint, bauen, security check, publishen
  * [ ] woechentlich hadolint, bauen, security check, publishen
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


Test to see if this triggers the development workflow.
