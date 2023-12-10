# imartin Helm Charts

![Static Badge][helm]
![GitHub License][license]
![GitHub Workflow Status (with event)][build]
![GitHub commit activity (branch)][activity]
![GitHub Release Date - Published_At][release]
[![Website][repostatus]](https://repsos.imartin.io)

The charts in this repo are applications that I either:

* Haven't found a reliable source from elsewhere
* Do things significantly different than other available charts (this could be because an existing chart doesn't offer features that I need - tends to be storage options, or use a `Statefulset` instead of a `Deployment`)

If you would like to use these charts, they are published to a full Helm repository at `repos.imartin.io/charts`

```
helm add repo imartin https://repos.imartin.io/charts
```

You'll notice that there is a Github release created for each chart in this repo. That is another option for use, as well as the GitHub Pages helm repo (`https://aztechian.github.io/charts/`). However, there are other repositories I have that will all publish to `repos.imartin.io`, so that is the recommended place for using the consolidation of all helm charts I maintain.


[activity]: https://img.shields.io/github/commit-activity/m/aztechian/charts?labelColor=green&cacheSeconds=86400
[release]: https://img.shields.io/github/release-date/aztechian/charts
[helm]: https://img.shields.io/badge/Helm%20Charts?logo=helm&color=blue
[build]: https://img.shields.io/github/actions/workflow/status/aztechian/charts/helm-lint.yaml
[license]: https://img.shields.io/github/license/aztechian/charts?color=orange
[repostatus]: https://img.shields.io/website?url=https%3A%2F%2Frepos.imartin.io%2Fcharts%2Findex.yaml&logo=helm&label=repo