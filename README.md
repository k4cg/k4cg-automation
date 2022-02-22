# k4cg automation

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

* https://github.blog/2022-02-02-build-ci-cd-pipeline-github-actions-four-steps/
* https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions
* Scheinbar (?) wird nur der Stand aus .github/workflows/... (main) genommen (siehe https://github.community/t/workflow-files-only-picked-up-from-master/16129).. Workaround ausprobieren: PR fuer Branch mit Aenderungen in Workflows machen. Dann triggert aber ein Push auf einen Branch, zu dem schon ein PR existiert, den Workflow mehrmals :/
* Jobs werden by default parallel ausgefuehrt. "needs: ...", um Abhaengigkeiten zu definieren
* Security Settings fuer Github Actions: Settings - Actions - General - Workflow permissions: https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token
